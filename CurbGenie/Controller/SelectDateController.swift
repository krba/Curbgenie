//
//  BookNowController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 11/27/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

class SelectDateController: UIViewController {

    var bookingsController: BookingsController?
    var ModifyBookingController: ModifyBookingController?
    
    var datePicker: UIDatePicker!
    var only_year = "", only_month = "", only_date = "", week_only_year = "", week_only_month = "", week_only_date = "", calendar_day_flag = 0, calendar_month_flag = 1, day_names = [ "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" ], weekday_no = 0, day_of_week  = "", first_weekday_no = 0, numDays = 0, month_names = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ], day_values = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" ];
    let width = UIScreen.main.bounds.size.width; let height = UIScreen.main.bounds.size.height
    var previous_week = UIButton(), month = UIButton(), year = UIButton(), next_week = UIButton(), today = UIButton(), week = UIButton(), this_week = UIButton()
    
    var temp_month = 0, temp_year = 0, starting_date = 0, prev_month_numofdays = 0, start_date = "", end_date = "", tag_array = [String](), topBarHeight = CGFloat(0.0), mainBackground = UIView(), monthBackground = UIView(), weekBackground = UIView()
    
    var week_start_year = "", week_start_month = "", week_start_date = "", today_date = "", today_month = "", today_year = "", week_end_date = "", week_end_month = "", week_end_year = "", but = UIButton(), weekDateArray = [String](), weekMonthArray = [String](), weekYearArray = [String](),
    selectedDate = Date(), uv = UIView(), monthDateArray = [String](), monthMonthArray = [String](), monthYearArray = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker.center = view.center
        view.addSubview(datePicker)
        
        //datePicker.addTarget(self, action: "handleDateSelected:", for: .valueChanged)

        view.backgroundColor = .white
        view.addSubview(selectDateButton)
        
        // MAIN: Navigation bar setup
        let backButtonImage = UIImage(named: "back_btn")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(SelectDateController.handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        setupUI()
        
        if(HomeModel.getInstance().register == 1)
        {
            navigationItem.title = "Select Date"
            selectDateButton.setTitle("Select Date", for: UIControlState())
        }
        else
        {
            navigationItem.title = "Select Start Date"
            selectDateButton.setTitle("Select Start Date", for: UIControlState())
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "MMMM dd, yyyy hh:mm a" // "MMMM dd, yyyy HH:mm"
            
            print("59 bookDate \(HomeModel.getInstance().bookDate) bookTime \(HomeModel.getInstance().bookTime)")
            
            let date = dateFormatter.date(from: HomeModel.getInstance().bookDate + " " + HomeModel.getInstance().bookTime)
            
            datePicker.date = date!
        }
    }
    
    let selectDateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor()
        button.setTitle("Select Date", for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSelectDate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
    
    @objc func handleSelectDate()
    { 
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        HomeModel.getInstance().bookDate = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "HH:mm"
        HomeModel.getInstance().bookTime = formatter.string(from: datePicker.date)
        
        print("Date selected bookDate \(HomeModel.getInstance().bookDate) bookTime \(HomeModel.getInstance().bookTime)")
        //to be updated
        if(HomeModel.getInstance().register == 1)
        {
            showSelectAirportController()
        }
        else
        {
            let selectEndDateController = SelectEndDateController()
            //selectEndDateController.bookingsController = self
            navigationController?.pushViewController(selectEndDateController, animated: true)
        }
    }
    
    @objc func showSelectAirportController () {
        
        let selectAirportController = SelectAirportController()
        selectAirportController.selectDateController = self
        navigationController?.pushViewController(selectAirportController, animated: true)
    }
    
    @objc func setupUI() {
        
        //selectDateButton constraints
        selectDateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectDateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        selectDateButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        selectDateButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    } 
}
