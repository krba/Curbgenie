//
//  SummaryController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 12/23/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

class SummaryController: UIViewController {

    var confirmationController: ConfirmationController?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    weak var dismissNavigationBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(dismissButton)
        view.addSubview(confirmedImageView)
        view.addSubview(confirmedImageLabel)
        
        setupSummaryControllerUI()
        
        self.navigationItem.title = "Confirmed"
        
        var date = getDate(date: HomeModel.getInstance().bookDate);                                  let ndateFormatter = DateFormatter() 
        ndateFormatter.dateFormat = "MMMM dd, yyyy";
        let booking_date = ndateFormatter.string(from: date!);
        
        /* var start = HomeModel.getInstance().bookTime.index(HomeModel.getInstance().bookTime.startIndex, offsetBy: 0)
        var end = HomeModel.getInstance().bookTime.index(HomeModel.getInstance().bookTime.startIndex, offsetBy: 5)
        var range = start..<end
        var booking_time = String(HomeModel.getInstance().bookTime[range])
        
        start = booking_time.index(booking_time.startIndex, offsetBy: 0);        end = booking_time.index(booking_time.startIndex, offsetBy: 2)
        range = start..<end;                                                     booking_time = booking_time[range]
        print("booking_time \(booking_time[range])")
        
        start = HomeModel.getInstance().bookTime.index(HomeModel.getInstance().bookTime.startIndex, offsetBy: 2);
        end = HomeModel.getInstance().bookTime.index(HomeModel.getInstance().bookTime.startIndex, offsetBy: 5)
        range = start..<end;                                                     booking_time = booking_time[range]
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
        
        //
        //var arrayTimes = [String]();                                                          //["16:00", "16:30", "17:00", "17:30", "18:00", "18:30"]
        //arrayTimes.append(HomeModel.getInstance().bookTime)
        
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
        //}
        
        //print(arrayTimes)  // "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM"]
        
        confirmedImageLabel.text = "See you at \(selectedAirport?.name ?? "") on " + booking_date + " at " + booking_time
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
    
    //MARK: UI Objects
    lazy var dismissButton: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "dismiss_Btn")
        imageview.contentMode = .scaleAspectFill
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        imageview.layer.masksToBounds = true
        imageview.alpha = 1
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    var confirmedImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "confirmedCard")
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    var confirmedImageLabel: UILabel = {
        let label = UILabel()
        //label.text = "See you at \(selectedAirport?.name ?? "") on 12/22 at 3:00 PM"
        label.text = "See you at \(selectedAirport?.name ?? "") on " + HomeModel.getInstance().bookDate + " at " + HomeModel.getInstance().bookTime
        label.font = UIFont (name: "Nunito-Bold", size: 18)
        label.textColor  = .darkGray
        label.textAlignment = .center
//        label.backgroundColor = .red
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Functions
    @objc func handleDismiss() {
        
        self.navigationController?.popToRootViewController(animated: true)

        print("Dismiss all")
    }
    
    @objc func setupSummaryControllerUI() {
        
        //cancelButtonView constraints
        _ = dismissButton.anchor(view.safeTopAnchor, left: nil, bottom: nil, right: view.safeRightAnchor, topConstant: 32, leftConstant: 0, bottomConstant: 0, rightConstant: 24, widthConstant: 28, heightConstant: 28)
        
        //confirmedImageView constraints
        confirmedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmedImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        confirmedImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        confirmedImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        //confirmedImageLabel constrints
        confirmedImageLabel.bottomAnchor.constraint(equalTo: confirmedImageView.bottomAnchor, constant: -24).isActive = true
        confirmedImageLabel.centerXAnchor.constraint(equalTo: confirmedImageView.centerXAnchor, constant: 0).isActive = true
        confirmedImageLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        confirmedImageLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
    } 
}
