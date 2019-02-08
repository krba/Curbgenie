//
//  ConfirmationController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 12/5/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

//global variable to access screen size
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ConfirmationController: UIViewController {

    var selectRentalController: SelectRentalController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(confirmationtImageView)
        view.addSubview(detailsLabel)
        view.addSubview(priceLabel)
        view.addSubview(separatorLineView)
        view.addSubview(airlineTextLabel)
        view.addSubview(companyTextLabel)
        view.addSubview(airlineDescriptionImageView)
        view.addSubview(companyDescriptionImageView)
        view.addSubview(termsLabel)
        view.addSubview(termsButton)
        view.addSubview(confirmDropoffButton)
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        center.addObserver(self, selector: #selector(self.showSummaryContrpller), name: NSNotification.Name("showSummaryContrpller"), object: nil)
        
        //custom back button
        let backButtonImage = UIImage(named: "back_btn")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        setupConfirmationControllerUI()
        
        if(HomeModel.getInstance().register == 1)
        {
            self.navigationItem.title = "Confirm Booking"
            confirmDropoffButton.setTitle("Confirm", for: UIControlState())
        }
        else
        {
            self.navigationItem.title = "Modify Booking"
            confirmDropoffButton.setTitle("Modify", for: UIControlState())
        }
        
        //yyyy-MM-dd'T'HH:mm:ss
        var date = getDate(date: HomeModel.getInstance().bookDate);                                  var ndateFormatter = DateFormatter()
        //print("249 date \(String(describing: date))")
        ndateFormatter.dateFormat = "MMMM dd, yyyy";                                   //+ "'T'" + start_time_string!h:mm a yyyy-MM-dd HH:mm";
        let booking_date = ndateFormatter.string(from: date!);
        
        /* var start = HomeModel.getInstance().bookTime.index(HomeModel.getInstance().bookTime.startIndex, offsetBy: 0)
        var end = HomeModel.getInstance().bookTime.index(HomeModel.getInstance().bookTime.startIndex, offsetBy: 5)
        var range = start..<end
        var booking_time = String(HomeModel.getInstance().bookTime[range])
        
        start = booking_time.index(booking_time.startIndex, offsetBy: 0)
        end = booking_time.index(booking_time.startIndex, offsetBy: 2)
        range = start..<end
        
        print("booking_time \(booking_time[range])")
        
        if(Int(booking_time[range])! >= 12)
        {
            if(Int(booking_time[range])! > 12) { booking_time = String(Int(booking_time[range])! - 12) }
            booking_time = booking_time + " PM"
        }
        else
        {
            booking_time = booking_time + " AM"
        } */
        
        var booking_time = ""
        let dateFormatter = DateFormatter();                                                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        //for (index, time) in arrayTimes.enumerated()
        //{
        dateFormatter.dateFormat = "H:mm"
        if let inDate = dateFormatter.date(from: HomeModel.getInstance().bookTime)
        {
            dateFormatter.dateFormat = "hh:mm a";                                            let outTime = dateFormatter.string(from:inDate)
            print("in \(HomeModel.getInstance().bookTime)");                                                            print("out \(outTime)")
            //arrayTimes[index] = outTime
            booking_time = outTime
        }
        
        detailsLabel.text = "Curbside return at \n\(selectedAirport?.name ?? "") \non\n " + booking_date + " at " + booking_time
    }
    
    func getDate(date: String) -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        //return dateFormatter.date(from: "2015-04-01T11:42:00")  // replace Date String
        //print("297 getDate \(date) \(dateFormatter.date(from: date+"T10:00:01"))")
        return dateFormatter.date(from: date+"T10:00:01")       // replace Date String
    }
    
    // MARK: UI Objects
    let confirmationtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "calendar")
        if screenHeight <= 568 { //remove image for small screens
            imageView.alpha = 0
        } else {
            imageView.alpha = 1
        }
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Curbside return at \n\(selectedAirport?.name ?? "") \non\n " + HomeModel.getInstance().bookDate + " at " + HomeModel.getInstance().bookTime
        //September 22 at 12:00 PM
        label.textColor = UIColor.gray
        label.font = UIFont (name: "Nunito-Black", size: 22)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
//        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 25"
        label.textColor = UIColor.mainColor()
        label.font = UIFont (name: "Nunito-Black", size: 28)
        label.textAlignment = .center
