//
//  BookNowController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 11/27/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

class SelectEndDateController: UIViewController {
    
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.title = "Select End Date"
        
        setupUI()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "MMMM dd, yyyy HH:mm" //-MM-dd
        
        print("50 endDate \(HomeModel.getInstance().endDate) endTime \(HomeModel.getInstance().endTime)")
        
        let date = dateFormatter.date(from: HomeModel.getInstance().endDate + " " + HomeModel.getInstance().endTime)
        datePicker.date = date!
        
        /* 260119 topBarHeight = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
         
         mainBackground = UIView(frame: CGRect(x:0, y:topBarHeight, width: width, height: height - topBarHeight))
         mainBackground.backgroundColor = UIColor(rgb: 0x342D46);         //UIColor(rgb: 0x2A213D);
         view.addSubview(mainBackground) */
        
        /* monthBackground = UIView(frame: CGRect(x:0, y:topBarHeight, width: width, height: topBarHeight + height * (40 / 100)))
         monthBackground.backgroundColor = UIColor(rgb: 0x2A213D);
         view.addSubview(monthBackground)
         
         weekBackground = UIView(frame: CGRect(x:0, y:topBarHeight, width: width, height: height - topBarHeight))
         weekBackground.backgroundColor = UIColor(rgb: 0x2A213D);
         view.addSubview(weekBackground) */
        
