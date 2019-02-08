//
//  SelectAirlineController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 12/2/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectAirlineController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Select Airline"
        
        //custom back button
        let backButtonImage = UIImage(named: "back_btn")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(SelectDateController.handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))

        // Register cell classes
        collectionView?.register(AirlineCell.self, forCellWithReuseIdentifier: cellId)

    }

    // MARK: Functions
    
    //dismiss controller and goes back to BookingsController
    @objc func handleBackButton() {
        _ = navigationController?.popViewController(animated: true)
        print("Screen dismissed.")
    }
    
    //cancel and go back to root controller
    @objc func handleCancel() {
        self.navigationController?.popToRootViewController(animated: true)
        print("Cancel")
    }
    
    //sets the airline selected so it can be accessed in another VC
    @objc func showSelectRentalController() {
        
        let selectRentalController = SelectRentalController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(selectRentalController, animated: true)
        
    }
    
    func sortAirlines() {
        
        let sortedAirlines = airlines.sorted { ($0.name, $0.image) < ($1.name, $0.image)}
        print(sortedAirlines)
    }
    
    // MARK: - CollectionView setup
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return airlines.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AirlineCell
        cell.airline = airlines[indexPath.item]

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //sets value for global variable
        selectedAirline = airlines[indexPath.item]
        
        HomeModel.getInstance().airline = (selectedAirline?.name)!
        print("selectedAirline.name \(selectedAirline?.name) \(HomeModel.getInstance().airline)")
        
        showSelectRentalController() 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/3) - 16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
    }

}
