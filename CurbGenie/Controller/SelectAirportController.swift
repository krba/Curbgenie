//
//  SelectAirportController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 11/28/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit
import Firebase

class SelectAirportController: UITableViewController, UISearchBarDelegate {
    
    let cellId = "cellId"
    
    //set up variables needed for the airports
    var airports = [Airport]() //array to hold all airports
    var filteredAirports = [Airport]()
    var inSearchMode = false
    
    //set up variable for 
    
    //allows access to controller
    var selectDateController : SelectDateController?
    
    //variables used to store airport info in order to segue to next screen
    var airportName: String = ""
    var airportCity: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register table view cell
        tableView.register(AirportCell.self, forCellReuseIdentifier: cellId)
        
        //searchBar setup
        airportSearchBar.delegate = self
        airportSearchBar.returnKeyType = UIReturnKeyType.done //specifies what the search button says
        airportSearchBar.placeholder = "Search for airport"
        navigationItem.titleView = airportSearchBar
        
        //custom back button
        let backButtonImage = UIImage(named: "back_btn") //SelectDateController
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        fetchAirports()
    }
    
    // MARK: Functions
    
    //load all airports from database
    @objc func fetchAirports() {
        
        //drop all values in the array then reconctruct a new array
        self.airports.removeAll()
        
        Database.database().reference().child("airports").observe(.childAdded, with: { (snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                //pull values from Firebase and add them to an array that will then be called to set up the table
                let airport = Airport()
                airport.setValuesForKeys(dictionary)
                self.airports.append(airport)
                
                DispatchQueue.main.async(execute: {
                    
                    self.tableView.reloadData()
                })
                
            }
            
        }, withCancel: nil)
        
    }
    
    @objc func sortAirports() {
        
        airports.sort(by: { (user1, user2) -> Bool in
            return (user1.name?.localizedLowercase)! < (user2.name?.localizedLowercase)!
        })
    } 
    
    //cancel and go back to root controller
    @objc func handleCancel() {
        self.navigationController?.popToRootViewController(animated: true)
        print("Cancel")
    }
    
    //sets the airport selected so it can be accessed in another VC
    @objc func showSelectAirlineController() {
        
        let selectAirlineController = SelectAirlineController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(selectAirlineController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selects the correct airport while in search mode
        if self.inSearchMode {

            //sets value for global variable
            selectedAirport = self.filteredAirports[indexPath.row]
            showSelectAirlineController()
            
            HomeModel.getInstance().airport = (selectedAirport?.name)!
            print("self.inSearchMode \(selectedAirport?.name) \(HomeModel.getInstance().airport)")
        } else {

            showSelectAirlineController()
            selectedAirport = self.airports[indexPath.row]
            
            HomeModel.getInstance().airport = (selectedAirport?.name)!
            print("!self.inSearchMode \(selectedAirport?.name) \(HomeModel.getInstance().airport)")
        }
        return
    }
    
    // MARK: Search bar
    
    lazy var airportSearchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 36, height: 12))
    
    @objc func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            tableView.reloadData()
            
        } else {
            
            inSearchMode = true
            let searchTerm = searchBar.text!
            //localizedStandardRange performs a case and diacritic insensitive search (helps avoid search from second letter on)
            filteredAirports = airports.filter({$0.name?.localizedStandardRange(of: searchTerm) != nil})
            tableView.reloadData()
        }
    }
    
    //dismiss keyboard when search clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    // MARK: Tableview setup

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return airports found in search or just the full array
        if inSearchMode {
            return filteredAirports.count
        }
        return airports.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let airport: Airport!
        
        sortAirports()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AirportCell
        cell.textLabel?.lineBreakMode = .byTruncatingTail
        
        //while searching, return only results which match
        if inSearchMode {
            airport = filteredAirports[indexPath.row]
            cell.textLabel?.text = airport.name
            cell.detailTextLabel?.text = airport.city //subtitle
            
            if let airportImageUrl = airport.airportImageUrl {
                cell.airportProfileImageView.loadImageUsingCacheWithUrlString(urlString: airportImageUrl)
            }
        } else {
            airport = airports[indexPath.row]
            cell.textLabel?.text = airport.name
            cell.detailTextLabel?.text = airport.city//subtitle
            
            if let airportProfileImageUrl = airport.airportImageUrl {
                cell.airportProfileImageView.loadImageUsingCacheWithUrlString(urlString: airportProfileImageUrl) //possibly reloading too many times
            }
        } 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

    //dismiss controller and goes back to previous VC
    @objc func handleBackButton() {
        //        dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
        print("Screen dismissed.")
    }
}