        //calendar_day_flag = 0;                      calendar_month_flag = 1;                                showtoday()
        //calendar_month_flag = 0;                    calendar_day_flag = 0;                                  showtodayforweek()
    }
    
    let selectDateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor()
        button.setTitle("Select End Date", for: UIControlState())
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
        HomeModel.getInstance().endDate = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "HH:mm"
        HomeModel.getInstance().endTime = formatter.string(from: datePicker.date)
        
        print("Date selected bookDate \(HomeModel.getInstance().bookDate) bookTime \(HomeModel.getInstance().bookTime)")
        //to be updated
         
        showSelectAirportController()
    }
    
    @objc func showSelectAirportController () {
        
        let selectAirportController = SelectAirportController()
        //selectAirportController.selectDateController = self
        navigationController?.pushViewController(selectAirportController, animated: true)
    }
    
    @objc func setupUI() {
        
        //selectDateButton constraints
        selectDateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectDateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        selectDateButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        selectDateButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    /* func load_calendar_month(notification: NSNotification)
     {
     dispatch_async(dispatch_get_main_queue(), { () -> Void in self.calendar_day_flag = 0; self.calendar_month_flag = 1; self.showtoday() })
     //loadlocallist()
     } */
    
    @objc func showtoday()
    {
        let date = NSDate();                                let formatter = DateFormatter();                  formatter.dateFormat = "yyyy-MM-dd";
        formatter.timeZone = NSTimeZone.local;              let year_formatter = DateFormatter();             year_formatter.dateFormat = "yyyy";
        year_formatter.timeZone = NSTimeZone.local          //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();                                                                month_formatter.dateFormat = "MM";
        month_formatter.timeZone = NSTimeZone.local;                                                          let date_formatter = DateFormatter();
        date_formatter.dateFormat = "dd";                                                                     date_formatter.timeZone = NSTimeZone.local
        only_year = year_formatter.string(from: date as Date);                                  only_month = month_formatter.string(from: date as Date);
        only_date = date_formatter.string(from: date as Date);
        
        print("showtoday formatter.stringFromDate(date) \(formatter.string(from: date as Date)) only_year \(only_year) only_month \(only_month) only_date \(only_date)");
        
        if let weekday = getDayOfWeek(today: formatter.string(from: date as Date))
        { weekday_no = weekday; print("weekday \(weekday)"); day_of_week = day_names[weekday-1] } else { print("bad input") } //"2014-08-27"
        
        selectedDate = Date()
        
        getWholeWeekDays(date: selectedDate)
        
        if calendar_month_flag == 0 { /* calendar_day() */ } else { calendar_month() }
    }
    
    func getWholeWeekDays(date: Date)
    {
        let formatter = DateFormatter();                  formatter.dateFormat = "yyyy-MM-dd";              formatter.timeZone = NSTimeZone.local;
        let year_formatter = DateFormatter();             year_formatter.dateFormat = "yyyy";
        year_formatter.timeZone = NSTimeZone.local          //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();                                                                month_formatter.dateFormat = "MM";
        month_formatter.timeZone = NSTimeZone.local;                                                          let date_formatter = DateFormatter();
        date_formatter.dateFormat = "dd";                                                                     date_formatter.timeZone = NSTimeZone.local
        
        if let weekday_1 = getDayOfWeek(today: formatter.string(from: date as Date))
        {
            print("getWholeWeekDays weekday_1 \(weekday_1)");
            
            weekDateArray = [String]();     weekMonthArray = [String]();    weekYearArray = [String]()
            
            if weekday_1 == 1
            {
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.monday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.monday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.monday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.tuesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.tuesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.tuesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.wednesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.wednesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.wednesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.thursday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.thursday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.thursday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.friday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.friday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.friday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.saturday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.saturday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.saturday) as Date));
            }
            
            if weekday_1 == 2
            {
                weekDateArray.append(date_formatter.string(from: date.previous(.sunday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.sunday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.sunday) as Date));
                
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.tuesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.tuesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.tuesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.wednesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.wednesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.wednesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.thursday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.thursday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.thursday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.friday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.friday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.friday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.saturday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.saturday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.saturday) as Date));
            }
            
            if weekday_1 == 3
            {
                weekDateArray.append(date_formatter.string(from: date.previous(.sunday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.sunday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.sunday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.monday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.monday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.monday) as Date));
                
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.wednesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.wednesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.wednesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.thursday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.thursday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.thursday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.friday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.friday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.friday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.saturday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.saturday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.saturday) as Date));
            }
            
            if weekday_1 == 4
            {
                weekDateArray.append(date_formatter.string(from: date.previous(.sunday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.sunday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.sunday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.monday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.monday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.monday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.tuesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.tuesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.tuesday) as Date));
                
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.thursday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.thursday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.thursday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.friday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.friday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.friday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.saturday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.saturday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.saturday) as Date));
            }
            
            if weekday_1 == 5
            {
                weekDateArray.append(date_formatter.string(from: date.previous(.sunday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.sunday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.sunday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.monday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.monday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.monday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.tuesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.tuesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.tuesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.wednesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.wednesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.wednesday) as Date));
                
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.friday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.friday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.friday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.saturday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.saturday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.saturday) as Date));
            }
            
            if weekday_1 == 6
            {
                weekDateArray.append(date_formatter.string(from: date.previous(.sunday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.sunday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.sunday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.monday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.monday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.monday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.tuesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.tuesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.tuesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.wednesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.wednesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.wednesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.thursday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.thursday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.thursday) as Date));
                
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
                
                weekDateArray.append(date_formatter.string(from: date.next(.saturday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.next(.saturday) as Date));
                weekYearArray.append(year_formatter.string(from: date.next(.saturday) as Date));
            }
            
            if weekday_1 == 7
            {
                weekDateArray.append(date_formatter.string(from: date.previous(.sunday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.sunday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.sunday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.monday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.monday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.monday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.tuesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.tuesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.tuesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.wednesday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.wednesday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.wednesday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.thursday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.thursday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.thursday) as Date));
                
                weekDateArray.append(date_formatter.string(from: date.previous(.friday) as Date));
                weekMonthArray.append(month_formatter.string(from: date.previous(.friday) as Date));
                weekYearArray.append(year_formatter.string(from: date.previous(.friday) as Date));
                
                weekYearArray.append(year_formatter.string(from: date as Date));
                weekMonthArray.append(month_formatter.string(from: date as Date));
                weekDateArray.append(date_formatter.string(from: date as Date));
            }
            
        } else { print("bad input") } //"2014-08-27"
    }
    
    
    func getDayOfWeek(today:String)->Int?
    {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.date(from: today)
        {
            let calendar = Calendar(identifier: .gregorian)
            let weekDay = calendar.component(.weekday, from: todayDate)
            return weekDay
        }
        else
        {
            return nil
        }
    }
    
    @objc func calendar_month()
    {
        getStartEndOfWeek(date: selectedDate)
        /* let filemgr = FileManager.defaultManager();
         let dirPaths = filemgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
         databasePath = dirPaths[0].URLByAppendingPathComponent("curbgenie.db").path!;
         contactDB = FMDatabase(path: self.databasePath as String);  contactDB.open() */
        
        calendar_month_flag = 1
        
        /* if self.win.viewWithTag(32) != nil
         { if let viewWithTag = self.win.viewWithTag(32) { print("showyearslist() Tag 32"); viewWithTag.removeFromSuperview() } } */
        
        if let first_weekday = getDayOfWeek(today: only_year + "-" + only_month + "-01")
        {   print("first_weekday \(first_weekday)"); first_weekday_no = first_weekday; } else { print("first_weekday bad input") } //"2014-08-27"
        
        let dateComponents = DateComponents(year: Int(only_year)!, month: Int(only_month)!);                            let calendar = Calendar.current
        let dat = calendar.date(from: dateComponents)!;                                      let range = calendar.range(of: .day, in: .month, for: dat)!
        let numDays = range.count
        print("numDays \(numDays)") // 31
        
        //Previous month
        //self.previous_week = UIButton(frame: CGRect(x: self.width * (15/100), y: self.height * (12/100), width: self.width * (8/100), height: self.height * (5/100)))
        self.previous_week = UIButton(frame: CGRect(x: 0, y: topBarHeight, width: self.width * (25/100), height: self.height * (5/100)))
        self.previous_week.setTitleColor(UIColor.white, for: []);                          self.previous_week.isExclusiveTouch = true
        self.previous_week.setTitle("<- Prev Month", for: []);
        self.previous_week.backgroundColor = UIColor(rgb: 0x342D46)     //UIColor(rgb: 0x00b4ff)
        self.previous_week.addTarget(self, action: #selector(self.showprevmonth), for: UIControlEvents.touchUpInside)
        self.previous_week.titleLabel!.textAlignment = .center;
        self.previous_week.titleLabel!.font = UIFont.systemFont(ofSize: self.previous_week.titleLabel!.font.pointSize - 5)
        self.view.addSubview(self.previous_week)
        
        //Month
        self.month = UIButton(frame: CGRect(x: self.width * (25/100), y: topBarHeight, width: self.width * (50/100), height: self.height * (5/100)))
        self.month.setTitleColor(UIColor.white, for: []);  self.month.isExclusiveTouch = true
        self.month.setTitle(month_names[Int(only_month)! - 1] + " " + only_year, for: [])
        self.month.backgroundColor = UIColor(rgb: 0x342D46)     //UIColor(rgb: 0x00b4ff)
        //self.month.addTarget(self, action: #selector(self.showmonthslist_month), forControlEvents: UIControlEvents.TouchUpInside)
        self.month.titleLabel!.textAlignment = .center
        self.month.titleLabel!.font = UIFont.boldSystemFont(ofSize: self.month.titleLabel!.font.pointSize)
        self.view.addSubview(self.month)
        
        /* //Year
         self.year = UIButton(frame: CGRect(x: self.width * (40/100), y: topBarHeight, width: self.width * (15/100), height: self.height * (5/100)))
         self.year.setTitleColor(UIColor.white, for: []);  self.year.isExclusiveTouch = true
         self.year.setTitle(only_year, for: [])
         self.year.backgroundColor = UIColor(rgb: 0x00b4ff)
         //self.year.addTarget(self, action: #selector(self.showyearslist_month), forControlEvents: UIControlEvents.TouchUpInside)
         self.year.titleLabel!.textAlignment = .center
         self.year.titleLabel!.font = UIFont.boldSystemFont(ofSize: self.year.titleLabel!.font.pointSize)
         self.view.addSubview(self.year) */
        
        //Next month
        self.next_week = UIButton(frame: CGRect(x: self.width * (75/100), y: topBarHeight, width: self.width * (25/100), height: self.height * (5/100)))
        self.next_week.setTitleColor(UIColor.white, for: []);  self.next_week.isExclusiveTouch = true
        self.next_week.setTitle("Next Month ->", for: [])
        self.next_week.backgroundColor = UIColor(rgb: 0x342D46)     //UIColor(rgb: 0x00b4ff)
        self.next_week.addTarget(self, action: #selector(self.shownextmonth), for: UIControlEvents.touchUpInside)
        self.next_week.titleLabel!.textAlignment = .center
        self.next_week.titleLabel!.font = UIFont.systemFont(ofSize: self.next_week.titleLabel!.font.pointSize - 5)
        self.view.addSubview(self.next_week)
        
        /* //This Month
         self.today = UIButton(frame: CGRect(x: self.width * (65/100), y: topBarHeight, width: self.width * (25/100), height: self.height * (5/100)))
         self.today.setTitleColor(UIColor.white, for: []);  self.today.isExclusiveTouch = true
         self.today.setTitle("This Month", for: [])
         self.today.backgroundColor = UIColor(rgb: 0x00b4ff)
         //self.today.addTarget(self, action: #selector(self.showtoday), forControlEvents: UIControlEvents.TouchUpInside)
         self.today.titleLabel!.textAlignment = .center
         self.today.titleLabel!.font = UIFont.boldSystemFont(ofSize: self.today.titleLabel!.font.pointSize)
         self.view.addSubview(self.today) */
        
        if self.view.viewWithTag(100) != nil
        { if let viewWithTag = self.view.viewWithTag(100) { print("477 view() Tag 100"); viewWithTag.removeFromSuperview() } }
        
        for ab in 1000 ..< 1042
        {
            if self.view.viewWithTag(ab) != nil
            { if let viewWithTag = self.view.viewWithTag(ab) { print("482 view() Tag ab \(ab)"); viewWithTag.removeFromSuperview() } }
        }
        
        uv = UIView(frame: CGRect(x: 0, y: topBarHeight + self.height * (5/100), width: self.width, height: self.height * (35/100))); //81
        uv.tag = 100
        uv.backgroundColor = UIColor(rgb: 0x342D46)  //UIColor(rgb: 0xF0FFFF)
        var button = UIButton(), inc = CGFloat(0.0), inc_y = CGFloat(self.height * (12.8/100)), d = 0, tx = 0, ty = 0, tw = self.width/7, th = self.height * (5/100), month_cell_count = 1000
        
        for b in 0 ..< 7
        {
            var lab = UILabel(frame: CGRect(x: inc, y: 0, width: self.width / 7, height: self.height * (35/100)));
            //lab.layer.borderColor = UIColor(rgb: 0xe8e8e8).cgColor;
            lab.layer.borderWidth = 1;                                                              uv.addSubview(lab)
            
            print("b \(b)  self.day_values[b] \(self.day_values[b])")
            lab = UILabel(frame: CGRect(x: inc, y: 0, width: self.width / 7, height: self.height * (5/100) ));
            lab.backgroundColor = UIColor(rgb: 0x342D46) //UIColor(rgb: 0xf5f5f5)
            
            if(self.day_names[b] == "SUN" || self.day_names[b] == "SAT") { lab.textColor = UIColor(rgb: 0xCF6667) }
            else { lab.textColor = UIColor.white; }
            
            lab.text = self.day_names[b]                                //+ "\n" + String(temp_month) + "/" + String(starting_date);
            lab.textAlignment = .center;                                lab.font = UIFont.boldSystemFont(ofSize: lab.font!.pointSize);
            lab.numberOfLines = 0;                                      uv.addSubview(lab);                inc_y = CGFloat(self.height * (5/100));
            d = b - (first_weekday_no - 1)
            //print("d \(d)")
            
            for c in 0 ..< 6
            {
                /* lab = UILabel(frame: CGRect(x: inc, y: inc_y, width: self.width / 7, height: self.height * (5/100) )); //12.66
                 lab.backgroundColor = UIColor(rgb: 0x342D46) //UIColor(rgb: 0xe8e8e8)
                 lab.textColor = UIColor.white;
                 //lab.text = self.day_names[b] //+ "\n" + String(temp_month) + "/" + String(starting_date);
                 lab.textAlignment = .center;                                lab.font = UIFont.boldSystemFont(ofSize: lab.font!.pointSize - 5);
                 lab.numberOfLines = 0;                                      lab.layer.borderColor = UIColor(rgb: 0xf5f5f5).cgColor;
                 lab.layer.borderWidth = 1;                                  uv.addSubview(lab); */
                
                //tx = inc + ( (tw/2) - ((tw/3)/2) )
                //ty = inc_y + ( (th/2) - ((th/3)/2) )
                
                //lab = UILabel(frame: CGRect(x: inc + ( (tw/2) - ((tw/3)/2) ), y: inc_y + ( (th/2) - ((th/3)/2) ), width: (self.width/7)/3, height: (self.height * (5/100))/3)); //12.66
                
                but = UIButton(type: UIButton.ButtonType.custom) as UIButton;                                              but.isExclusiveTouch = true
                but.frame = CGRect( x: inc + 2, y: inc_y + 2, width: (self.width / 7) - 4, height: (self.height * (5/100)) - 4 )
                but.backgroundColor = UIColor(rgb: 0x342D46);
                but.setTitleColor(UIColor.white, for: []);
                but.titleLabel!.textAlignment = .center
                but.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
                but.tag = month_cell_count
                but.addTarget(self, action: #selector(self.selectDate), for: UIControlEvents.touchUpInside)
                
                /* lab = UILabel(frame: CGRect(x: inc, y: inc_y, width: self.width / 7, height: self.height * (5/100) ));
                 lab.textColor = UIColor.white;
                 //lab.text = self.day_names[b] //+ "\n" + String(temp_month) + "/" + String(starting_date);
                 lab.textAlignment = .center;                                lab.font = UIFont.boldSystemFont(ofSize: lab.font!.pointSize);
                 lab.numberOfLines = 0; */
                //lab.layer.borderColor = UIColor(rgb: 0xe8e8e8).CGColor; lab.layer.borderWidth = 1;
                //uv.addSubview(lab);
                uv.addSubview(but);
                
                if d >= 0 && d <= numDays - 1
                {
                    //lab.text = self.day_values[d];
                    but.setTitle(self.day_values[d], for: []);
                    but.accessibilityIdentifier = self.day_values[d] + "-" + only_month + "-" + only_year
                    if self.day_values[d] == only_date || "0" + self.day_values[d] == only_date
                    {
                        //lab.backgroundColor = UIColor(rgb: 0x7000FF)
                        //but.backgroundColor = UIColor(rgb: 0x7000FF);
                    }
                    
                    /* let results : FMResultSet? = contactDB.executeQuery("SELECT * FROM FConnect__Service_Order__c", withArgumentsInArray: nil);
                     var matching_count = 0
                     var wo_inc_x = inc + (self.width / 7) / 3, wo_inc_y = inc_y
                     while results!.next()
                     {
                     print("calendar_month() FConnect__Service_Order__c results Id \(results!.stringForColumn("Id")), Name \(results!.stringForColumn("Name")) FConnect__Estimated_Start_date__c \(results!.stringForColumn("FConnect__Estimated_Start_date__c"))")
                     
                     var start_date_array = results!.stringForColumn("FConnect__Estimated_Start_date__c").componentsSeparatedByString("T");
                     var start_date_array_1 = start_date_array[0].componentsSeparatedByString("-");
                     
                     print("calendar_month() start_date_array_1[0] \(start_date_array_1[0]) start_date_array_1[1] \(start_date_array_1[1]) start_date_array_1[2] \(start_date_array_1[2])")
                     
                     print("calendar_month() String(only_year) \(String(only_year)) String(only_month) \(String(only_month)) self.day_values[d] \(self.day_values[d])")
                     
                     if start_date_array_1[0] == String(only_year) && (start_date_array_1[1] == String(only_month) || start_date_array_1[1] == "0" + String(only_month)) && (start_date_array_1[2] == self.day_values[d] || start_date_array_1[2] == "0" + self.day_values[d])
                     {
                     matching_count = matching_count + 1; let wo_array = results!.stringForColumn("Name").componentsSeparatedByString("-"); //start_date_array_1[0]
                     
                     //let random = Int(arc4random_uniform(9999999 - 1000000) + 1000000)
                     //tag_array.append(String(random) + "*" + start_date_array_1[0] + "*" + start_date_array_1[1] + "*" + start_date_array_1[2] + "*" +  wo_array[1])
                     
                     print("calendar_month() matching start_date_array_1[0] \(start_date_array_1[0]) start_date_array_1[1] \(start_date_array_1[1]) start_date_array_1[2] \(start_date_array_1[2]) tag \(String(random)) \(start_date_array_1[0])  \(start_date_array_1[1]) \(start_date_array_1[2]) \(wo_array[1])")
                     
                     button = UIButton(type: UIButtonType.System) as UIButton; button.exclusiveTouch = true;
                     button.frame = CGRectMake(wo_inc_x, wo_inc_y, (self.width / 7) / 3 , (self.height * (12.66/100)) / 3);
                     button.titleLabel?.font = UIFont.systemFontOfSize((button.titleLabel?.font.pointSize)! - 7)
                     button.setTitle(results!.stringForColumn("Name"), forState: .Normal);
                     button.setTitleColor(UIColor.blackColor(), forState: .Normal);
                     button.tag = Int(wo_array[1])!; // calendar_month_wodetailsrandom;
                     button.addTarget(self, action: #selector(self.calendar_onclick), forControlEvents: UIControlEvents.TouchUpInside);
                     uv.addSubview(button)
                     
                     switch matching_count
                     {
                     case 1: wo_inc_x = wo_inc_x + (self.width / 7) / 3; button.backgroundColor = UIColor(rgb: 0xE0FFFF);
                     case 2: wo_inc_x = inc; wo_inc_y = inc_y + (self.height * (12.66/100)) / 3; button.backgroundColor = UIColor(rgb: 0xD8BFD8);
                     case 3: wo_inc_x = wo_inc_x + (self.width / 7) / 3; button.backgroundColor = UIColor(rgb: 0xF5F5DC)
                     case 4: wo_inc_x = wo_inc_x + (self.width / 7) / 3; button.backgroundColor = UIColor(rgb: 0xF5FFFA);
                     case 5: wo_inc_x = inc; wo_inc_y = inc_y + (self.height * (12.66/100)) / 3; button.backgroundColor = UIColor(rgb: 0x00b4ff)
                     case 6: wo_inc_x = wo_inc_x + (self.width / 7) / 3; button.backgroundColor = UIColor(rgb: 0xADD8E6)
                     default: break
                     }
                     }
                     } */
                }
                else if d < 0
                {
                    var ddd = ""
                    print("(first_weekday_no + d) - 1 \((first_weekday_no + d) - 1)")
                    if (first_weekday_no + d) - 1 == 0
                    {
                        ddd = getDateOfWeek(date: getDate(date: only_year + "-" + only_month + "-01")!, day: "sunday", direction: "prev")!
                        if  uv.viewWithTag(1000) != nil
                        {
                            let tta = ddd.components(separatedBy: "-")
                            (uv.viewWithTag(1000) as! UIButton).setTitle(tta[0], for: []);
                            (uv.viewWithTag(1000) as! UIButton).accessibilityIdentifier = ddd
                            print("ddd \(ddd)")
                        }
                    }
                    
                    if (first_weekday_no + d) - 1 == 1
                    {
                        ddd = getDateOfWeek(date: getDate(date: only_year + "-" + only_month + "-01")!, day: "monday", direction: "prev")!
                        if  uv.viewWithTag(1006) != nil
                        {
                            let tta = ddd.components(separatedBy: "-")
                            (uv.viewWithTag(1006) as! UIButton).setTitle(tta[0], for: []);
                            (uv.viewWithTag(1006) as! UIButton).accessibilityIdentifier = ddd
                            print("ddd \(ddd)")
                        }
                    }
                    
                    if (first_weekday_no + d) - 1 == 2
                    {
                        ddd = getDateOfWeek(date: getDate(date: only_year + "-" + only_month + "-01")!, day: "tuesday", direction: "prev")!
                        if  uv.viewWithTag(1012) != nil
                        {
                            let tta = ddd.components(separatedBy: "-")
                            (uv.viewWithTag(1012) as! UIButton).setTitle(tta[0], for: []);
                            (uv.viewWithTag(1012) as! UIButton).accessibilityIdentifier = ddd
                            print("ddd \(ddd)")
                        }
                    }
                    
                    if (first_weekday_no + d) - 1 == 3
                    {
                        ddd = getDateOfWeek(date: getDate(date: only_year + "-" + only_month + "-01")!, day: "wednesday", direction: "prev")!
                        if  uv.viewWithTag(1018) != nil
                        {
                            let tta = ddd.components(separatedBy: "-")
                            (uv.viewWithTag(1018) as! UIButton).setTitle(tta[0], for: []);
                            (uv.viewWithTag(1018) as! UIButton).accessibilityIdentifier = ddd
                            print("ddd \(ddd)")
                        }
                    }
                    
                    if (first_weekday_no + d) - 1 == 4
                    {
                        ddd = getDateOfWeek(date: getDate(date: only_year + "-" + only_month + "-01")!, day: "thursday", direction: "prev")!
                        if  uv.viewWithTag(1024) != nil
                        {
                            let tta = ddd.components(separatedBy: "-")
                            (uv.viewWithTag(1024) as! UIButton).setTitle(tta[0], for: []);
                            (uv.viewWithTag(1024) as! UIButton).accessibilityIdentifier = ddd
                            print("ddd \(ddd)")
                        }
                    }
                    
                    if (first_weekday_no + d) - 1 == 5
                    {
                        ddd = getDateOfWeek(date: getDate(date: only_year + "-" + only_month + "-01")!, day: "friday", direction: "prev")!
                        if  uv.viewWithTag(1030) != nil
                        {
                            let tta = ddd.components(separatedBy: "-")
                            (uv.viewWithTag(1030) as! UIButton).setTitle(tta[0], for: []);
                            (uv.viewWithTag(1030) as! UIButton).accessibilityIdentifier = ddd
                            print("ddd \(ddd)")
                        }
                    }
                }
                else if d > numDays - 1
                {
                    //print("d > numDays - 1 month_cell_count \(month_cell_count)")
                    
                    if uv.viewWithTag(month_cell_count - 6) != nil
                    {
                        let title = (uv.viewWithTag(month_cell_count - 6) as! UIButton).title(for: []);
                        if title != nil
                        {
                            print("title \(String(describing: title)) month_cell_count \(month_cell_count)")
                            
                            let myString : String = title!.description
                            
                            if Int(myString) == numDays
                            {
                                if  uv.viewWithTag(month_cell_count) != nil
                                {
                                    (uv.viewWithTag(month_cell_count) as! UIButton).setTitle("1", for: []);
                                    
                                    var tem_year = only_year
                                    var tt_month = Int(only_month)! + 1;
                                    if tt_month > 12 { tem_year = String(Int(only_year)! + 1); tt_month = 1 }; let tem_month = String(tt_month);
                                    
                                    (uv.viewWithTag(month_cell_count) as! UIButton).accessibilityIdentifier = "1" + "-" + tem_month + "-" + tem_year
                                }
                            }
                            else
                            {
                                var td : Int = Int(myString)!;   td = td + 1
                                
                                if  uv.viewWithTag(month_cell_count) != nil
                                {
                                    (uv.viewWithTag(month_cell_count) as! UIButton).setTitle(String(td), for: []);
                                    
                                    var tem_year = only_year
                                    var tt_month = Int(only_month)! + 1;
                                    if tt_month > 12 { tem_year = String(Int(only_year)! + 1); tt_month = 1 }; let tem_month = String(tt_month);
                                    
                                    (uv.viewWithTag(month_cell_count) as! UIButton).accessibilityIdentifier = String(td) + "-" + tem_month + "-" + tem_year
                                }
                            }
                        }
                    }
                }
                else
                {
                    
                }
                d = d + 7;              inc_y = inc_y + self.height * (5/100)  //12.66
                
                //print("c \(c) d \(d)")
                
                month_cell_count = month_cell_count + 1
            }
            
            /* button = UIButton(type: UIButtonType.system) as UIButton;                           button.isExclusiveTouch = true;
             button.backgroundColor = UIColor.white
             button.frame = CGRect(x: inc, y: (self.height * (40/100)) / 5, width: (self.width * (50/100)) / 7, height: (self.height * (40/100)) / 4); */
            inc = inc + self.width / 7
            
            /* let ds = String(temp_month) + "/" + String(starting_date) + "/" + String(temp_year);
             if b == 0 { start_date = ds };                                                      if b == 6 { end_date = ds }
             button.setTitle(String(temp_month) + "/" + String(starting_date), forState: .Normal);
             button.setTitleColor(UIColor.blackColor(), forState: .Normal);                      button.tag = Int(self.day_values[b])!
             
             if starting_date == getNumDays(temp_year, month: temp_month)!
             {
             starting_date = 1; temp_month = temp_month + 1;
             if temp_month > 12 { temp_year = temp_year + 1; temp_month = 1; }
             }
             else { starting_date = starting_date + 1 } */
            //uv.addSubview(button)
            //print("b \(b) self.day_names[temp_day] \(self.day_names[temp_day]) self.day_values[b] \(self.day_values[b]) temp_day \(temp_day)")
        }
        //for index in Int(only_date)!.stride(to: -1, by: -1) { print(index) }
        
        self.view.addSubview(uv);
        
        var tem = "", tey = "", ta = [String]()
        
        for ab in 1000 ..< 1042
        {
            let title = (uv.viewWithTag(ab) as! UIButton).title(for: []);
            let ai = (uv.viewWithTag(ab) as! UIButton).accessibilityIdentifier;
            
            //print("ai \(ai)")
            
            if title != nil
            {
                //print("title \(String(describing: title)) weekDateArray.count \(weekDateArray.count)")
                
                let myString : String = title!.description
                
                if ai != nil
                {
                    let ai : String = ai!.description
                    ta = ai.components(separatedBy: "-")
                    tem = ta[1]
                    tey = ta[2]
                }
                
                for cd in 0 ..< weekDateArray.count
                {
                    //print("myString \(myString) weekDateArray[cd] \(weekDateArray[cd]) only_month \(only_month) weekMonthArray[cd] \(weekMonthArray[cd]) only_year \(only_year) weekYearArray[cd] \(weekYearArray[cd])")
                    
                    //if (myString == weekDateArray[cd] || "0" + myString == weekDateArray[cd]) && (only_month == weekMonthArray[cd] || "0" + only_month == weekMonthArray[cd]) && only_year == weekYearArray[cd]
                    
                    //print("myString \(myString) weekDateArray[cd] \(weekDateArray[cd]) tem \(tem) weekMonthArray[cd] \(weekMonthArray[cd]) tey \(tey) weekYearArray[cd] \(weekYearArray[cd])")
                    
                    if (myString == weekDateArray[cd] || "0" + myString == weekDateArray[cd]) && (tem == weekMonthArray[cd] || "0" + tem == weekMonthArray[cd]) && tey == weekYearArray[cd]
                    {
                        if  uv.viewWithTag(ab) != nil
                        { (uv.viewWithTag(ab) as! UIButton).backgroundColor = UIColor(rgb: 0x7000FF); }
                        
                        print("weekDateArray[cd] \(weekDateArray[cd])")
                    }
                }
            }
        }
    }
    
    @objc func selectDate(sender: UIButton)
    {
        let title = (uv.viewWithTag(sender.tag) as! UIButton).title(for: []);
        let ai = (uv.viewWithTag(sender.tag) as! UIButton).accessibilityIdentifier;
        if title != nil
        {
            print("selectDate title \(String(describing: title))")
            let myString : String = title!.description
            
            if ai != nil
            {
                let ai : String = ai!.description
                let ta = ai.components(separatedBy: "-")
                selectedDate = getDate(date: ta[2] + "-" + ta[1] + "-" + myString)!
                getWholeWeekDays(date: selectedDate)
                calendar_month()
                showthisweek(date: getDate(date: ta[2] + "-" + ta[1] + "-" + myString)!)
            }
        }
    }
    
    func getDate(date: String) -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        //return dateFormatter.date(from: "2015-04-01T11:42:00")  // replace Date String
        return dateFormatter.date(from: date+"T02:00:01")       // replace Date String
    }
    
    func getDateOfWeek(date: Date, day: String, direction: String) -> String?
    {
        print("getDateOfWeek date \(date) day \(day) direction \(direction)")
        
        let date_formatter = DateFormatter();               date_formatter.dateFormat = "dd";                 date_formatter.timeZone = NSTimeZone.local
        let month_formatter = DateFormatter();              month_formatter.dateFormat = "MM";                month_formatter.timeZone = NSTimeZone.local
        let year_formatter = DateFormatter();               year_formatter.dateFormat = "yyyy";               year_formatter.timeZone = NSTimeZone.local
        
        switch day
        {
        case "sunday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.sunday) as Date) + "-" + month_formatter.string(from: date.previous(.sunday) as Date) + "-" + year_formatter.string(from: date.previous(.sunday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.sunday) as Date) + "-" + month_formatter.string(from: date.next(.sunday) as Date) + "-" + year_formatter.string(from: date.next(.sunday) as Date);
            }
        case "monday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.monday) as Date) + "-" + month_formatter.string(from: date.previous(.monday) as Date) + "-" + year_formatter.string(from: date.previous(.monday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.monday) as Date) + "-" + month_formatter.string(from: date.next(.monday) as Date) + "-" + year_formatter.string(from: date.next(.monday) as Date);
            }
        case "tuesday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.tuesday) as Date) + "-" + month_formatter.string(from: date.previous(.tuesday) as Date) + "-" + year_formatter.string(from: date.previous(.tuesday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.tuesday) as Date) + "-" + month_formatter.string(from: date.next(.tuesday) as Date) + "-" + year_formatter.string(from: date.next(.tuesday) as Date);
            }
        case "wednesday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.wednesday) as Date) + "-" + month_formatter.string(from: date.previous(.wednesday) as Date) + "-" + year_formatter.string(from: date.previous(.wednesday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.wednesday) as Date) + "-" + month_formatter.string(from: date.next(.wednesday) as Date) + "-" + year_formatter.string(from: date.next(.wednesday) as Date);
            }
        case "thursday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.thursday) as Date) + "-" + month_formatter.string(from: date.previous(.thursday) as Date) + "-" + year_formatter.string(from: date.previous(.thursday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.thursday) as Date) + "-" + month_formatter.string(from: date.next(.thursday) as Date) + "-" + year_formatter.string(from: date.next(.thursday) as Date);
            }
        case "friday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.friday) as Date) + "-" + month_formatter.string(from: date.previous(.friday) as Date) + "-" + year_formatter.string(from: date.previous(.friday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.friday) as Date) + "-" + month_formatter.string(from: date.next(.friday) as Date) + "-" + year_formatter.string(from: date.next(.friday) as Date);
            }
        case "saturday":
            if direction == "prev"
            {
                return date_formatter.string(from: date.previous(.saturday) as Date) + "-" + month_formatter.string(from: date.previous(.saturday) as Date) + "-" + year_formatter.string(from: date.previous(.saturday) as Date);
            }
            if direction == "next"
            {
                return date_formatter.string(from: date.next(.saturday) as Date) + "-" + month_formatter.string(from: date.next(.saturday) as Date) + "-" + year_formatter.string(from: date.next(.saturday) as Date);
            }
        default: return date_formatter.string(from: date.previous(.sunday) as Date);
        }
        return date_formatter.string(from: date.previous(.sunday) as Date);
    }
    
    func getStartEndOfWeek(date: Date)
    {
        //let date = Date();
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd";                                            formatter.timeZone = NSTimeZone.local;
        let year_formatter = DateFormatter();                                           year_formatter.dateFormat = "yyyy";
        year_formatter.timeZone = NSTimeZone.local                                      //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();                                          month_formatter.dateFormat = "MMM";
        month_formatter.timeZone = NSTimeZone.local;                                    let date_formatter = DateFormatter();
        date_formatter.dateFormat = "dd";                                               date_formatter.timeZone = NSTimeZone.local
        week_start_year = year_formatter.string(from: date as Date);                    week_start_month = month_formatter.string(from: date as Date);
        week_start_date = date_formatter.string(from: date as Date);
        
        today_date = date_formatter.string(from: date as Date);                         today_month = month_formatter.string(from: date as Date);
        today_year = year_formatter.string(from: date as Date);
        
        if let weekday = getDayOfWeek(today: formatter.string(from: date as Date))
        {
            weekday_no = weekday; print("93 weekday \(weekday)");          //day_of_week = day_names[weekday-1]
            
        } else { print("bad input") } //"2014-08-27"
        
        week_start_date = date_formatter.string(from: date.previous(.sunday) as Date);
        week_start_month = month_formatter.string(from: date.previous(.sunday) as Date);
        week_start_year = year_formatter.string(from: date.previous(.sunday) as Date);
        
        week_end_date = date_formatter.string(from: date.next(.saturday) as Date);
        week_end_month = month_formatter.string(from: date.next(.saturday) as Date);
        week_end_year = year_formatter.string(from: date.next(.saturday) as Date);
        
        if weekday_no == 1
        {
            week_start_date = today_date;
            week_start_month = today_month;
            week_start_year = today_year;
        }
        else if weekday_no == 7
        {
            week_end_date = today_date;
            week_end_month = today_month;
            week_end_year = today_year;
        }
        else
        {
            
        }
        
        print("getStartEndOfWeek week_start_date \(week_start_date) week_start_month \(week_start_month) week_start_year \(week_start_year) week_end_date \(week_end_date) week_end_month \(week_end_month) week_end_year \(week_end_year)")
    }
    
    @objc func showprevmonth()
    {
        var t_month = Int(only_month)! - 1; if t_month < 1 { only_year = String(Int(only_year)! - 1); t_month = 12 }; only_month = String(t_month);
        
        let date = NSDate();
        //let formatter = NSDateFormatter(); formatter.dateFormat = "yyyy-MM-dd"; formatter.timeZone = NSTimeZone.localTimeZone();
        let year_formatter = DateFormatter();           year_formatter.dateFormat = "yyyy";                 year_formatter.timeZone = NSTimeZone.local
        //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();          month_formatter.dateFormat = "MM";                  month_formatter.timeZone = NSTimeZone.local
        let date_formatter = DateFormatter();           date_formatter.dateFormat = "dd";                   date_formatter.timeZone = NSTimeZone.local
        
        if only_year == year_formatter.string(from: date as Date) && (only_month == month_formatter.string(from: date as Date) || "0" + only_month == month_formatter.string(from: date as Date))
        { only_date = date_formatter.string(from: date as Date); } else { self.only_date = "0"; }
        
        getWholeWeekDays(date: selectedDate)
        
        if calendar_month_flag == 0 { /* calendar_day() */ } else { calendar_month() }
    }
    
    @objc func shownextmonth()
    {
        var t_month = Int(only_month)! + 1; if t_month > 12 { only_year = String(Int(only_year)! + 1); t_month = 1 }; only_month = String(t_month);
        
        let date = NSDate();
        //let formatter = NSDateFormatter(); formatter.dateFormat = "yyyy-MM-dd"; formatter.timeZone = NSTimeZone.localTimeZone();
        let year_formatter = DateFormatter();           year_formatter.dateFormat = "yyyy";             year_formatter.timeZone = NSTimeZone.local
        //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();          month_formatter.dateFormat = "MM";              month_formatter.timeZone = NSTimeZone.local
        let date_formatter = DateFormatter();           date_formatter.dateFormat = "dd";               date_formatter.timeZone = NSTimeZone.local
        
        if only_year == year_formatter.string(from: date as Date) && (only_month == month_formatter.string(from: date as Date) || "0" + only_month == month_formatter.string(from: date as Date))
        { only_date = date_formatter.string(from: date as Date); } else { self.only_date = "0"; }
        
        getWholeWeekDays(date: selectedDate)
        
        if calendar_month_flag == 0 { /* calendar_day() */ } else { calendar_month() }
    }
    
    func getNumDays(year:Int, month:Int)->Int?
    {
        let dateComponents = DateComponents(year: year, month: month);                       let calendar = Calendar.current
        let dat = calendar.date(from: dateComponents)!;                                      let range = calendar.range(of: .day, in: .month, for: dat)!
        return range.count
    }
    
    /* func weekLoadList(notification: NSNotification)
     {
     dispatch_async(dispatch_get_main_queue(), { () -> Void in self.calendar_month_flag = 0; self.calendar_day_flag = 0; self.showtodayforweek() }) //loadlocallist()
     } */
    
    func showtodayforweek()
    {
        let date = NSDate();                                let formatter = DateFormatter();                      formatter.dateFormat = "yyyy-MM-dd";
        formatter.timeZone = NSTimeZone.local;              let year_formatter = DateFormatter();                 year_formatter.dateFormat = "yyyy";
        year_formatter.timeZone = NSTimeZone.local //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();            month_formatter.dateFormat = "MM";
        month_formatter.timeZone = NSTimeZone.local;                                                            let date_formatter = DateFormatter();
        date_formatter.dateFormat = "dd";                                                                  date_formatter.timeZone = NSTimeZone.local
        only_year = year_formatter.string(from: date as Date);                                  only_month = month_formatter.string(from: date as Date);
        only_date = date_formatter.string(from: date as Date);
        
        print("showtodayforweek formatter.stringFromDate(date) \(formatter.string(from: date as Date)) only_year \(only_year) only_month \(only_month) only_date \(only_date)");
        
        if let weekday = getDayOfWeek(today: formatter.string(from: date as Date))
        { weekday_no = weekday; print("weekday \(weekday)"); day_of_week = day_names[weekday-1] } else { print("bad input") } //"2014-08-27"
        
        calendar_week()
    }
    
    func calendar_week()
    {
        calendar_month_flag = 1
        /* if self.win.viewWithTag(32) != nil
         { if let viewWithTag = self.win.viewWithTag(32) { print("showyearslist() Tag 32"); viewWithTag.removeFromSuperview() } } */
        
        if let first_weekday = getDayOfWeek(today: only_year + "-" + only_month + "-01")
        {   print("calendar_week first_weekday \(first_weekday)"); first_weekday_no = first_weekday; }
        else { print("first_weekday bad input") } //"2014-08-27"
        
        let dateComponents = DateComponents(year: Int(only_year)!, month: Int(only_month)!);                            let calendar = Calendar.current
        let dat = calendar.date(from: dateComponents)!;                                      let range = calendar.range(of: .day, in: .month, for: dat)!
        numDays = range.count
        print("numDays \(numDays)") // 31
        
        /* for view in self.view.subviews { view.removeFromSuperview() }
         self.header = Header(frame: CGRect(x: 0, y: 0, width: self.width, height: self.height * (12/100)), cas: 2000); //self.header.tag = 2233
         self.header.menubutton.addTarget(self, action: #selector(self.toggleMenu), forControlEvents: UIControlEvents.TouchUpInside)
         self.header.homebutton.addTarget(self, action: #selector(self.showSwitch), forControlEvents: UIControlEvents.TouchUpInside)
         self.header.notiButton.addTarget(self, action: #selector(self.toggleNoti), forControlEvents: UIControlEvents.TouchUpInside)
         self.header.weekbutton.setTitleColor(UIColor.whiteColor(), forState: .Normal); self.header.weekbutton.backgroundColor = UIColor(rgb: 0x00b4ff);
         self.view.addSubview(self.header);*/
        
        //let lab1 = UILabel(frame: CGRectMake(0, self.height * 38/100, self.width * (50/100), self.height * (5/100)));  lab1.backgroundColor = UIColor(rgb: 0x268bb5)
        //lab1.textAlignment = .Center;  lab1.textColor = UIColor.whiteColor(); lab1.text = "Week";                    self.view.addSubview(lab1);
        
        //Previous week
        self.previous_week = UIButton(frame: CGRect(x: 0, y: topBarHeight + self.height * (40 / 100), width: self.width * (25/100), height: self.height * (5/100)))
        self.previous_week.setTitleColor(UIColor.white, for: []);  self.previous_week.isExclusiveTouch = true
        self.previous_week.setTitle("<- Prev Week", for: [])
        self.previous_week.backgroundColor = UIColor(rgb: 0x342D46);    //UIColor(rgb: 0x00b4ff)
        self.previous_week.addTarget(self, action: #selector(self.showprevweek), for: UIControlEvents.touchUpInside)
        self.previous_week.titleLabel!.textAlignment = .center
        self.previous_week.titleLabel!.font = UIFont.systemFont(ofSize: self.previous_week.titleLabel!.font.pointSize - 5)
        self.view.addSubview(self.previous_week)
        
        //Week
        self.week = UIButton(frame: CGRect(x: self.width * (25/100), y: topBarHeight + self.height * (40/100), width: self.width * (50/100), height: self.height * (5/100)))
        self.week.setTitleColor(UIColor.white, for: []);  self.week.isExclusiveTouch = true
        self.week.setTitle(only_year, for: [])
        self.week.backgroundColor = UIColor(rgb: 0x342D46);             //UIColor(rgb: 0x00b4ff)
        //self.week.addTarget(self, action: #selector(self.showyearslist), forControlEvents: UIControlEvents.TouchUpInside)
        self.week.titleLabel!.textAlignment = .center
        self.week.titleLabel!.font = UIFont.boldSystemFont(ofSize: self.week.titleLabel!.font.pointSize)
        self.view.addSubview(self.week)
        
        //Next week
        self.next_week = UIButton(frame: CGRect(x: self.width * (75/100), y: topBarHeight + self.height * (40/100), width: self.width * (25/100), height: self.height * (5/100)))
        self.next_week.setTitleColor(UIColor.white, for: []);  self.next_week.isExclusiveTouch = true
        self.next_week.setTitle("Next Week ->", for: [])
        self.next_week.backgroundColor = UIColor(rgb: 0x342D46);        //UIColor(rgb: 0x00b4ff)
        self.next_week.addTarget(self, action: #selector(self.shownextweek), for: UIControlEvents.touchUpInside)
        self.next_week.titleLabel!.textAlignment = .center
        self.next_week.titleLabel!.font = UIFont.systemFont(ofSize: self.next_week.titleLabel!.font.pointSize - 5)
        self.view.addSubview(self.next_week)
        
        /* //This week
         self.this_week = UIButton(frame: CGRect(x: self.width * (78/100), y: topBarHeight + self.height * (40/100), width: self.width * (20/100), height: self.height * (5/100)))
         self.this_week.setTitleColor(UIColor.white, for: []);  self.this_week.isExclusiveTouch = true
         self.this_week.setTitle("This week", for: [])
         self.this_week.backgroundColor = UIColor(rgb: 0x00b4ff)
         self.this_week.addTarget(self, action: #selector(self.showthisweek), for: UIControlEvents.touchUpInside)
         self.this_week.titleLabel!.textAlignment = .center
         self.this_week.titleLabel!.font = UIFont.boldSystemFont(ofSize: self.this_week.titleLabel!.font.pointSize)
         self.view.addSubview(self.this_week) */
        
        showthisweek(date: Date())
    }
    
    /* class UIButtonScrollView: UIScrollView
     {
     override func touchesShouldCancel(in _view: UIView) -> Bool
     {
     if (view.isKindOfClass(UIButton))
     {
     return true
     }
     return super.touchesShouldCancel(in: view)
     }
     }*/
    
    @objc func showthisweek(date: Date)
    {
        //let date = NSDate();
        let formatter = DateFormatter();                      formatter.dateFormat = "yyyy-MM-dd";
        formatter.timeZone = NSTimeZone.local;              let year_formatter = DateFormatter();                 year_formatter.dateFormat = "yyyy";
        year_formatter.timeZone = NSTimeZone.local          //NSTimeZone(abbreviation: "GMT")
        let month_formatter = DateFormatter();              month_formatter.dateFormat = "MM";
        month_formatter.timeZone = NSTimeZone.local;                                                              let date_formatter = DateFormatter();
        date_formatter.dateFormat = "dd";                   date_formatter.timeZone = NSTimeZone.local
        week_only_year = year_formatter.string(from: date as Date);
        week_only_month = month_formatter.string(from: date as Date);
        week_only_date = date_formatter.string(from: date as Date);
        
        //print("formatter.stringFromDate(date) \(formatter.stringFromDate(date)) only_year \(only_year) only_month \(only_month) only_date \(only_date)");
        
        if let weekday = getDayOfWeek(today: formatter.string(from: date as Date))
        { weekday_no = weekday; print("showthisweek weekday \(weekday)"); day_of_week = day_names[weekday-1] } else { print("bad input") } //"2014-08-27"
        
        let temp_day = weekday_no - 1; temp_month = Int(week_only_month)!; temp_year = Int(week_only_year)!
        
        if temp_day == 0 { starting_date = Int(week_only_date)!; }
        else
        {
            if Int(week_only_date)! > temp_day { starting_date = Int(week_only_date)! - temp_day; }
            else
            {
                temp_month = temp_month - 1
                if Int(week_only_month)! < 1
                {
                    temp_year = temp_year - 1
                    prev_month_numofdays = getNumDays(year: Int(week_only_year)! - 1, month: Int(week_only_month)! - 1)!
                }
                else
                {
                    prev_month_numofdays = getNumDays(year: Int(week_only_year)!, month: Int(week_only_month)! - 1)!
                }
                
                starting_date = prev_month_numofdays - temp_day + Int(week_only_date)!;
                print("prev_month_numofdays \(prev_month_numofdays) temp_day \(temp_day) starting_date \(starting_date)")
            }
        }
        
        plotWeek()
    }
    
    func plotWeek()
    {
        /* if self.win.viewWithTag(32) != nil { if let viewWithTag = self.win.viewWithTag(32) { print("showyearslist() Tag 32"); viewWithTag.removeFromSuperview() } }*/
        
        /* let filemgr = NSFileManager.defaultManager();
         let dirPaths = filemgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
         databasePath = dirPaths[0].URLByAppendingPathComponent("efi.db").path!;
         contactDB = FMDatabase(path: self.databasePath as String);  contactDB.open() */
        
        var inc = CGFloat(0.0), lab = UILabel(), scrollView = UIScrollView(), button = UIButton(), justMonth = 0
        
        // hours view
        //scrollView = UIScrollView(frame: CGRect(x: 0, y: self.height * 65/100 + (self.height * (81/100)) / 10, width: self.width, height: self.height * (81/100) - (self.height * (81/100)) / 10))
        scrollView = UIScrollView(frame: CGRect(x: 0, y: topBarHeight + self.height * 50/100, width: self.width, height: self.height * (40/100)))
        scrollView.backgroundColor = UIColor(rgb: 0x342D46);
        scrollView.contentSize = CGSize(width: 1.0, height: (self.height * (5/100)) * 30); //CGSize(width: 1.0, height: (self.height * (5/100)) * 35);
        scrollView.delaysContentTouches = false;
        scrollView.canCancelContentTouches = true;
        scrollView.panGestureRecognizer.delaysTouchesBegan = scrollView.delaysContentTouches
        
        //scrollView.canCancelContentTouches = false;
        //scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        var hour_uiview = UIView() /* , hours_names = [ "6.00 AM",  "6.30 AM",  "7.00 AM",  "7.30 AM",  "8.00 AM",
         "8.30 AM",  "9.00 AM",  "9.30 AM",  "10.00 AM", "10.30 AM",
         "11.00 AM", "11.30 AM", "12.00 PM", "12.30 PM", "1.00 PM",
         "1.30 PM",  "2.00 PM",  "2.30 PM",  "3.00 PM",  "3.30 PM",
         "4.00 PM",  "4.30 PM",  "5.00 PM",  "5.30 PM",  "6.00 PM",
         "6.30 PM",  "7.00 PM",  "7.30 PM",  "8.00 PM",  "8.30 PM",
         "9.00 PM",  "9.30 PM",  "10.00 PM", "10.30 PM", "11.00 PM"]; */
        
        var hours_names = [ "9.00 AM", "9.30 AM", "10.00 AM", "10.30 AM", "11.00 AM", "11.30 AM", "12.00 PM", "12.30 PM", "1.00 PM", "1.30 PM",
                            "2.00 PM", "2.30 PM",  "3.00 PM",  "3.30 PM",  "4.00 PM",  "4.30 PM",  "5.00 PM",  "5.30 PM", "6.00 PM", "6.30 PM",
                            "7.00 PM", "7.30 PM",  "8.00 PM",  "8.30 PM",  "9.00 PM",  "9.30 PM",  "10.00 PM", "10.30 PM", "11.00 PM", "11.30 PM" ];
        
        var hours_names_railway_time = [ "9:00:00", "9:30:00", "10:00:00", "10:30:00", "11:00:00", "11:30:00", "12:00:00", "12:30:00", "13:00:00", "13:30:00",
                                         "14:00:00", "14:30:00", "15:00:00", "15:30:00", "16:00:00", "16:30:00", "17:00:00", "17:30:00", "18:00:00", "18:30:00",
                                         "19:00:00", "19:30:00", "20:00:00", "20:30:00",  "21:00:00",  "21:30:00",  "22:00:00", "22:30:00", "23:00:00", "23:30:00" ];
        inc = CGFloat(0.0)
        
        for ab in 2001 ..< 2211
        {
            if self.view.viewWithTag(ab) != nil
            { if let viewWithTag = self.view.viewWithTag(ab) { print("1171 view() Tag ab \(ab)"); viewWithTag.removeFromSuperview() } }
        }
        
        uv = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: (self.height * (5/100)) * 35));
        var inc_x = CGFloat(self.width / 8), time_cell_count = 2001
        
        for b in 0 ..< 30 //35
        {
            //print("b \(b)  self.day_values[b] \(self.day_values[b]) temp_day \(temp_day) only_date \(only_date)")
            hour_uiview = UIView(frame: CGRect(x: 0, y: inc, width: self.width, height: self.height * (5/100)));
            hour_uiview.layer.borderWidth = 1;
            //hour_uiview.layer.borderColor = UIColor(rgb: 0x00b4ff).cgColor;
            hour_uiview.backgroundColor = UIColor(rgb: 0x342D46);
            inc_x = CGFloat(0.0) //CGFloat(self.width / 7) //  CGFloat(self.width / 8)
            
            for _ in 0 ..< 7
            {
                /* //print("b \(b) e \(e) inc \(inc)")
                 //lab = UILabel(frame: CGRect(x: inc_x, y: 0, width: self.width / 8, height: self.height * (5/100)));
                 lab = UILabel(frame: CGRect(x: inc_x + 2, y: 2, width: self.width / 7 - 4, height: self.height * (5/100) - 4));
                 //lab.layer.borderColor = UIColor(rgb: 0xe8e8e8).cgColor;
                 lab.backgroundColor = UIColor(rgb: 0xD0DFF2);
                 lab.text = hours_names[b];
                 lab.textAlignment = .center;                                        lab.layer.borderWidth = 1;
                 hour_uiview.addSubview(lab);                                        uv.addSubview(hour_uiview)
                 lab.font = UIFont.systemFont(ofSize: lab.font!.pointSize - 5);      //)  .boldSystemFont(ofSize: lab.font!.pointSize - 5);
                 //inc_x = inc_x + self.width / 8;
                 */
                
                but = UIButton(type: UIButton.ButtonType.custom) as UIButton;                                              but.isExclusiveTouch = true
                but.frame = CGRect(x: inc_x + 2, y: 2, width: self.width / 7 - 4, height: self.height * (5/100) - 4)
                but.backgroundColor = UIColor(rgb: 0xD0DFF2);
                but.setTitleColor(UIColor.black, for: []);
                but.titleLabel!.textAlignment = .center
                //but.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
                but.titleLabel!.font = UIFont.systemFont(ofSize: but.titleLabel!.font!.pointSize - 7)
                but.tag = time_cell_count
                but.addTarget(self, action: #selector(self.selectTime), for: UIControlEvents.touchUpInside)
                but.setTitle(hours_names[b], for: []);
                //but.accessibilityIdentifier = self.day_values[d] + "-" + only_month + "-" + only_year
                hour_uiview.addSubview(but);
                uv.addSubview(hour_uiview)
                
                scrollView.touchesShouldCancel(in: but)
                
                inc_x = inc_x + self.width / 7;
                time_cell_count = time_cell_count + 1
            }
            
            /* lab = UILabel(frame: CGRect(x: 5, y: 5, width: (self.width) / 12, height: (self.height * (5/100)) / 4 ));
             //lab.backgroundColor = UIColor(rgb: 0xf5f5f5)
             lab.textColor = UIColor.black;              lab.text = hours_names[b];
             lab.textAlignment = .left;                  lab.font = UIFont.boldSystemFont(ofSize: lab.font!.pointSize - 5);
             hour_uiview.addSubview(lab)
             uv.addSubview(hour_uiview) */
            
            inc = inc + self.height * (5/100);
            //print("b \(b) hours_names[b] \(hours_names[b]) inc \(inc) frame \(lab.frame.origin.x) \(lab.frame.origin.y) \(lab.frame.width) \(lab.frame.height) ")
        }
        
        var inc_y = CGFloat(self.height * (5/100)), start = 0, end = 0;                 tag_array = [String]();
        inc = CGFloat(0.0)                                                              //CGFloat(self.width / 8)
        
        monthDateArray = [String](); monthMonthArray = [String](); monthYearArray = [String]()
        
        for b in 0 ..< 7
        {
            //var lab = UILabel(frame: CGRectMake(inc, self.height * 19/100, self.width / 8, self.height * (81/100)));   lab.layer.borderColor = UIColor(rgb: 0xe8e8e8).CGColor; //(50/100)
            //lab.layer.borderWidth = 1;                                                                                 uv.addSubview(lab)
            
            print("b \(b)  self.day_values[b] \(self.day_values[b])")
            //lab = UILabel(frame: CGRect(x: inc, y: self.height * 19/100, width: self.width / 8, height: (self.height * (81/100)) / 10 ));
            lab = UILabel(frame: CGRect(x: inc, y: topBarHeight + self.height * 45/100, width: self.width / 7, height: self.height * (5/100) ));
            lab.backgroundColor = UIColor(rgb: 0x342D46);
            
            justMonth = temp_month;  if temp_month == 0 { justMonth = 12 }
            
            lab.text = self.day_names[b] + "\n" + String(justMonth) + "/" + String(starting_date);
            
            if(self.day_names[b] == "SUN" || self.day_names[b] == "SAT") { lab.textColor = UIColor(rgb: 0xCF6667) }
            else { lab.textColor = UIColor.white; }
            
            lab.textAlignment = .center;                                lab.font = UIFont.boldSystemFont(ofSize: lab.font!.pointSize);
            lab.numberOfLines = 0;                                      //lab.layer.borderColor = UIColor(rgb: 0xe8e8e8).cgColor;
            lab.layer.borderWidth = 1;                                  view.addSubview(lab);
            
            /* let results : FMResultSet? = contactDB.executeQuery("SELECT * FROM FConnect__Service_Order__c", withArgumentsInArray: nil); var matching_count = 0
             
             while results!.next()
             {
             print("calendar_week() plotWeek() FConnect__Service_Order__c results Id \(results!.stringForColumn("Id")), Name \(results!.stringForColumn("Name")) FConnect__Estimated_Start_date__c \(results!.stringForColumn("FConnect__Estimated_Start_date__c"))")
             
             var dateStart = results!.stringForColumn("FConnect__Estimated_Start_date__c").stringByReplacingOccurrencesOfString("T", withString: " ")
             if dateStart.characters.count > 19
             { dateStart = dateStart.substringWithRange(Range<String.Index>(start: dateStart.startIndex, end: dateStart.endIndex.advancedBy(-9))) }
             let ndateFormatter = NSDateFormatter();   ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z";      dateStart = dateStart + " +0000";
             var startDate: NSDate = ndateFormatter.dateFromString(dateStart)!
             var showDateMillis = startDate.timeIntervalSince1970*1000 + Double(NSTimeZone.localTimeZone().secondsFromGMT * 1000)
             var showDateString = String(dateFromMilliseconds(showDateMillis));
             print("calendar_day() plotWo() showDateString \(showDateString)")
             
             var start_date_array = showDateString.componentsSeparatedByString(" ")
             var start_date_array_1 = start_date_array[0].componentsSeparatedByString("-");
             var start_date_array_2 = start_date_array[1].componentsSeparatedByString(":");
             
             print("calendar_week() plotWeek() start_date_array_1[0] \(start_date_array_1[0]) start_date_array_1[1] \(start_date_array_1[1]) start_date_array_1[2] \(start_date_array_1[2])")
             print("calendar_week() plotWeek() start_date_array_2[0] \(start_date_array_2[0]) start_date_array_2[1] \(start_date_array_2[1])")
             
             // end date
             dateStart = results!.stringForColumn("FConnect__Estimated_End_Date__c").stringByReplacingOccurrencesOfString("T", withString: " ")
             print("calendar_week() plotWeek() 1 dateStart \(dateStart)")
             if dateStart.characters.count > 19
             { dateStart = dateStart.substringWithRange(Range<String.Index>(start: dateStart.startIndex, end: dateStart.endIndex.advancedBy(-9))) };
             print("calendar_week() plotWeek() 2 dateStart \(dateStart)")
             let ndateFormatter1 = NSDateFormatter();                                           ndateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss Z";
             dateStart = dateStart + " +0000"; print("calendar_week() plotWeek() 3 dateStart \(dateStart)");
             var startDate1: NSDate = ndateFormatter1.dateFromString(dateStart)!
             showDateMillis = startDate1.timeIntervalSince1970*1000 + Double(NSTimeZone.localTimeZone().secondsFromGMT * 1000)
             showDateString = String(dateFromMilliseconds(showDateMillis));
             print("calendar_week() plotWeek() showDateString \(showDateString)")
             
             var end_date_array = showDateString.componentsSeparatedByString(" ");
             var end_date_array_1 = end_date_array[0].componentsSeparatedByString("-");
             var end_date_array_2 = end_date_array[1].componentsSeparatedByString(":");
             
             print("calendar_week() plotWeek() end_date_array_1[0] \(end_date_array_1[0]) end_date_array_1[1] \(end_date_array_1[1]) end_date_array_1[2] \(end_date_array_1[2])")
             print("calendar_week() plotWeek() end_date_array_2[0] \(end_date_array_2[0]) end_date_array_2[1] \(end_date_array_2[1])")
             
             print("calendar_week() plotWeek() FConnect__Service_Order__c results Id \(results!.stringForColumn("Id")), Name \(results!.stringForColumn("Name")) FConnect__Estimated_Start_date__c \(results!.stringForColumn("FConnect__Estimated_Start_date__c"))")
             
             if start_date_array_1[0] == String(temp_year) && (start_date_array_1[1] == String(temp_month) || start_date_array_1[1] == "0" + String(temp_month)) && (start_date_array_1[2] == String(starting_date) || start_date_array_1[2] == "0" + String(starting_date))
             {
             matching_count = matching_count + 1;               let wo_array = results!.stringForColumn("Name").componentsSeparatedByString("-");
             //start_date_array_1[0]
             
             let random = Int(arc4random_uniform(9999999 - 1000000) + 1000000)
             
             tag_array.append(String(random) + "*" + start_date_array_1[0] + "*" + start_date_array_1[1] + "*" + start_date_array_1[2] + "*" +  wo_array[1])
             
             print("matching start_date_array_1[0] \(start_date_array_1[0]) start_date_array_1[1] \(start_date_array_1[1]) start_date_array_1[2] \(start_date_array_1[2]) tag \(String(random)) \(start_date_array_1[0])  \(start_date_array_1[1]) \(start_date_array_1[2]) \(wo_array[1])")
             
             for c in 0 ..< hours_names.count
             {
             var time_array = hours_names[c].componentsSeparatedByString(" "); var hm = time_array[0].componentsSeparatedByString(".");
             
             print("calendar_day() plotWo() matching Int(start_date_array_2[0])  \(Int(start_date_array_2[0])) Int(start_date_array_2[1])  \(Int(start_date_array_2[1])) c \(c) hours_names[c] \(hours_names[c]) time_array[0] \(time_array[0]) time_array[1] \(time_array[1]) Int(hm[0]) \(Int(hm[0])) Int(hm[1]) \(Int(hm[1]))")
             
             if Int(start_date_array_2[0]) < 12 && Int(start_date_array_2[0]) == Int(hm[0]) && Int(start_date_array_2[1]) != 0 && Int(start_date_array_2[1]) < Int(hm[1]) && time_array[1] == "AM"
             { print("< 12 < 30 c \(c)"); start = c }
             
             if Int(start_date_array_2[0]) < 12 && Int(start_date_array_2[0]) == Int(hm[0]) && Int(start_date_array_2[1]) >= Int(hm[1]) && time_array[1] == "AM"
             {  print("< 12 >= 30 c \(c)"); start = c }
             
             if Int(start_date_array_2[0]) == 12 && Int(start_date_array_2[0]) == Int(hm[0]) && Int(start_date_array_2[1]) != 0 && Int(start_date_array_2[1]) < Int(hm[1]) && time_array[1] == "PM"
             {
             print("== 12 < 30 c \(c)"); start = c
             }
             if Int(start_date_array_2[0]) == 12 && Int(start_date_array_2[0]) == Int(hm[0]) && Int(start_date_array_2[1]) >= Int(hm[1]) && time_array[1] == "PM"
             {
             print("== 12 >= 30 c \(c)"); start = c
             }
             
             if Int(start_date_array_2[0])! > 12 && Int(start_date_array_2[0])! - 12 == Int(hm[0])! && Int(start_date_array_2[1]) != 0 && Int(start_date_array_2[1]) < Int(hm[1]) && time_array[1] == "PM"
             {
             print("> 12 < 30 c \(c)"); start = c
             }
             if Int(start_date_array_2[0])! > 12 && Int(start_date_array_2[0])! - 12 == Int(hm[0])! && Int(start_date_array_2[1]) >= Int(hm[1]) && time_array[1] == "PM"
             {
             print("> 12 >= 30 c \(c)"); start = c
             }
             }
             
             for d in 0 ..< hours_names.count
             {
             var time_array = hours_names[d].componentsSeparatedByString(" "); var hm = time_array[0].componentsSeparatedByString(".");
             
             print("calendar_day() plotWo() matching Int(end_date_array_2[0])  \(Int(end_date_array_2[0])) d \(d) hours_names[d] \(hours_names[d]) time_array[0] \(time_array[0]) time_array[1] \(time_array[1]) Int(hm[0]) \(Int(hm[0])) Int(hm[1]) \(Int(hm[1]))")
             
             if Int(end_date_array_2[0]) < 12 && Int(end_date_array_2[0]) == Int(hm[0]) && Int(end_date_array_2[1]) != 0 && Int(end_date_array_2[1]) < Int(hm[1]) && time_array[1] == "AM"
             {
             print("< 12 < 30 d \(d)"); end = d
             }
             if Int(end_date_array_2[0]) < 12 && Int(end_date_array_2[0]) == Int(hm[0]) && Int(end_date_array_2[1]) >= Int(hm[1]) && time_array[1] == "AM"
             {
             print("< 12 >= 30 d \(d)"); end = d
             }
             
             if Int(end_date_array_2[0]) == 12 && Int(end_date_array_2[0]) == Int(hm[0]) && Int(end_date_array_2[1]) != 0 && Int(end_date_array_2[1]) < Int(hm[1]) && time_array[1] == "PM"
             {
             print("== 12 < 30 d \(d)"); end = d
             }
             if Int(end_date_array_2[0]) == 12 && Int(end_date_array_2[0]) == Int(hm[0]) && Int(end_date_array_2[1]) >= Int(hm[1]) && time_array[1] == "PM"
             {
             print("== 12 >= 30 d \(d)"); end = d
             }
             
             if Int(end_date_array_2[0])! > 12 && Int(end_date_array_2[0])! - 12 == Int(hm[0])! && Int(end_date_array_2[1]) != 0 && Int(end_date_array_2[1]) < Int(hm[1]) && time_array[1] == "PM"
             {
             print("> 12 < 30 d \(d)"); end = d
             }
             if Int(end_date_array_2[0])! > 12 && Int(end_date_array_2[0])! - 12 == Int(hm[0])! && Int(end_date_array_2[1]) >= Int(hm[1]) && time_array[1] == "PM"
             {
             print("> 12 >= 30 d \(d)"); end = d
             }
             }
             
             button = UIButton(type: UIButtonType.System) as UIButton;                                           button.exclusiveTouch = true;
             button.frame = CGRectMake(inc, inc_y * CGFloat(start), self.width / 8, (self.height * (5/100)) * CGFloat((end - start)));
             button.titleLabel?.font = UIFont.systemFontOfSize((button.titleLabel?.font.pointSize)! - 2)
             button.setTitle(results!.stringForColumn("Name"), forState: .Normal);
             button.setTitleColor(UIColor.blackColor(), forState: .Normal);
             button.tag = Int(wo_array[1])!; // calendar_month_wodetailsrandom;
             button.addTarget(self, action: #selector(self.calendar_onclick), forControlEvents: UIControlEvents.TouchUpInside);
             uv.addSubview(button)
             
             switch matching_count
             {
             case 1: button.backgroundColor = UIColor(rgb: 0xE0FFFF); case 2: button.backgroundColor = UIColor(rgb: 0xADD8E6)
             case 3: button.backgroundColor = UIColor(rgb: 0xD8BFD8); case 4: button.backgroundColor = UIColor(rgb: 0xF5F5DC)
             case 5: button.backgroundColor = UIColor(rgb: 0xF5FFFA); case 6: button.backgroundColor = UIColor(rgb: 0x00b4ff)
             default: break
             }
             }
             } */
            
            justMonth = temp_month;  if temp_month == 0 { justMonth = 12 }
            
            let ds = String(justMonth) + "/" + String(starting_date) + "/" + String(temp_year);
            
            monthDateArray.append(String(starting_date));       monthMonthArray.append(String(justMonth));
            monthYearArray.append(String(temp_year))
            
            if b == 0
            {
                start_date = ds;                     //start_month = temp_month;           start_day = starting_date;             start_year = temp_year
            };
            
            if b == 6
            {
                end_date = ds;                      //end_month = temp_month;             end_day = starting_date;                end_year = temp_year
                //if end_month == start_month { }
            }
            
            if starting_date == getNumDays(year: temp_year, month: temp_month)!
            {
                starting_date = 1;                                                                                          temp_month = temp_month + 1;
                if temp_month > 12 { temp_year = temp_year + 1; temp_month = 1; }
            }
            else { starting_date = starting_date + 1 }
            
            //inc = inc + self.width / 8
            inc = inc + self.width / 7
            //print("b \(b) self.day_names[temp_day] \(self.day_names[temp_day]) self.day_values[b] \(self.day_values[b]) temp_day \(temp_day)")
        }
        
        scrollView.addSubview(uv);                                                                              view.addSubview(scrollView);
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false);
        //self.week.setTitle(start_date + " - " + end_date + " " + only_year, for: [])
        self.week.setTitle(start_date + " - " + end_date, for: [])
        
        var tc = 0
        
        print("date \(monthYearArray.count) \(monthMonthArray.count) \(monthDateArray.count)");
        
        for ab in 2001 ..< 2211
        {
            let t = ab - 2000
            var tt = t % 7
            if tt == 0 {tt = 7}
            print("tt \(tt) date \(monthYearArray[tt-1]+"-"+monthMonthArray[tt-1]+"-"+monthDateArray[tt-1]) hours_names_railway_time[tc] \(hours_names_railway_time[tc])");
            
            (uv.viewWithTag(ab) as! UIButton).accessibilityIdentifier = monthYearArray[tt-1]+"-"+monthMonthArray[tt-1]+"-"+monthDateArray[tt-1] + " " + hours_names_railway_time[tc]
            
            if t % 7 == 0 { tc = tc + 1; }
        }
    }
    
    @objc func selectTime(sender: UIButton)
    {
        //print("selectTime \((uv.viewWithTag(sender.tag) as! UIButton).accessibilityIdentifier)")
        print("selectTime sender.tag \(sender.tag)")
        print("selectTime \((self.view.viewWithTag(sender.tag) as! UIButton).accessibilityIdentifier)")
    }
    
    @objc func showprevweek()
    {
        var start_date_array = start_date.components(separatedBy: "/") //componentsSeparatedByString("/");
        temp_month = Int(start_date_array[0])!;
        starting_date = Int(start_date_array[1])!;                                                               temp_year = Int(start_date_array[2])!
        print("showprevweek() starting_date \(starting_date)")
        if starting_date > 7
        {
            starting_date = starting_date - 7
        }
        else if starting_date == 7
        {
            starting_date = starting_date - 7
            
            temp_month = temp_month - 1
            if temp_month < 1
            {
                temp_year = temp_year - 1
                prev_month_numofdays = getNumDays(year: Int(week_only_year)! - 1, month: Int(week_only_month)! - 1)!
            }
            else
            {
                prev_month_numofdays = getNumDays(year: Int(week_only_year)!, month: temp_month)!
            }
            print("showprevweek() prev_month_numofdays \(prev_month_numofdays)")
            
            starting_date = prev_month_numofdays;
        }
        else
        {
            temp_month = temp_month - 1
            if temp_month < 1
            {
                temp_year = temp_year - 1; temp_month = 12
                prev_month_numofdays = getNumDays(year: Int(week_only_year)! - 1, month: Int(week_only_month)! - 1)!
            }
            else
            {
                prev_month_numofdays = getNumDays(year: Int(week_only_year)!, month: temp_month)!
            }
            print("showprevweek() prev_month_numofdays \(prev_month_numofdays)")
            
            starting_date = prev_month_numofdays - (7 - starting_date);
        }
        
        print("showprevweek() temp_month \(temp_month) starting_date \(starting_date) temp_year \(temp_year)")
        
        plotWeek()
        selectedDate = getDate(date: String(temp_year) + "-" + String(temp_month) + "-" + String(starting_date-1))!
        getWholeWeekDays(date: selectedDate)
        calendar_month()
        
        if temp_month < Int(only_month)! || (temp_month == 12 && only_month == "1")
        {
            showprevmonth()
        }
    }
    
    @objc func shownextweek()
    {
        var start_date_array = end_date.components(separatedBy: "/") //componentsSeparatedByString("/");
        temp_month = Int(start_date_array[0])!;
        starting_date = Int(start_date_array[1])!;                                                              temp_year = Int(start_date_array[2])!
        
        if starting_date == getNumDays(year: temp_year, month: temp_month)!
        {
            starting_date = 1; temp_month = temp_month + 1;
            if temp_month > 12 { temp_year = temp_year + 1; temp_month = 1; }
        }
        else { starting_date = starting_date + 1 }
        
        print("shownextweek() temp_month \(temp_month) starting_date \(starting_date) temp_year \(temp_year)")
        
        plotWeek()
        selectedDate = getDate(date: String(temp_year) + "-" + String(temp_month) + "-" + String(starting_date-1))!
        getWholeWeekDays(date: selectedDate)
        calendar_month()
        
        if temp_month > Int(only_month)! || (temp_month == 1 && only_month == "12")
        {
            shownextmonth()
        }
    }
}
