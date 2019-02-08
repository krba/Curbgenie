//
//  ModifyBookingController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 1/23/19.
//  Copyright © 2019 Paerdegat. All rights reserved.
//

import UIKit

class ModifyBookingController: UIViewController
{
    var bookingsController: BookingsController?;
    //var booking_date = "", booking_time = "", booking_airport = "", booking_airportCity = "", booking_airportImage = "", booking_airline = ""
    //var booking_airlineImage = "", booking_company = "", booking_companyImage = "", booking_price = "", booking_customerName = ""
    //var booking: Booking!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.title = "Modify Booking"
        
        //custom back button
        let backButtonImage = UIImage(named: "back_btn")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        let booking = bookings[Int(HomeModel.getInstance().idid)!]
        
        print("booking.date \(booking.date) booking.time \(booking.time) booking.airport \(booking.airport) booking.airportCity \(booking.airportCity) booking.airportImage \(booking.airportImage) booking.airline \(booking.airline) booking.airlineImage \(booking.airlineImage) booking.company \(booking.company) booking.companyImage \(booking.companyImage) booking.price \(booking.price) booking.customerName \(booking.customerName)")
        
        view.backgroundColor = .white
        view.addSubview(airportImageView)
        view.addSubview(detailsLabel)
        view.addSubview(priceLabel)
        view.addSubview(separatorLineView)
        view.addSubview(airlineTextLabel)
        view.addSubview(companyTextLabel)
        view.addSubview(airlineDescriptionImageView)
        view.addSubview(companyDescriptionImageView)
        view.addSubview(cancelBookingButton)
        view.addSubview(editBookingButton)
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        center.addObserver(self, selector: #selector(self.handleBackButton), name: NSNotification.Name("showBookingsController"), object: nil)
         
        airportImageView.image = UIImage(named: booking.airportImage)
        detailsLabel.text = "Curbside return at \n\(booking.airport) \non\n " + booking.date + " " + booking.time   //September 22 at 12:00 PM"
        airlineDescriptionImageView.image = UIImage(named: booking.airlineImage)
        companyDescriptionImageView.image = UIImage(named: booking.companyImage)
        HomeModel.getInstance().Book_Id = booking.id;
        HomeModel.getInstance().bookDate = booking.date;
        HomeModel.getInstance().bookTime = booking.time;
        HomeModel.getInstance().endDate = booking.endDate;
        HomeModel.getInstance().endTime = booking.endTime;
        setupModifyBookingControllerUI()
    }
    
    // MARK: UI Objects
    let airportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "")
        if screenHeight <= 568 { //remove image for small screens
            imageView.alpha = 0
        } else {
            imageView.alpha = 1
        }
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
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
        let image = ""    //selectedAirline?.image
        imageView.image = UIImage(named: image ?? "No image found")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //shows the selected rental company's image
    let companyDescriptionImageView: UIImageView = {
        let imageView = UIImageView()
        let image = ""    //selectedCompany?.image
        imageView.image = UIImage(named: image ?? "No image found")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let editBookingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor()
        button.setTitle("Edit Booking", for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleEditBooking), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelBookingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 237, g: 65, b: 65)
        button.setTitle("Cancel Booking", for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleCancelBooking), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Functions
    
    //dismiss controller and goes back to BookingsController
    @objc func handleBackButton()
    {
        DispatchQueue.main.async
        {
            _ = self.navigationController?.popViewController(animated: true)
            print("Screen dismissed.")
        }
    }
    
    //cancel and go back to root controller
    @objc func handleCancel() {
        DispatchQueue.main.async
        {
            self.navigationController?.popToRootViewController(animated: true)
            print("Cancel")
        }
    }
    
    @objc func handleEditBooking()
    {
        HomeModel.getInstance().register = 0
        let selectDateController = SelectDateController()
        //selectDateController.bookingsController = self
        navigationController?.pushViewController(selectDateController, animated: true) 
    }
    
    @objc func handleCancelBooking()
    {
        let alert = UIAlertController(title: "Confirm", message: "Are you sure you want to cancel this booking?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:
        {
            action in
            print("Cancel Confirmed")
            HomeModel.getInstance().download_progress = 1
            HomeModel.getInstance().showSyncAlert()
            HomeModel.getInstance().page = "cancelBook"
            HomeModel.getInstance().method = "getUserToken"
            HomeModel.getInstance().downloadItems()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)        
    }
    
    @objc func setupModifyBookingControllerUI () {
        
        //airportImageView constraints
        /* iPhone SE 568
         iPhone 6 667
         iPhone 6+ 736
         iPhone 7+ 736
         
         */
        _ = airportImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _ = airportImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180).isActive = true
        _ = airportImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        _ = airportImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //airportLabel constraints
        if screenHeight <= 568 {
            
            detailsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -96).isActive = true
        } else {
            detailsLabel.topAnchor.constraint(equalTo: airportImageView.bottomAnchor, constant: 8).isActive = true
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
        
        //cancelBookingButton constraints
        cancelBookingButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -24).isActive = true
        cancelBookingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelBookingButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cancelBookingButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        //editBookingButton constraints
        editBookingButton.bottomAnchor.constraint(equalTo: cancelBookingButton.topAnchor, constant: -12).isActive = true
        editBookingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        editBookingButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        editBookingButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
}
