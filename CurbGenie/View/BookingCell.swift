//
//  BookingCell.swift
//  CurbGenie
//
//  Created by Colin Horsford on 1/19/19.
//  Copyright © 2019 Paerdegat. All rights reserved.
//

import UIKit

//cell construction for the BookingsController table view
class BookingCell: UICollectionViewCell {
    
    /*
     NOT NEEDED SINCE THE TABLEVIEW WILL BE FILLED OUT FROM THE SIMPLYBOOK
     */
    
    //set airline name and image
    var booking: Booking? {
        didSet {
            
            guard let confirmationCode = booking?.confirmationCode else { return }
            guard let date = booking?.date else { return }
            guard let time = booking?.time else { return }
            guard let airport = booking?.airport else { return }
            guard let airportCity = booking?.airportCity else { return }
            guard let airportImage = booking?.airportImage else { return }
            guard let airline = booking?.airline else { return }
            guard let airlineImage = booking?.airlineImage else { return }
            guard let company = booking?.company else { return }
            guard let companyImage = booking?.companyImage else { return }
            guard let price = booking?.price else { return }
            guard let customerName = booking?.customerName else { return }
            
            airlineImageView.image = UIImage(named: airlineImage)
            airportNameLabel.text = airport
            airportCityLabel.text = airportCity
            dateLabel.text = date
            timeLabel.text = time
            airportImageView.image = UIImage(named: airportImage)
            companyImageView.image = UIImage(named: companyImage)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBookingCell()
    }
    
    @objc func setupBookingCell() {
        
        self.backgroundColor = .white
        
        self.addSubview(airportImageView)
        self.addSubview(airportNameLabel)
        self.addSubview(airportCityLabel)
        self.addSubview(dateIcon)
        self.addSubview(dateLabel)
        self.addSubview(clockIcon)
        self.addSubview(timeLabel)
        self.addSubview(planeIcon)
        self.addSubview(airlineImageView)
        self.addSubview(carIcon)
        self.addSubview(companyImageView)
        
        //airportImageView Constraints
        airportImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        airportImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        airportImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        airportImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //airportNameLabel Constraints
        airportNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        airportNameLabel.leftAnchor.constraint(equalTo: airportImageView.rightAnchor, constant: 8).isActive = true
        airportNameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        airportNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //airportCityLabel constraints
        airportCityLabel.topAnchor.constraint(equalTo: airportNameLabel.bottomAnchor, constant: 2).isActive = true
        airportCityLabel.leftAnchor.constraint(equalTo: airportNameLabel.leftAnchor, constant: 0).isActive = true
        airportCityLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        airportCityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //dateIcon constraints
        dateIcon.topAnchor.constraint(equalTo: airportCityLabel.bottomAnchor, constant: 8).isActive = true
        dateIcon.leftAnchor.constraint(equalTo: airportCityLabel.leftAnchor, constant: 0).isActive = true
        dateIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        dateIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //dateLabel constraints
        dateLabel.topAnchor.constraint(equalTo: airportCityLabel.bottomAnchor, constant: 8).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: dateIcon.rightAnchor, constant: 8).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //clockIcon constraints
        clockIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        clockIcon.centerXAnchor.constraint(equalTo: airportImageView.centerXAnchor, constant: 0).isActive = true
        clockIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        clockIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //timeLabel constraints
        timeLabel.leftAnchor.constraint(equalTo: clockIcon.rightAnchor, constant: 8).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: clockIcon.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //planeIcon constraints
        planeIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        planeIcon.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 12).isActive = true
        planeIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        planeIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //airlineImageView Constraints
        airlineImageView.leftAnchor.constraint(equalTo: planeIcon.rightAnchor, constant: 8).isActive = true
        airlineImageView.centerYAnchor.constraint(equalTo: planeIcon.centerYAnchor, constant: 0).isActive = true
        airlineImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        airlineImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //carIcon constraints
        carIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        carIcon.leftAnchor.constraint(equalTo: airlineImageView.rightAnchor, constant: 12).isActive = true
        carIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        carIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //companyImageView Constraints
        companyImageView.leftAnchor.constraint(equalTo: carIcon.rightAnchor, constant: 2).isActive = true
        companyImageView.centerYAnchor.constraint(equalTo: carIcon.centerYAnchor, constant: 0).isActive = true
        companyImageView.widthAnchor.constraint(equalToConstant: 72).isActive = true
        companyImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
        //set up cell shadow
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 3
    }
    
    let airportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let airportNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont (name: "Nunito-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airportCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont (name: "Nunito-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "dateIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont (name: "Nunito-Regular", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let clockIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "clockIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont (name: "Nunito-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let planeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "planeIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let airlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let carIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "carIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let companyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
