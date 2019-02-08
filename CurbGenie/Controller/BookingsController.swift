import UIKit

private let reuseIdentifier = "Cell"

//Global variables to keep track of what the user selects
var selectedDate: AnyObject?
var selectedAirport: Airport?
var selectedAirline: Airline?
var selectedCompany: Company?

class BookingsController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    let cellId = "cellId"; var company_logo = "ace",    airport_logo = "jfk_airport",   airline_logo = "FL",    airport_cityState = "Queens, NY";
    
    //var airports = ["John F. Kennedy Airport", "LaGuardia Airport"]
    var airports = ["JFK International Airport", "LaGuardia Airport"]
    var airport_images = ["jfk_airport", "lga_airport"]
    var airport_city_states = ["Queens, NY", "Queens, NY"]
    
    var airlines = ["Southwest", "Delta", "Ryanair", "United", "American Airlines", "AirAsia", "easyJet", "All Nippon", "Qatar Airways", "Emirates", "Japan Airlines", "IndiGo Airlines", "Wizzair", "Spring Airlines", "JetBlue", "British Airways", "Lufthansa", "Turkish Airlines", "LATAM", "China Southern", "Alaska Airlines", "Spirit", "Aeroflot", "KLM", "Cathay Pacific", "Vueling Airlines", "Norwegian Air Shuttle", "Air Canada", "Jet Airways", "Iberia", "Air France", "Frontier", "Etihad", "Air Arabia", "Cebu Pacific", "Singapore Airlines", "Saudia", "Qantas", "Shanghai Airlines", "China Eastern", "Alitalia", "Air India", "Eurowings", "Malaysia Airlines", "Korean Air"]
     
    var airline_images = ["FL", "DL", "FR", "UA", "AA", "AK", "U2", "NH", "QR", "EK", "JL", "6E", "W6", "9C", "B6", "BA", "LH", "TK", "4C", "CZ", "AS",  "NK", "SU", "KL", "CX", "VY", "DY", "AC", "9W", "IB", "AF", "F9", "EY", "G9", "5J", "SQ", "SV", "QF", "FM", "MU", "AZ", "AI", "4U", "MH",  "KE" ]
    
    var rental_company = [ "Ace Rent A Car", "Alamo", "Avis", "Budget", "Dollar", "Enterprise", "Firefly", "Fox Rent a Car", "Hertz", "National", "Sixt", "Thrifty" ]
    
    var rental_company_logo = [ "ace", "alamo", "avis", "budget", "dollar", "enterprise", "firefly", "fox", "hertz", "national", "sixt", "thrifty" ]
    
    var window: UIWindow?, loginController: LoginController?, registerController: RegisterController?, tableView = UITableView(), refreshControl = UIRefreshControl(), field_title = "", value = "", airport = "", airline =  "", company = "";
    
    var id = [String](), start_date = [String](), start_time = [String](), end_date = [String](), end_time = [String](), status = [String]();
    
    let filemgr = FileManager.default;
    var databasePath = NSString(), refresher = UIRefreshControl()
    let width = UIScreen.main.bounds.size.width; let height = UIScreen.main.bounds.size.height

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        refresher = UIRefreshControl()
        collectionView!.alwaysBounceVertical = true
        refresher.tintColor = UIColor.mainColor()
        refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        collectionView!.addSubview(refresher)
        
        print(bookings)
        
        view.addSubview(noBookingImage)
        view.addSubview(noBookingLabel)
        view.addSubview(bookNowButton)
        
        setupBookingControllerUI()
        
        //custom booking icon that has the same functionlity as the booking button
        let menubuttonIcon = UIImage(named: "menuButton")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menubuttonIcon, style: .plain, target: self, action: #selector(handleMenuBtnClicked))
        let bookIcon = UIImage(named: "bookIcon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: bookIcon, style: .plain, target: self, action: #selector(handleBookNow))
        
        navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        navigationItem.title = "Your Bookings"
        
        // Register cell classes
        collectionView?.register(BookingCell.self, forCellWithReuseIdentifier: cellId)
        
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
        center.addObserver(self, selector: #selector(self.showBookings), name: NSNotification.Name("getClientBookings"), object: nil)
        center.addObserver(self, selector: #selector(self.showBookings), name: NSNotification.Name("book"), object: nil)
         
        getUserDetails()
        HomeModel.getInstance().download_progress = 1
        HomeModel.getInstance().showSyncAlert()
        HomeModel.getInstance().page = "getClientBookings"
        HomeModel.getInstance().method = "getToken"
        HomeModel.getInstance().downloadItems()        
    }
    
    @objc func loadData()
    {
        HomeModel.getInstance().download_progress = 1
        HomeModel.getInstance().showSyncAlert()
        HomeModel.getInstance().page = "getClientBookings"
        HomeModel.getInstance().method = "getToken"
        HomeModel.getInstance().downloadItems()
        stopRefresher()
    }
    
    func stopRefresher() { self.refresher.endRefreshing() }
    
    @objc func refresh()
    {
        HomeModel.getInstance().download_progress = 1
        HomeModel.getInstance().showSyncAlert()
        HomeModel.getInstance().page = "getClientBookings"
        HomeModel.getInstance().method = "getToken"
        HomeModel.getInstance().downloadItems()
    }
    
    @objc func getUserDetails()
    {
        let filemgr = FileManager.default;                               let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: self.databasePath as String);
        contactDB!.open()
            let sql = "SELECT * FROM User";                                                 print("LoginController getUserDetails sql \(sql)")
            let results : FMResultSet? = contactDB!.executeQuery(sql, withArgumentsIn: nil)
            while results!.next()
            {
                print("LoginController getUserDetails Email \(String(describing: results!.string(forColumn: "Email"))) Password \(String(describing: results!.string(forColumn: "Password"))) ClientId \(String(describing: results!.string(forColumn: "ClientId"))) Full_Name \(String(describing: results!.string(forColumn: "Full_Name")))")
                HomeModel.getInstance().Email = results!.string(forColumn: "Email")
                HomeModel.getInstance().Password = results!.string(forColumn: "Password")
                HomeModel.getInstance().clientId = results!.string(forColumn: "ClientId")
                HomeModel.getInstance().First_Name = results!.string(forColumn: "Full_Name")
            }
        contactDB!.close()
    }
    
    @objc func showBookings()
    {
        let filemgr = FileManager.default;                               let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: self.databasePath as String);
        contactDB!.open()
            let sql = "SELECT * FROM Booking ORDER BY start_date ASC";                      print("LoginController showBookings sql \(sql)")
            let results : FMResultSet? = contactDB!.executeQuery(sql, withArgumentsIn: nil)
            id = [String]();        start_date = [String]();        start_time = [String]();        end_date = [String]();        end_time = [String]();
            status = [String]();    field_title = "";               value = "";                     airport = "";                 airline =  "";
            company = "";           airport_logo = "";              airline_logo = "";              airport_cityState = "";       bookings = [Booking]();
            while results!.next()
            {
                //print("LoginController showBookings Login results City \(String(describing: results!.string(forColumn: "id")))")
                //cities.append(results!.stringForColumn("City"))
                
                let id_string = results!.string(forColumn: "id");                       let start_date_string = results!.string(forColumn: "start_date")
                let start_time_string = results!.string(forColumn: "start_time");       let end_date_string = results!.string(forColumn: "end_date")
                let end_time_string = results!.string(forColumn: "end_time");           let status_string = results!.string(forColumn: "status")
                
                id.append(id_string!);                                                   start_date.append(start_date_string!)
                start_time.append(start_time_string!);                                   end_date.append(end_date_string!)
                end_time.append(end_time_string!);                                       status.append(status_string!)
                
                //bookings.append(Booking(confirmationCode: "8hfyv4i", date: "January 19, 2019", time: "2:30 PM", airport: "JFK International Airport", airportCity: "New York, NY", airportImage: "DMEMoscowRussia", airline: "Delta", airlineImage: "DL", company: "Budget", companyImage: "budget", price: "$25", customerName: "John Smith"))
                
                let sql_1 = "SELECT * FROM Booking_Info WHERE booking_id = '"+id_string!+"'";     print("LoginController showBookings sql_1 \(sql_1)")
                let results_1 : FMResultSet? = contactDB!.executeQuery(sql_1, withArgumentsIn: nil)
                
                while results_1!.next()
                {
                   //cities.append(results!.stringForColumn("City"))
                    field_title = results_1!.string(forColumn: "field_title")
                    value = results_1!.string(forColumn: "field_value")
                    
                    if(field_title == "Airport")
                    {
                        airport = value
                        
                        for k in 0 ..< airports.count
                        {
                            if(airport == airports[k])
                            {
                                airport_logo = airport_images[k]
                                airport_cityState = airport_city_states[k]
                            }
                        }
                    }
                    if(field_title == "Airline")
                    {
                        airline = value
                        
                        for k in 0 ..< airlines.count
                        {
                            if(airline == airlines[k])
                            {
                                airline_logo = airline_images[k]
                            }
                        }
                    }
                    if(field_title == "Rental Company")
                    {
                        company = value
                        
                        for k in 0 ..< rental_company.count
                        {
                            if(company == rental_company[k])
                            {
                                company_logo = rental_company_logo[k]
                            }
                        }
                    }
                }
                
                print("LoginController showBookings Login results start_date_string \(start_date_string) start_time_string \(start_time_string) airport \(airport) airport_cityState \(airport_cityState) airport_logo \(airport_logo) airline \(airline) airline_logo \(airline_logo) company \(company) company_logo \(company_logo)")
                
                //yyyy-MM-dd'T'HH:mm:ss
                var date = getDate(date: start_date_string!);                                  var ndateFormatter = DateFormatter()
                //print("249 date \(String(describing: date))")
                ndateFormatter.dateFormat = "MMMM dd, yyyy";                                   //+ "'T'" + start_time_string!h:mm a yyyy-MM-dd HH:mm";
                let booking_date = ndateFormatter.string(from: date!);
                
                var booking_time = ""
                let dateFormatter = DateFormatter();                                                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                //for (index, time) in arrayTimes.enumerated()
                //{
                dateFormatter.dateFormat = "H:mm:ss"
                if let inDate = dateFormatter.date(from: start_time_string!)
                {
                    dateFormatter.dateFormat = "hh:mm a";                                            let outTime = dateFormatter.string(from:inDate)
                    print("in \(start_time_string!)");                                                            print("out \(outTime)")
                    //arrayTimes[index] = outTime
                    booking_time = outTime
                }
                
                //
                date = getDate(date: end_date_string!);
                let booking_end_date = ndateFormatter.string(from: date!);
                
                var start = end_time_string!.index(end_time_string!.startIndex, offsetBy: 0)
                var end = end_time_string!.index(end_time_string!.startIndex, offsetBy: 5)
                var range = start..<end
                let booking_end_time = end_time_string![range]
                
                bookings.append(Booking(id: id_string!, confirmationCode: results!.string(forColumn: "code"), date: booking_date, time: String(booking_time), endDate: booking_end_date, endTime: String(booking_end_time), airport: airport, airportCity: airport_cityState, airportImage: airport_logo, airline: airline, airlineImage: airline_logo, company: company, companyImage: company_logo, price: "$25", customerName: HomeModel.getInstance().First_Name))
                
                //bookings.append(Booking(confirmationCode: results!.string(forColumn: "code"), date: "January 29, 2019", time: "22:55 PM", airport: airport, airportCity: airport_cityState, airportImage: airport_logo, airline: airline, airlineImage: airline_logo, company: company, companyImage: company_logo, price: "$25", customerName: "John Smith"))
            }
        contactDB!.close()
        
        HomeModel.getInstance().download_progress = 0
        
        DispatchQueue.main.async
        {
            if self.id.count > 0
            {
                //self.tableView.isHidden = false
                
                self.noBookingImage.isHidden = true
                self.noBookingLabel.isHidden = true
                self.bookNowButton.isHidden = true
                
                self.collectionView?.isHidden = false
            }
            else
            { 
                self.noBookingImage.isHidden = false
                self.noBookingLabel.isHidden = false
                self.bookNowButton.isHidden = false
            }
            
            //self.tableView.addSubview(self.refreshControl);   self.tableView.reloadData();            self.refreshControl.endRefreshing()
            self.collectionView?.reloadData()
            
            let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
            if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
            if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
        }
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

    //MARK: UI Setup
    
    let noBookingImage: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "calendar")
        view.image = image
        //view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let noBookingLabel: UILabel = {
        let label = UILabel()
        label.text = "You don't have any scheduled bookings."
        label.font = UIFont (name: "Nunito-Regular", size: 18)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bookNowButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.mainColor()
        button.setTitle("Book Now", for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        //button.alpha = 0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleBookNow), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Functions
    
    //set up the UI programatically
    @objc func setupBookingControllerUI() {
        
        //noBookingImage constraints
        noBookingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 8).isActive = true
        noBookingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        noBookingImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        noBookingImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //noBookingLabel constraints
        noBookingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noBookingLabel.topAnchor.constraint(equalTo: noBookingImage.bottomAnchor, constant: 24).isActive = true
        noBookingLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
        noBookingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //bookNowButton constraints
        bookNowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookNowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        bookNowButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        bookNowButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    //create link to MenuLauncher file and call function from there
    lazy var menuLauncher: MenuLauncher = { //only occurs once when nil
        let launcher = MenuLauncher()
        launcher.bookingsController = self
        return launcher
    }()
    
    @objc func handleMenuBtnClicked() {
        
        menuLauncher.showSettings()
    }
    
    //main function to create a new booking/dropoff
    @objc func handleBookNow()
    {
        print("Make a booking")
        HomeModel.getInstance().register = 1
        let selectDateController = SelectDateController()
        selectDateController.bookingsController = self
        navigationController?.pushViewController(selectDateController, animated: true)
    }
    
    //shows controller for selected setting
    @objc func showControllerForSetting(setting: Settings)
    {
        if setting.name.rawValue == "Log Out"
        {
            //navigationController?.pushViewController(LoginController(), animated: true)
            
            //segue to booking controller if login successful
            //let bookingsController = BookingsController()
            //bookingsController.loginController = self
            
            let filemgr = FileManager.default;                              let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);
            contactDB!.open()
            
                if contactDB!.executeStatements("DELETE FROM User") { print("Record deleted from User") }
                else { print("Record deletion from User Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            self.present(LoginController(), animated: true, completion: nil)
        }
        else
        { 
            let settingVC = UIViewController()
            settingVC.navigationItem.title = setting.name.rawValue
            settingVC.view.backgroundColor = .white
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            navigationController?.pushViewController(settingVC, animated: true)
        }
    }
    
    //sets the airline selected so it can be accessed in another VC
    @objc func showModifyBookingController()
    {
        let showModifyBookingController = ModifyBookingController()
        showModifyBookingController.bookingsController = self
        navigationController?.pushViewController(showModifyBookingController, animated: true) 
    }
    
    //MARK: Collectionview setup
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return bookings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BookingCell
        
        cell.booking = bookings[indexPath.item]
         
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        HomeModel.getInstance().idid = String(indexPath.item)
        //edit or cancel booking
        showModifyBookingController()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (view.frame.width) - 24, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
    }
} 