//        label.backgroundColor = .blue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let airlineTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Airline"
        label.font = UIFont(name: "Nunito-Regular", size: 16)
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let companyTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Company"
        label.font = UIFont(name: "Nunito-Regular", size: 16)
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //shows the selected airline's image
    let airlineDescriptionImageView: UIImageView = {
        let imageView = UIImageView()
        let image = selectedAirline?.image
        imageView.image = UIImage(named: image ?? "No image found")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //shows the selected rental company's image
    let companyDescriptionImageView: UIImageView = {
        let imageView = UIImageView()
        let image = selectedCompany?.image
        imageView.image = UIImage(named: image ?? "No image found")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.text = "By clicking Confirm, you agree to our"
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
        button.isUserInteractionEnabled = true
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(openTermsandConditions), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let confirmDropoffButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.secondaryColor()
        button.setTitle("Confirm", for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(confirmDropoff), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Functions
    
    @objc func showSummaryContrpller()
    {
        DispatchQueue.main.async
        {
            let summaryController = SummaryController()
            summaryController.confirmationController = self
            self.navigationController?.pushViewController(summaryController, animated: true)
        }
        
        print("Dropoff confirmed")
    }
    
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
    
    @objc func confirmDropoff()
    {
        if(HomeModel.getInstance().register == 1)
        {
            HomeModel.getInstance().download_progress = 1
            HomeModel.getInstance().showSyncAlert()
            HomeModel.getInstance().page = "book"
            HomeModel.getInstance().method = "getToken"
            HomeModel.getInstance().downloadItems()
        }
        else
        {
            HomeModel.getInstance().download_progress = 1
            HomeModel.getInstance().showSyncAlert()
            HomeModel.getInstance().page = "editBook"
            HomeModel.getInstance().method = "getUserToken"
            HomeModel.getInstance().downloadItems()
        }
    }
    
    //opens link to website
    @objc func openTermsandConditions() {
        
        let urlString = "https://www.curbgenie.com"
        let url = URL(string: urlString)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                
            })
        }
    }
    
    @objc func setupConfirmationControllerUI () {
        
        //airportImageView constraints
        /* iPhone SE 568
         iPhone 6 667
         iPhone 6+ 736
         iPhone 7+ 736

        */
        _ = confirmationtImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _ = confirmationtImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180).isActive = true
        _ = confirmationtImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        _ = confirmationtImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //airportLabel constraints
        if screenHeight <= 568 {
            
            detailsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -96).isActive = true
        } else {
            detailsLabel.topAnchor.constraint(equalTo: confirmationtImageView.bottomAnchor, constant: 8).isActive = true
        }
        detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailsLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        detailsLabel.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        //airportLabel constraints
        priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 0).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 72).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //separatorLineView constraints
        separatorLineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4).isActive = true
        separatorLineView.widthAnchor.constraint(equalToConstant: screenWidth/1.25).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //airlineTextLabel constraints
        airlineTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        airlineTextLabel.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 8).isActive = true
        airlineTextLabel.widthAnchor.constraint(equalToConstant: screenWidth/2).isActive = true
        airlineTextLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //companyTextLabel constraints
        companyTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        companyTextLabel.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 8).isActive = true
        companyTextLabel.widthAnchor.constraint(equalToConstant: screenWidth/2).isActive = true
        companyTextLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //airlineDescriptionImageView constraints
        airlineDescriptionImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        airlineDescriptionImageView.topAnchor.constraint(equalTo: companyTextLabel.bottomAnchor, constant: 16).isActive = true
        airlineDescriptionImageView.widthAnchor.constraint(equalToConstant: screenWidth/2).isActive = true
        airlineDescriptionImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        //companyDescriptionImageView constraints
        companyDescriptionImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        companyDescriptionImageView.topAnchor.constraint(equalTo: companyTextLabel.bottomAnchor, constant: 16).isActive = true
        companyDescriptionImageView.widthAnchor.constraint(equalToConstant: screenWidth/2).isActive = true
        companyDescriptionImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        //termsLabel constraints
        termsLabel.bottomAnchor.constraint(equalTo: confirmDropoffButton.topAnchor, constant: -12).isActive = true
        termsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -52).isActive = true
        termsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        termsLabel.widthAnchor.constraint(equalToConstant: 205).isActive = true
        
        //termsButton constraints
        termsButton.leftAnchor.constraint(equalTo: termsLabel.rightAnchor).isActive = true
        termsButton.centerYAnchor.constraint(equalTo: termsLabel.centerYAnchor).isActive = true
        termsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        termsButton.widthAnchor.constraint(equalToConstant: 108).isActive = true
        
        //confirmDropoffButton constraints
        confirmDropoffButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmDropoffButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        confirmDropoffButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        confirmDropoffButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
} 
