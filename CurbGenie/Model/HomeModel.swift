import Foundation
import UIKit
import CommonCrypto

let sharedInstance = HomeModel()

class HomeModel: NSObject, URLSessionDataDelegate
{
    var data : NSMutableData = NSMutableData(),    dataRows = NSDictionary(),      idid = "",      state = "",      First_Name = "",            Last_Name = "",
    Email = "",                                    Password = "",                  Phone = "",     State_text = "", City = "",              Street = "",
    Zip = "",                                      present_page = "",              previous_page = "",              dropdown_value = "",        search_value = "",
    download_progress = 0,                         shipping = 0,                   Best = "",      Comment = "",    toplabel_message = "Error",
    errormessage = "",                             show_password_flag = 0,         keep_signed_flag = 0,            category = "",
    search_page = 0 ,                              urlPath = String(),             databasePath = NSString(),       page = String(),
    search_string = String(),                      main_total = String(),          total = String(),                font_normal = "GillSans",   font_bold = "GillSans-Bold",
    ids = [String](),                              descs = [String](),             prices = [String](),
    skus = [String](),                             warranties_double = [Double](), models = [String](),             redirected = 0,
    menu_flag = 0,                                 register = 1,                   images = [String](),             basic_prices = [String](), warranties = [String](),                   clientId = "",                  fire_count = 0,
    quantities = [String](),                       urlPath_backup = String()
    
    var  pids = "", Created_On = "", shippingId = "", otp = "", shop_by_category = 0, typeid = "", airport = "", airline = "", company = ""
    
    var font_5 = CGFloat(25.0),   font_6 = CGFloat(26.0),         font_7 = CGFloat(27.0),         font_8 = CGFloat(28.0),        font_9 = CGFloat(29.0), font_10 = CGFloat(10.0), font_11 = CGFloat(11.0), font_12 = CGFloat(12.0), font_13 = CGFloat(13.0), font_14 = CGFloat(14.0),         font_15 = CGFloat(15.0), font_16 = CGFloat(16.0), font_17 = CGFloat(17.0), font_18 = CGFloat(18.0), font_19 = CGFloat(19.0), font_20 = CGFloat(20.0), font_25 = CGFloat(25.0)
    
    var global_user_id = "",    typescode = [String](),     types = [String](),     typesint = [Int](),         brandscode = [String](),    brands = [String]();
    var brandsint = [Int](),    colors = [String](),        colorsint = [Int](),    small = Float(), large = Float(), min_price = Int(), max_price = Int();
    var filter_flag = 0,        font_0 = CGFloat(0.0),      guestloginid = String()
    var product_query = "" 
    
    var userId = "", userName = "", method = "", request = URLRequest(url: URL(string: "https://user-api.simplybook.me/login")!), xtoken = "", bookDate = "", bookTime = "", endDate = "", endTime = "", Book_Id = ""
    
    let filemgr = FileManager.default;
    
    class func getInstance() -> HomeModel { return sharedInstance }
    
    func get_font_size(font_size : CGFloat) -> CGFloat
    {
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            let inc = CGFloat(15);  font_0 = CGFloat(0.0) + inc;
            font_5 = CGFloat(5.0) + inc;         font_6 = CGFloat(6.0) + inc;         font_7 = CGFloat(7.0) + inc;          font_8 = CGFloat(8.0) + inc;
            font_9 = CGFloat(9.0) + inc;         font_10 = CGFloat(10.0) + inc;       font_11 = CGFloat(11.0) + inc;        font_12 = CGFloat(12.0) + inc;
            font_13 = CGFloat(13.0) + inc;       font_14 = CGFloat(14.0) + inc;       font_15 = CGFloat(15.0) + inc;        font_16 = CGFloat(16.0) + inc;
            font_17 = CGFloat(17.0) + inc;       font_18 = CGFloat(18.0) + inc;       font_19 = CGFloat(19.0) + inc;
            font_20 = CGFloat(20.0) + inc;       font_25 = CGFloat(25.0) + inc
        }
        else
        {
            font_10 = CGFloat(10.0);        font_11 = CGFloat(11.0);        font_12 = CGFloat(12.0);        font_13 = CGFloat(13.0);
            font_14 = CGFloat(14.0);
            font_15 = CGFloat(15.0);        font_16 = CGFloat(16.0);        font_17 = CGFloat(17.0);        font_18 = CGFloat(18.0);
            font_19 = CGFloat(19.0);
            font_20 = CGFloat(20.0);        font_25 = CGFloat(25.0)
            
            let modelName = UIDevice.modelName
            
            //print("HomeModel modelName \(modelName)")
            
            if modelName == "iPhone 5s" || modelName == "iPhone SE" // 4.0
            {
                
            }
            
            if modelName == "iPhone 6" || modelName == "iPhone 7" || modelName == "iPhone 8" || modelName == "iPhone 6s" // 4.8
            {
                font_10 = font_10 + font_10 * (50/100);        font_11 = font_11 + font_11 * (50/100);        font_12 = font_12 + font_12 * (50/100);
                font_13 = font_13 + font_13 * (50/100);        font_14 = font_14 + font_14 * (50/100);        font_15 = font_15 + font_15 * (50/100);
                font_16 = font_16 + font_16 * (50/100);        font_17 = font_17 + font_17 * (50/100);        font_18 = font_18 + font_18 * (50/100);
                font_19 = font_19 + font_19 * (50/100);        font_20 = font_20 + font_20 * (50/100);        font_25 = font_25 + font_25 * (50/100);
            }
            
            if modelName == "iPhone 6 Plus" || modelName == "iPhone 6s Plus" || modelName == "iPhone 7 Plus" || modelName == "iPhone 8 Plus" // 5.5
            {
                font_10 = font_10 + font_10 * (70/100);        font_11 = font_11 + font_11 * (70/100);        font_12 = font_12 + font_12 * (70/100);
                font_13 = font_13 + font_13 * (70/100);        font_14 = font_14 + font_14 * (70/100);        font_15 = font_15 + font_15 * (70/100);
                font_16 = font_16 + font_16 * (70/100);        font_17 = font_17 + font_17 * (70/100);        font_18 = font_18 + font_18 * (70/100);
                font_19 = font_19 + font_19 * (70/100);        font_20 = font_20 + font_20 * (70/100);        font_25 = font_25 + font_25 * (70/100);
            }
            
            if modelName == "iPhone X" || modelName == "iPhone XS" // 5.8
            {
                font_10 = font_10 + font_10 * (75/100);        font_11 = font_11 + font_11 * (75/100);        font_12 = font_12 + font_12 * (75/100);
                font_13 = font_13 + font_13 * (75/100);        font_14 = font_14 + font_14 * (75/100);        font_15 = font_15 + font_15 * (75/100);
                font_16 = font_16 + font_16 * (75/100);        font_17 = font_17 + font_17 * (75/100);        font_18 = font_18 + font_18 * (75/100);
                font_19 = font_19 + font_19 * (75/100);        font_20 = font_20 + font_20 * (75/100);        font_25 = font_25 + font_25 * (75/100);
            }
            
            if modelName == "Simulator iPhone XR" || modelName == "iPhone XR" // 6.1
            {
                font_10 = font_10 + font_10 * (80/100);        font_11 = font_11 + font_11 * (80/100);        font_12 = font_12 + font_12 * (80/100);
                font_13 = font_13 + font_13 * (80/100);        font_14 = font_14 + font_14 * (80/100);        font_15 = font_15 + font_15 * (80/100);
                font_16 = font_16 + font_16 * (80/100);        font_17 = font_17 + font_17 * (80/100);        font_18 = font_18 + font_18 * (80/100);
                font_19 = font_19 + font_19 * (80/100);        font_20 = font_20 + font_20 * (80/100);        font_25 = font_25 + font_25 * (80/100);
            }
            
            if modelName == "iPhone XS Max" // 6.5
            {
                font_10 = font_10 + font_10 * (90/100);        font_11 = font_11 + font_11 * (90/100);        font_12 = font_12 + font_12 * (90/100);
                font_13 = font_13 + font_13 * (90/100);        font_14 = font_14 + font_14 * (90/100);        font_15 = font_15 + font_15 * (90/100);
                font_16 = font_16 + font_16 * (90/100);        font_17 = font_17 + font_17 * (90/100);        font_18 = font_18 + font_18 * (90/100);
                font_19 = font_19 + font_19 * (90/100);        font_20 = font_20 + font_20 * (90/100);        font_25 = font_25 + font_25 * (90/100);
            }
        }
        
        //print("font_size \(font_size)")
        
        switch font_size
        {
        case 0 :   /* print("font_5 \(font_5)"); */         return font_0
        case 5 :   /* print("font_5 \(font_5)"); */         return font_5
        case 6:    /* print("font_6 \(font_6)"); */         return font_6
        case 7 :   /* print("font_7 \(font_7)"); */         return font_7
        case 8 :   /* print("font_8 \(font_8)"); */         return font_8
        case 9 :   /* print("font_9 \(font_9)"); */         return font_9
        case 10 :  /* print("font_10 \(font_10)"); */       return font_10
        case 11 :  /* print("font_11 \(font_11)"); */       return font_11
        case 12 :  /* print("font_12 \(font_12)"); */       return font_12
        case 13 :  /* print("font_13 \(font_13)"); */       return font_13
        case 14 :  /* print("font_14 \(font_14)");  */      return font_14
        case 15 :  /* print("font_15 \(font_15)");  */      return font_15
        case 16 :  /* print("font_16 \(font_16)"); */       return font_16
        case 17 :  /* print("font_17 \(font_17)"); */       return font_17
        case 18 :  /* print("font_18 \(font_18)"); */       return font_18
        case 19 :  /* print("font_19 \(font_19)"); */       return font_19
        case 20 :  /* print("font_20 \(font_20)");  */      return font_20
        case 25 :   /* print("font_25 \(font_25)"); */      return font_25
        default: return 0
        }
    }
    
    func createTables()
    {
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
        databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: databasePath as String);
        contactDB!.open()
        
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String;           var build_version = ""
        
        let results1: FMResultSet? = contactDB!.executeQuery("SELECT name FROM sqlite_master WHERE type = 'table' AND name = 'build_version'", withArgumentsIn: nil)
        var activity_table_count = Int(); while results1!.next() { activity_table_count += 1 }
        
        if activity_table_count > 0
        {
            let results1: FMResultSet? = contactDB!.executeQuery("SELECT * FROM build_version" , withArgumentsIn: nil);
            
            while results1!.next() { build_version = results1!.string(forColumn: "build_version") }
            
            print("createTables() build_version \(build_version) version \(version)")
            
            if build_version != version
            {
                if contactDB!.executeStatements("DROP TABLE IF EXISTS User") { print("User table dropped") }
                else { print("User table not dropped Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                
                if contactDB!.executeStatements("DROP TABLE IF EXISTS Booking") { print("Booking table dropped") }
                else { print("Booking table not dropped Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                
                if contactDB!.executeStatements("DROP TABLE IF EXISTS Booking_Info") { print("Booking_Info table dropped") }
                else { print("Booking_Info table not dropped Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                
                if contactDB!.executeStatements("DROP TABLE IF EXISTS build_version") { print("build_version table dropped") }
                else { print("build_version table not dropped Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            }
        }
        
        if contactDB!.executeStatements("CREATE TABLE IF NOT EXISTS User (Id TEXT, Full_Name TEXT, Email TEXT, Password TEXT, Phone TEXT, Dob TEXT, Country TEXT, ClientId TEXT)") { print("User table created") }
        else { print("User table not created Error: \(String(describing: contactDB!.lastErrorMessage()))") }
        
        if contactDB!.executeStatements("CREATE TABLE IF NOT EXISTS Booking (service_id TEXT, provider_id TEXT, start_date TEXT, start_time TEXT, end_date TEXT, end_time TEXT, id TEXT, code TEXT, hash TEXT, time_offset TEXT, status TEXT, is_cancellable TEXT, event_duration TEXT, event_buffertime_before TEXT, event_buffertime_after TEXT, additional_fields_values TEXT)") { print("Booking table created") }
        else { print("Booking table not created Error: \(String(describing: contactDB!.lastErrorMessage()))") }
        
        if contactDB!.executeStatements("CREATE TABLE IF NOT EXISTS Booking_Info (booking_id TEXT, field_id TEXT, field_title TEXT, field_name TEXT, field_value TEXT, field_position TEXT, field_pos TEXT)") { print("Booking_Info table created") }
        else { print("Booking_Info table not created Error: \(String(describing: contactDB!.lastErrorMessage()))") }
        
        if contactDB!.executeStatements("CREATE TABLE IF NOT EXISTS build_version  (build_version TEXT)") { print("build_version table created") }
        else { print("build_version table not created Error: \(String(describing: contactDB!.lastErrorMessage()))") }
        
        var tinsertSQL = "INSERT INTO build_version (build_version) VALUES ("
        tinsertSQL = tinsertSQL + "'"+version+"')"
        print("page \(self.page) tinsertSQL \(tinsertSQL)")
        
        let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
        
        if !result
        {
            //rollback.initialize(true)
            //rollback!.pointee = true
            print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
        }
        else
        {
            print("Record inserted in table build_version")
            //self.insertCount += 1
        }
        
        contactDB!.close()
        //checkDB()        
    }
    
    func refresh() // page : String, search_string : String Search_String = '"+urlPath+"'
    {
        print("refresh() page \(page) urlPath \(urlPath)")
        if page == "home"
        {
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);
            contactDB!.open()
            
            if contactDB!.executeStatements("DELETE FROM Search_Record WHERE Page = '"+page+"'")
            {
                print("Record deleted from Search_Record")
            }
            else { print("Record deletion from Search_Record Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Home_Products")
            {
                print("All Records deleted from Home_Products")
            }
            else { print("Record deletion from Home_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            checkDB()
        }
        
        if page == "search" || page == "types" || page == "all"
        {
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);
            contactDB!.open()
            
            if contactDB!.executeStatements("DELETE FROM Home_Products") { print("All Records deleted from Home_Products") }
            else { print("Record deletion from Home_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Products") { print("All Records deleted from Products") }
            else { print("Record deletion from Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Search_Record") { print("All Records deleted from Search_Record") }
            else { print("Record deletion from Search_Record Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Search_Products") { print("All Records deleted from Search_Products") }
            else { print("Record deletion from Search_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM type") { print("All Records deleted from type") }
            else { print("Record deletion from type Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM brand") { print("All Records deleted from brand") }
            else { print("Record deletion from brand Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM color") { print("All Records deleted from color") }
            else { print("Record deletion from color Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM price") { print("All Records deleted from price") }
            else { print("Record deletion from price Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Todays") { print("All Records deleted from Todays") }
            else { print("Record deletion from Todays Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Model_Names") { print("All Records deleted from Model_Names") }
            else { print("Record deletion from Model_Names Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM banners") { print("All Records deleted from banners") }
            else { print("Record deletion from banners Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            checkDB()
        }
        
        if page == "category"
        {
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);
            contactDB!.open()
            
            if contactDB!.executeStatements("DELETE FROM Home_Products") { print("All Records deleted from Home_Products") }
            else { print("Record deletion from Home_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Products") { print("All Records deleted from Products") }
            else { print("Record deletion from Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Search_Record")  { print("All Records deleted from Search_Record") }
            else { print("Record deletion from Search_Record Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Search_Products") { print("All Records deleted from Search_Products") }
            else { print("Record deletion from Search_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Todays") { print("All Records deleted from Todays") }
            else { print("Record deletion from Todays Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            checkDB()
        }
        
        if page == "offers"
        {
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);
            contactDB!.open()
            
            if contactDB!.executeStatements("DELETE FROM Search_Record WHERE Page = '"+page+"' ") { print("Record deleted from Search_Record where page = offers") }
            else { print("Record deletion from Search_Record Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            if contactDB!.executeStatements("DELETE FROM Todays") { print("All Records deleted from Todays") }
            else { print("Record deletion from Todays Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            checkDB()
        }
    }
    
    func updateDB() // page : String, search_string : String
    {
        print("updateDB() page \(page) urlPath \(urlPath)")
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
        databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: databasePath as String);                           let queue = FMDatabaseQueue(path: self.databasePath as String)
        contactDB!.open()
        
        let date = NSDate();                                                                        let ndateFormatter = DateFormatter()
        ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let Created_On = ndateFormatter.string(from: date as Date);                                       //print("updateDB() Created_On \(Created_On)")
        
        var tinsertSQL = "INSERT INTO Search_Record (Page, Search_String, Created_On) VALUES ("
        
        tinsertSQL = tinsertSQL + "'" + page + "', '"+urlPath+"', '"+Created_On+"')"
        
        queue!.inTransaction()
            {
                contactDB, rollback in
                
                let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                
                if !result
                {
                    rollback!.pointee = true
                    //initialize(true)
                    print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                }
                else
                {
                    print("Record inserted in table Search_Record")
                }
        }
        
        contactDB!.close()
    }
    
    func checkDB() // page : String, search_string : String
    {
        print("checkDB() page \(page) urlPath \(urlPath)")
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
        databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
        let contactDB = FMDatabase(path: databasePath as String); var exists = 0
        contactDB!.open()
        
        let results1: FMResultSet? = contactDB!.executeQuery("SELECT * FROM Search_Record WHERE Search_String = '"+urlPath+"'" , withArgumentsIn: nil);
        
        while results1!.next()
        {
            exists = exists + 1
        }
        
        contactDB!.close()
        
        if exists == 0 { print("checkDB() exists \(exists) calling updateDB()");             updateDB();             downloadItems()  }
        else
        {
            if page == "home"
            { print("checkDB() exists \(exists) calling viewcontroller load");   NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil) }
            
            if page == "search"
            {
                if present_page == "DetailController"
                { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect"), object: nil) }
                
                if present_page == "CartController"
                { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect_cart"), object: nil) }
                
                if present_page == "LoginController"
                { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect_login"), object: nil) }
                
                if present_page == "AdvancedController"
                { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect_advanced"), object: nil) }
                
                print("checkDB() exists \(exists) calling searchcontroller loadSearchResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSearchResults"), object: nil)
            }
            
            if page == "advanced"
            {
                print("checkDB() exists \(exists) calling advancedcontroller loadAdvancedResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAdvancedResults"), object: nil)
            }
            
            if page == "signup"
            {
                print("checkDB() exists \(exists) calling logincontroller loadcities")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadcities"), object: nil)
            }
            
            if page == "category"
            {
                print("checkDB() exists \(exists) calling categorylistcontroller loadCategoryResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadCategoryResults"), object: nil)
            }
            
            if page == "types"
            {
                print("checkDB() exists \(exists) calling categorycontroller loadTypesResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTypesResults"), object: nil)
            }
            
            if page == "offers"
            {
                print("checkDB() exists \(exists) calling offerscontroller loadOffersResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadOffersResults"), object: nil)
            }
            
            if page == "keyword_search"
            {
                print("checkDB() exists \(exists) calling searchcontroller loadModelsResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadModelsResults"), object: nil)
            }
            
            if page == "all"
            {
                print("checkDB() exists \(exists) calling splashcontroller loadSplashResults")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSplashResults"), object: nil)
            }
        }
    }
    
    func showSyncAlert()
    {
        //dispatch_async(dispatch_get_main_queue(), { () -> Void in
        DispatchQueue.main.async {
            
            let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
            
            if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("showSyncAlert() 1115"); viewWithTag.removeFromSuperview(); } }
            if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("showSyncAlert() 1116"); viewWithTag.removeFromSuperview(); } }
            if win.viewWithTag(1117) != nil  { if let viewWithTag = win.viewWithTag(1117)  { print("showSyncAlert() 1117"); viewWithTag.removeFromSuperview(); } }
            if win.viewWithTag(1118) != nil  { if let viewWithTag = win.viewWithTag(1118)  { print("showSyncAlert() 1118"); viewWithTag.removeFromSuperview(); } }
            
            var alertView:AlertView!;                                           var blurEffectView:UIVisualEffectView!;
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            blurEffectView = UIVisualEffectView(effect: blurEffect);
            blurEffectView.alpha = 0.3;
            blurEffectView.frame = win.bounds //self.win.bounds
            
            //if self.delegate.device == "iPhone"
            //{
            
            //alertView = AlertView(frame: CGRect(x: 5, y: self.win.frame.height / 2 - ((self.win.frame.height / 8) / 2), width: self.win.frame.width - 10, height: self.win.frame.height / 8), cas: 1)
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                alertView = AlertView(frame: CGRect(x: win.frame.width * 20 / 100, y: win.frame.height / 2 - ((win.frame.height / 16) / 2), width: win.frame.width * 60 / 100, height: win.frame.height / 16), cas: 1)
            }
            else
            {
                alertView = AlertView(frame: CGRect(x: 5, y: win.frame.height / 2 - ((win.frame.height / 8) / 2), width: win.frame.width - 10, height: win.frame.height / 8), cas: 1)
            }
            /* }
             else
             {
             alertView = AlertView(frame: CGRect(x: self.win.frame.midX - (self.win.frame.width / 3) / 2, y: self.win.frame.height / 2 - ((self.win.frame.height / 8) / 2), width: self.win.frame.width / 3, height: self.win.frame.height / 8), cas: 1)
             }
             
             if self.crudFlag == 0 { alertView.toplabel.text = "Fetching Products. Please wait..." } else { */ alertView.toplabel.text = "Syncing records. Please wait..." //}
            
            alertView.toplabel.adjustsFontSizeToFitWidth = true
            blurEffectView.tag = 1115; alertView.tag = 1116;
            //self.win.addSubview(blurEffectView);
            //self.win.addSubview(alertView)
            
            win.addSubview(blurEffectView);
            win.addSubview(alertView)
            
            print("showSyncAlert()")
            
        }
        //)
    }
    
    func showErrorMessage()
    {
        //dispatch_async(dispatch_get_main_queue(), { () -> Void in
        DispatchQueue.main.async {
            
            let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
            
            var alertView:AlertView!;                                           var blurEffectView:UIVisualEffectView!;
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            blurEffectView = UIVisualEffectView(effect: blurEffect);
            blurEffectView.alpha = 0.3;
            blurEffectView.frame = win.bounds //self.win.bounds
            
            //if self.delegate.device == "iPhone"
            //{
            
            //alertView = AlertView(frame: CGRect(x: 5, y: self.win.frame.height / 2 - ((self.win.frame.height / 8) / 2), width: self.win.frame.width - 10, height: self.win.frame.height / 8), cas: 1)
            
            alertView = AlertView(frame: CGRect(x: 5, y: win.frame.height / 2 - ((win.frame.height / 4) / 2), width: win.frame.width - 10, height: win.frame.height / 4), cas: 2)
            /* }
             else
             {
             alertView = AlertView(frame: CGRect(x: self.win.frame.midX - (self.win.frame.width / 3) / 2, y: self.win.frame.height / 2 - ((self.win.frame.height / 8) / 2), width: self.win.frame.width / 3, height: self.win.frame.height / 8), cas: 1)
             }
             
             if self.crudFlag == 0 { alertView.toplabel.text = "Fetching Products. Please wait..." } else { */ alertView.toplabel.text = "Syncing records. Please wait..." //}
            
            alertView.toplabel.adjustsFontSizeToFitWidth = true
            
            alertView.toplabel.text = self.toplabel_message //"Error"
            
            alertView.messagelabel.text = self.errormessage //"Failed to download. Please try again."
            
            alertView.closeButton.addTarget(self, action: #selector(self.closeErrorMessage), for: UIControl.Event.touchUpInside)
            
            blurEffectView.tag = 1117; alertView.tag = 1118;
            //self.win.addSubview(blurEffectView);
            //self.win.addSubview(alertView)
            
            win.addSubview(blurEffectView);
            win.addSubview(alertView)
        }
        //)
    }
    
    @objc func closeErrorMessage()
    {
        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        
        if win.viewWithTag(1117) != nil  { if let viewWithTag = win.viewWithTag(1117)  { print("1117"); viewWithTag.removeFromSuperview(); } }
        
        if win.viewWithTag(1118) != nil  { if let viewWithTag = win.viewWithTag(1118)  { print("1118"); viewWithTag.removeFromSuperview(); } }
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: URLResponse)
    {
        //Will be called when
        NSLog("didReceiveResponse")
    }
    
    func connection(connection: NSURLConnection, didReceiveData _data: NSData)
    {
        //NSLog("didReceiveData")
        self.data.append(_data as Data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection)
    {
        NSLog("connectionDidFinishLoading")
        
        //let responseStr:NSString = NSString(data:self.data, encoding:NSUTF8StringEncoding)!
        //self.createWebViewLoadHTMLString(responseStr);
        
        parseJSON()
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError?)
    {
        //NSLog("didFailWithError ",error)
        if error != nil
        {
            download_progress = 0
            //dispatch_async(dispatch_get_main_queue(), { () -> Void in
            DispatchQueue.main.async {
                
                let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                
                if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                if win.viewWithTag(1117) != nil  { if let viewWithTag = win.viewWithTag(1117)  { print("1117"); viewWithTag.removeFromSuperview(); } }
                if win.viewWithTag(1118) != nil  { if let viewWithTag = win.viewWithTag(1118)  { print("1118"); viewWithTag.removeFromSuperview(); } }
                
                self.errormessage = "No network available. Please try again."
                
                self.showErrorMessage()
            }
            //)
            
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);                                   contactDB!.open()
            
            if contactDB!.executeStatements("DELETE FROM Search_Record WHERE Search_String = '"+urlPath+"'") { print("Record deleted from Search_Record") }
            else { print("Record deletion from Search_Record Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            print("Failed to download data")
            
            if urlPath_backup.range(of: "email") != nil
            {
                print("update_products failed calling update_products again")
                urlPath = urlPath_backup
                downloadItems()
            }
        }
    }
    
    func MD5(_ string: String) -> String?
    {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        
        if let d = string.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }
        
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
    
    @objc func fire()
    {
        fire_count = fire_count + 1
        print("FIRE!!! fire_count \(fire_count) download_progress \(download_progress)")
        
        if (download_progress == 1)
        {
            if(fire_count == 2)
            {
                DispatchQueue.main.async
                {
                    let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                    
                    if win.viewWithTag(1115) != nil
                    { if let viewWithTag = win.viewWithTag(1115)  { print("fire 1115"); viewWithTag.removeFromSuperview(); } }
                    
                    if win.viewWithTag(1116) != nil
                    { if let viewWithTag = win.viewWithTag(1116)  { print("fire 1116"); viewWithTag.removeFromSuperview(); } }
                    
                    self.errormessage = "Oops! Something went wrong. Please try again."
                    
                    self.showErrorMessage()
                }
            }
            else
            {
                downloadItems()
            }
        }
    }
    
    func downloadItems()
    {
        NSLog("connectWithUrl page \(self.page) method \(self.method)")
        fire_count = 0;     download_progress = 1
        Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        
        self.data = NSMutableData()
        
        if self.page == "addClient"
        {
            if self.page == "addClient" && method == "getToken"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getUserToken"
                jsonRequest.params = [ "curbgenie", "krbaswe@gmail.com", "testtest1" ]
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("addClient getUserToken json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/login")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
            }
            
            if self.page == "addClient" && method == "addClient"
            {
                var addClientJsonRequest = AddClientJsonRequest()
                addClientJsonRequest.jsonrpc = "2.0"
                addClientJsonRequest.method = "addClient"
                addClientJsonRequest.id = 1
                addClientJsonRequest.params.append(AddClientParams(name: First_Name, phone: Phone, email: Email, address1: "", address2: "", city: "", zip: ""))
                
                let jsonEncoder = JSONEncoder()
                jsonEncoder.outputFormatting = .sortedKeys
                let jsonData = try! jsonEncoder.encode(addClientJsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("653 addClient json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/admin/")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                request.addValue(xtoken, forHTTPHeaderField: "X-User-Token")
                request.httpBody = jsonData
            }
            
            if self.page == "addClient" && method == "changeClientPassword"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "changeClientPassword"
                jsonRequest.params = [String]()
                jsonRequest.params.append(clientId)
                jsonRequest.params.append(Password)
                jsonRequest.params.append("0")
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("addClient changeClientPassword json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/admin/")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                request.addValue(xtoken, forHTTPHeaderField: "X-User-Token")
                request.httpBody = jsonData
            }
        }
        
        if self.page == "getClientList"
        {
            if self.page == "getClientList" && method == "getToken"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getUserToken"
                jsonRequest.params = [ "curbgenie", "krbaswe@gmail.com", "testtest1" ]
                jsonRequest.id = 7
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getClientList getUserToken json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/login")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
            }
            
            if self.page == "getClientList" && method == "getClientList"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getClientList"
                jsonRequest.params = [String]()
                jsonRequest.params.append(Email)
                jsonRequest.id = 9
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getClientList json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/admin/")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                request.addValue(xtoken, forHTTPHeaderField: "X-User-Token")
                request.httpBody = jsonData
            }
            
            /* if self.page == "getClientList" && method == "changeClientPassword"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "changeClientPassword"
                jsonRequest.params = [String]()
                jsonRequest.params.append(clientId)
                jsonRequest.params.append("testtest1")
                jsonRequest.params.append("0")
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getClientList changeClientPassword json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/admin/")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                request.addValue(xtoken, forHTTPHeaderField: "X-User-Token")
                request.httpBody = jsonData
            } */
        }
        
        if self.page == "getClientBookings"
        {
            if self.page == "getClientBookings" && method == "getToken"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getToken"
                jsonRequest.params = [ "curbgenie", "a2cdc99e53328f4185978b51cb97f946d2736acedda47b18ea42f61d9816739c" ]
                jsonRequest.id = 8
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getClientBookings getToken json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/login")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
            }
            
            if self.page == "getClientBookings" && method == "getClientInfoByLoginPassword"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getClientInfoByLoginPassword"
                //jsonRequest.params = [ "krbaswe@gmail.com", "testtest1" ]
                jsonRequest.params = [String]()
                jsonRequest.params.append(Email)
                jsonRequest.params.append(Password)
                jsonRequest.id = 10
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getClientBookings getClientInfoByLoginPassword json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                request.addValue(xtoken, forHTTPHeaderField: "X-Token")
                request.httpBody = jsonData
            }
        }
        
        if self.page == "book"
        {
            if self.page == "book" && method == "getToken"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getToken"
                jsonRequest.params = [ "curbgenie", "a2cdc99e53328f4185978b51cb97f946d2736acedda47b18ea42f61d9816739c" ]
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("book getToken json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/login")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
            }
            
            if self.page == "book" && self.method == "book"
            {
                let clientData = ClientData(client_login: Email, client_password: Password)                
                var keys = [String]()
                keys.append("1d07becab841a321ccaef0cd313fef80") //=> "JFK",
                keys.append("53b9b344d47010435c4389f521aca6c9") //=> "Aegean Airlines",
                keys.append("75cb026c5cc5be16f2a6f4d830782fe9") //=> "Ace Rent A Car",
                keys.append("c427aae07222006fb929edc4f5a432ad") //=> "1"
                var values = [String]()
                values.append(airport)
                values.append(airline)
                values.append(company)
                values.append("1")
                
                //"JFK"
  
                let additional = Additional(airport: airport, airline: airline, company: company, terms: "1") //+  + airport
                
                let params = Params(eventId: "1", unitId: "1", date: bookDate, time: bookTime, clientData: clientData, additionalFields: additional)
                
                let bookJsonRequest = BookJsonRequest(jsonrpc: "2.0", method: "book", params: params, id: 1)
                
                let jsonEncoder = JSONEncoder()
                jsonEncoder.outputFormatting = .sortedKeys
                let jsonData = try! jsonEncoder.encode(bookJsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("book json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/")
                self.request = URLRequest(url:myUrl!);
                self.request.httpMethod = "POST";
                self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                self.request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                self.request.addValue(self.xtoken, forHTTPHeaderField: "X-Token")
                self.request.httpBody = jsonData
            }
        }
        
        if self.page == "editBook"
        {
            if self.page == "editBook" && method == "getUserToken"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getUserToken"
                jsonRequest.params = [ "curbgenie", "krbaswe@gmail.com", "testtest1" ]
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getToken json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/login")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
            }
            
            if self.page == "editBook" && self.method == "editBook"
            {   // "JFK"
                let additional = Additional(airport: airport, airline: airline, company: company, terms: "1") //+  + airport
                //let additional = EditAdditional(airline: airline, company: company, terms: "1") //+  + airport
                
                ///let editParams = EditParams(shedulerId: Book_Id, eventId: "1", unitId: "1", clientId: clientId, date: bookDate, time: bookTime, endDate: endDate, endTime: endTime, additionalFields: additional)
                
                let editParams = EditParams(shedulerId: Book_Id, eventId: "1", unitId: "1", clientId: clientId, date: bookDate, time: bookTime, endDate: endDate, endTime: endTime, clientTimeOffset: "-420", additionalFields: additional)
                
                let editBookJsonRequest = EditBookJsonRequest(jsonrpc: "2.0", method: "editBook", params: editParams, id: 1)
                
                let jsonEncoder = JSONEncoder()
                jsonEncoder.outputFormatting = .sortedKeys
                let jsonData = try! jsonEncoder.encode(editBookJsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("book json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/admin")
                self.request = URLRequest(url:myUrl!);
                self.request.httpMethod = "POST";
                self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                self.request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                self.request.addValue(self.xtoken, forHTTPHeaderField: "X-User-Token")
                self.request.httpBody = jsonData
            }
        }
        
        if self.page == "cancelBook"
        {
            if self.page == "cancelBook" && method == "getUserToken"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "getUserToken"
                jsonRequest.params = [ "curbgenie", "krbaswe@gmail.com", "testtest1" ]
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("getToken json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/login")
                request = URLRequest(url:myUrl!);
                request.httpMethod = "POST";
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
            }
            
            if self.page == "cancelBook" && self.method == "cancelBook"
            {
                let jsonRequest = JsonRequest()
                jsonRequest.jsonrpc = "2.0"
                jsonRequest.method = "cancelBooking"
                jsonRequest.params = [String]()
                jsonRequest.params.append(Book_Id)
                jsonRequest.id = 1
                
                let jsonEncoder = JSONEncoder()
                jsonEncoder.outputFormatting = .sortedKeys
                let jsonData = try! jsonEncoder.encode(jsonRequest)
                let json = String(data: jsonData, encoding: .utf8)!
                print("book json \(json)")
                let myUrl = URL(string: "https://user-api.simplybook.me/admin")
                self.request = URLRequest(url:myUrl!);
                self.request.httpMethod = "POST";
                self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                self.request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                self.request.addValue(self.xtoken, forHTTPHeaderField: "X-User-Token")
                self.request.httpBody = jsonData
            }
        }
        
        URLSession.shared.dataTask(with: request, completionHandler:
        {
                (data:Data?, response:URLResponse?, error:Error?) -> Void in
                if error != nil
                {
                    print("fail")
                    
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Oops! Something went wrong. Please try again."
                        
                        self.showErrorMessage()
                    }
                    
                    return
                }
                do
                {   self.download_progress = 0       //self.data as Data
                    print("parseJSON_1() data \(data!)")
                    self.dataRows = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    print("parseJSON_1() dataRows \(self.dataRows)")
                    //let req = self.dataRows["result"] as? [NSDictionary];
                    
                    var jsonElement: NSDictionary = NSDictionary(), jsonElement_1: NSDictionary = NSDictionary(), tinsertSQL = "";
                    _ = FMDatabaseQueue(path: self.databasePath as String)
                    
                    if self.page == "getClientBookings"
                    {
                        if self.page == "getClientBookings" && self.method == "getClientBookings"
                        {
                            let req = self.dataRows["result"] as? [NSDictionary];
                            self.total = String(describing: req!.count)
                            let dirPaths = self.filemgr.urls(for: .documentDirectory, in: .userDomainMask);
                            self.databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
                            let contactDB = FMDatabase(path: self.databasePath as String);
                            let queue = FMDatabaseQueue(path: self.databasePath as String)
                            contactDB!.open()
                            
                            if contactDB!.executeStatements("DELETE FROM Booking") { print("Records deleted from Booking") }
                            else { print("Record deletion from Booking Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Booking_Info") { print("Records deleted from Booking_Info") }
                            else { print("Record deletion from Booking_Info Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            queue!.inTransaction()
                                {
                                    contactDB, rollback in
                                    
                                    //for(var i = 0; i < req!.count; i++)
                                    for i in 0 ..< req!.count
                                    {
                                        jsonElement = req![i]
                                        
                                        //print("jsonElement \(jsonElement) keep_signed_flag \(keep_signed_flag)")
                                        
                                        let service_id = jsonElement["service_id"] as! String;
                                        let provider_id = jsonElement["provider_id"] as! String;
                                        let start_date = jsonElement["start_date"] as! String;
                                        let start_time = jsonElement["start_time"] as! String;
                                        let end_date = jsonElement["end_date"] as! String;
                                        let end_time = jsonElement["end_time"] as! String;
                                        let id = jsonElement["id"] as! String;
                                        let code = jsonElement["code"] as! String;
                                        let hash = jsonElement["hash"] as! String;
                                        let time_offset = jsonElement["time_offset"] as! String;
                                        let status = jsonElement["status"] as! String;
                                        let is_cancellable = "" //jsonElement["is_cancellable"] as! String;
                                        let event_duration = jsonElement["event_duration"] as! String;
                                        let event_buffertime_before = jsonElement["event_buffertime_before"] as! String;
                                        let event_buffertime_after = jsonElement["event_buffertime_after"] as! String;
                                        let additional_fields_values = jsonElement["additional_fields_values"] as! [NSDictionary]
                                        
                                        self.global_user_id = jsonElement["id"] as! String
                                        
                                        tinsertSQL = "INSERT INTO Booking (service_id, provider_id, start_date, start_time, end_date, end_time, id, code, hash, time_offset, status, is_cancellable, event_duration , event_buffertime_before, event_buffertime_after) VALUES ("
                                        
                                        tinsertSQL = tinsertSQL + "'" + service_id + "', '" + provider_id + "', '" + start_date + "', '" + start_time + "', '" + end_date + "', '" + end_time + "', '" + id + "', '" + code + "', '" + hash + "', '"+time_offset+"', '"+status+"', '"+is_cancellable+"', '"+event_duration+"', '"+event_buffertime_before+"', '"+event_buffertime_after+"')"
                                        
                                        let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                                        
                                        if !result
                                        {
                                            //rollback.initialize(true)
                                            rollback!.pointee = true
                                            print("Booking Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                                        }
                                        else
                                        {
                                            print("Record inserted in table Booking \(self.total)")
                                            //self.insertCount += 1
                                        }
                                        
                                        for j in 0 ..< additional_fields_values.count
                                        {
                                            jsonElement_1 = additional_fields_values[j]
                                            
                                            let field_value = jsonElement_1["value"] as! String;
                                            let field_name = jsonElement_1["field_name"] as! String;
                                            let field_title = jsonElement_1["field_title"] as! String;
                                            let field_position = jsonElement_1["field_position"] as! String;
                                            let field_id = jsonElement_1["field_id"] as! String;
                                            let field_pos = jsonElement_1["field_pos"] as! String;
                                            
                                            tinsertSQL = "INSERT INTO Booking_Info (booking_id, field_id, field_title, field_name, field_value, field_position, field_pos) VALUES ("
                                            
                                            tinsertSQL = tinsertSQL + "'" + id + "', '" + field_id + "', '" + field_title + "', '" + field_name + "', '" + field_value + "', '" + field_position + "', '" + field_pos + "')"
                                            
                                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                                            
                                            if !result
                                            {
                                                //rollback.initialize(true)
                                                rollback!.pointee = true
                                                print("Booking_Info Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                                            }
                                            else
                                            {
                                                print("Record inserted in table Booking_Info \(self.total)")
                                                //self.insertCount += 1
                                            } 
                                        }
                                    }
                            }
                            
                            contactDB!.close()
                            
                            if req!.count == 0
                            {
                                //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                DispatchQueue.main.async
                                    {
                                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                                        
                                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                                        
                                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                                        
                                        //self.errormessage = "No bookings found."
                                        
                                        //self.showErrorMessage()
                                }
                                //)
                            }
                            
                            print("calling notification")
                            
                            NotificationCenter.default.post(name: NSNotification.Name("getClientBookings"), object: nil)
                        }
                        
                        if self.page == "getClientBookings" && self.method == "getClientInfoByLoginPassword"
                        {
                            let response = self.dataRows["result"] as? NSDictionary;    var id = "", client_hash = ""
                            
                            let requestId = self.dataRows["id"] as? String;
                            
                            print("getClientBookings getClientInfoByLoginPassword requestId \(String(describing: requestId))")
                            
                            if(requestId == "10")
                            {
                                //if (response!["id"] != nil && (response!["id"] as! String) != nil) {
                                    id = response!["id"] as! String;
                                //}
                            
                                //if (response!["client_hash"] != nil && (response!["client_hash"] as! String) != nil) {
                                    client_hash = response!["client_hash"] as! String;
                                //}
                            
                                //let id = response!["id"] as! String;
                                //let client_hash = response!["client_hash"] as! String;
                            
                                let s = "{ \\\"upcoming_only\\\" : false, \\\"confirmed_only\\\" : true }"
                            
                                let jsonRequest = JsonRequest()
                                jsonRequest.jsonrpc = "2.0"
                                jsonRequest.method = "getClientBookings"
                            
                                jsonRequest.params = [String]()
                                jsonRequest.params.append(id)
                                //jsonRequest.params.append(self.MD5(id + client_hash + "46538c85ec849453cad9f0ebf6be3e71da5cc0c0b0b85b6ff8053d82e02556de")!)
                                jsonRequest.params.append(self.MD5(id + client_hash + "f011374de9417f58e6baa53e585d0d95a329d12246f2ab15e46c43813e6cf9b3")!)
                                jsonRequest.params.append(s)
                            
                                jsonRequest.id = 1
                            
                                let jsonEncoder = JSONEncoder()
                                let jsonData = try! jsonEncoder.encode(jsonRequest)
                                let json = String(data: jsonData, encoding: .utf8)!
                                print("getClientBookings json \(json)")
                                let myUrl = URL(string: "https://user-api.simplybook.me/")
                                self.request = URLRequest(url:myUrl!);
                                self.request.httpMethod = "POST";
                                self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                                self.request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                                self.request.addValue(self.xtoken, forHTTPHeaderField: "X-Token")
                                self.request.httpBody = jsonData
                            
                                self.method = "getClientBookings"
                                self.downloadItems()
                            }
                        }
                        
                        if self.page == "getClientBookings" && self.method == "getToken"
                        {
                            let requestId = self.dataRows["id"] as? String;
                            
                            print("getClientBookings getToken requestId \(String(describing: requestId))")
                            
                            if(requestId == "8")
                            {
                                if (self.dataRows["result"] as? String)! != nil
                                {
                                    self.xtoken = (self.dataRows["result"] as? String)!;
                                    self.method = "getClientInfoByLoginPassword"
                                    self.downloadItems()
                                }
                            }
                        }
                    }
                    else if self.page == "book"
                    {
                        /* {"result":{"require_confirm":false,"bookings":[{"id":"9","event_id":"1","unit_id":"1","client_id":"1","client_hash":"977c410c0fee6a7ee82206c48cacee64","start_date_time":"2019-01-10 10:00","end_date_time":"2019-01-10 11:00:00","time_offset":"0","is_confirmed":"0","require_payment":false,"code":"hav8jkq","hash":"b5ede410ccd16e401ea5eab7cd31d6ba"}],"invoice":null},"id":"1","jsonrpc":"2.0"}
                         */
                        
                        if self.page == "book" && self.method == "confirmBooking"
                        {
                            HomeModel.getInstance().page = "getClientBookings"
                            HomeModel.getInstance().method = "getToken"
                            HomeModel.getInstance().downloadItems()
                            
                            NotificationCenter.default.post(name: NSNotification.Name("showSummaryContrpller"), object: nil)
                        }
                        
                        if self.page == "book" && self.method == "book"
                        {
                            if self.dataRows["result"] != nil
                            {
                                let resul = self.dataRows["result"] as? NSDictionary;
                                let bookings = resul!["bookings"] as? [NSDictionary];
                                
                                for i in 0 ..< bookings!.count
                                {
                                    jsonElement = bookings![i]
                                    
                                    let id = jsonElement["id"] as! String;                      let hash  = jsonElement["hash"] as! String
                                    
                                    print("book bookings \(String(describing: bookings)) id \(String(describing: id)) hash \(String(describing: hash)) ")
                                    
                                    let jsonRequest = JsonRequest()
                                    jsonRequest.jsonrpc = "2.0"
                                    jsonRequest.method = "confirmBooking"
                                    
                                    jsonRequest.params = [String]()
                                    jsonRequest.params.append(id)
                                    //jsonRequest.params.append(self.MD5(id + hash + "46538c85ec849453cad9f0ebf6be3e71da5cc0c0b0b85b6ff8053d82e02556de")!)
                                    jsonRequest.params.append(self.MD5(id + hash + "f011374de9417f58e6baa53e585d0d95a329d12246f2ab15e46c43813e6cf9b3")!)
                                    
                                    jsonRequest.id = 1
                                    
                                    let jsonEncoder = JSONEncoder()
                                    let jsonData = try! jsonEncoder.encode(jsonRequest)
                                    let json = String(data: jsonData, encoding: .utf8)!
                                    print("book json \(json)")
                                    let myUrl = URL(string: "https://user-api.simplybook.me/")
                                    self.request = URLRequest(url:myUrl!);
                                    self.request.httpMethod = "POST";
                                    self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                                    self.request.addValue("curbgenie", forHTTPHeaderField: "X-Company-Login")
                                    self.request.addValue(self.xtoken, forHTTPHeaderField: "X-Token")
                                    self.request.httpBody = jsonData
                                    
                                    self.method = "confirmBooking"
                                    self.downloadItems()
                                }
                            }
                            else
                            {
                                DispatchQueue.main.async {
                                    let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                                    
                                    if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                                    
                                    if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                                    
                                    if self.dataRows["error"] != nil
                                    {
                                        let resul = self.dataRows["error"] as? NSDictionary;
                                        let message = resul!["message"] as? String;
                                        
                                        print("error message \(String(describing: message))")
                                        
                                        self.errormessage = "Booking failed. " + message! + " Please try again."
                                    }
                                    else
                                    {
                                        self.errormessage = "Booking failed. Reason could be selected date time not available. Please try again."
                                    }
                                    self.showErrorMessage()
                                }
                            }
                        }
                        
                        if self.page == "book" && self.method == "getToken"
                        {
                            self.xtoken = (self.dataRows["result"] as? String)!;
                            self.method = "book"
                            self.downloadItems()
                        }
                    }
                    else if self.page == "editBook"
                    {
                        if self.page == "editBook" && self.method == "editBook"
                        {
                            if self.dataRows["result"] != nil
                            {
                                let req = self.dataRows["result"] as? NSDictionary;
                                
                                let response = String(describing: req!["require_confirm"]!); //["require_confirm"]
                                print("editBook response \(response)")
                                
                                if response != ""
                                {
                                    //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "book"), object: nil)
                                    self.page = "getClientBookings"
                                    self.method = "getToken"
                                    self.urlPath = "https://gofundus.co/getClientBookings.php"
                                    self.downloadItems()
                                    
                                    NotificationCenter.default.post(name: NSNotification.Name("showSummaryContrpller"), object: nil)
                                }
                                else
                                {
                                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    DispatchQueue.main.async {
                                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                                        
                                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                                        
                                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                                        
                                        if self.dataRows["error"] != nil
                                        {
                                            let resul = self.dataRows["error"] as? NSDictionary;
                                            let message = resul!["message"] as? String;
                                            
                                            print("error message \(String(describing: message))")
                                            
                                            self.errormessage = "Edit booking failed. " + message! + " Please try again."
                                        }
                                        else
                                        {
                                            self.errormessage = "Edit booking failed. Reason could be selected date time not available. Please try again."
                                        }
                                        
                                        self.showErrorMessage()
                                    }
                                    //)
                                }
                            }
                            else
                            {
                                //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                DispatchQueue.main.async {
                                    let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                                    
                                    if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                                    
                                    if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                                    
                                    if self.dataRows["error"] != nil
                                    {
                                        let resul = self.dataRows["error"] as? NSDictionary;
                                        let message = resul!["message"] as? String;
                                        
                                        print("error message \(String(describing: message))")
                                        
                                        self.errormessage = "Edit booking failed. " + message! + " Please try again."
                                    }
                                    else
                                    {
                                        self.errormessage = "Edit booking failed. Reason could be selected date time not available. Please try again."
                                    }
                                    
                                    self.showErrorMessage()
                                }
                                //)
                            }
                        }
                        
                        if self.page == "editBook" && self.method == "getUserToken"
                        {
                            self.xtoken = (self.dataRows["result"] as? String)!;
                            self.method = "editBook"
                            self.downloadItems()
                        }
                    }
                    else if self.page == "cancelBook"
                    {
                        if self.page == "cancelBook" && self.method == "cancelBook"
                        {
                            if self.dataRows["result"] != nil
                            {
                                let response = self.dataRows["result"] as? String;
                                print("cancelBook response \(String(describing: response))")
                                
                                if response != ""
                                {
                                    self.page = "getClientBookings"
                                    self.method = "getToken"
                                    self.urlPath = "https://gofundus.co/getClientBookings.php"
                                    self.downloadItems()
                                    NotificationCenter.default.post(name: NSNotification.Name("showBookingsController"), object: nil)
                                }
                                else
                                {
                                    DispatchQueue.main.async
                                        {
                                            let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                                            
                                            if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                                            
                                            if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                                            
                                            self.errormessage = "Cancel booking failed. Please try again."
                                            
                                            self.showErrorMessage()
                                    }
                                }
                            }
                            else
                            {
                                DispatchQueue.main.async
                                    {
                                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                                        
                                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                                        
                                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                                        
                                        self.errormessage = "Cancel Booking failed. Please try again."
                                        
                                        self.showErrorMessage()
                                }
                            }
                        }
                        
                        if self.page == "cancelBook" && self.method == "getUserToken"
                        {
                            self.xtoken = (self.dataRows["result"] as? String)!;
                            self.method = "cancelBook"
                            self.downloadItems()
                        }
                    }
                    else if self.page == "getClientList"
                    {
                        /* if self.page == "getClientList" && self.method == "changeClientPassword"
                        {
                            NotificationCenter.default.post(name: NSNotification.Name("getClientList"), object: nil)
                        } */
                        if self.page == "getClientList" && self.method == "getClientList"
                        {
                            let req = self.dataRows["result"] as? [NSDictionary];
                            
                            let requestId = self.dataRows["id"] as? String;
                            
                            print("getClientList getClientList requestId \(String(describing: requestId))")
                            
                            if(requestId == "9")
                            {
                                jsonElement = req![0]
                                self.clientId = jsonElement["id"] as! String;
                                self.First_Name =  jsonElement["name"] as! String;
                                
                                //self.method = "changeClientPassword";                            self.downloadItems()
                                
                                NotificationCenter.default.post(name: NSNotification.Name("getClientList"), object: nil)
                            }
                        }
                        if self.page == "getClientList" && self.method == "getToken"
                        {
                            let requestId = self.dataRows["id"] as? String;
                            
                            print("getClientList getToken requestId \(String(describing: requestId))")
                            
                            if(requestId == "7")
                            {
                                self.xtoken = (self.dataRows["result"] as? String)!;
                                self.method = "getClientList"
                                self.downloadItems()
                            }
                        }
                    }
                    else if self.page == "addClient"
                    {
                        if self.page == "addClient" && self.method == "changeClientPassword"
                        {
                            NotificationCenter.default.post(name: NSNotification.Name("gotoBookingsController"), object: nil)
                        }
                        if self.page == "addClient" && self.method == "addClient"
                        {
                            self.clientId = (self.dataRows["result"] as? String)!;
                            self.method = "changeClientPassword"
                            self.downloadItems() 
                        }
                        if self.page == "addClient" && self.method == "getToken"
                        {
                            self.xtoken = (self.dataRows["result"] as? String)!;
                            self.method = "addClient"
                            self.downloadItems()
                        }
                    }                        
                    else
                    {
                        
                    }
                }
                catch let error as NSError
                {
                    print("error \(error)")
                    
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async
                        {
                            let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                            
                            if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                            
                            if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                            
                            self.errormessage = "Something went wrong. Please try again."
                            
                            self.showErrorMessage()
                    }
                    //)
                }
                
        }).resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data)
    {
        //dispatch_async(dispatch_get_main_queue(), { () -> Void in
        DispatchQueue.main.async {
            
            //print("downloadItems() URLSession didReceiveData page \(self.page) urlPath \(self.urlPath)")
            //self.data.appendData(data);
            
        }
        //)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
    {
        if error != nil
        {
            download_progress = 0
            //            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            DispatchQueue.main.async {
                let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                
                if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                if win.viewWithTag(1117) != nil  { if let viewWithTag = win.viewWithTag(1117)  { print("1117"); viewWithTag.removeFromSuperview(); } }
                if win.viewWithTag(1118) != nil  { if let viewWithTag = win.viewWithTag(1118)  { print("1118"); viewWithTag.removeFromSuperview(); } }
                
                self.errormessage = "No network available. Please try again."
                
                self.showErrorMessage()
            }
            //)
            
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
            databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
            let contactDB = FMDatabase(path: databasePath as String);                                   contactDB!.open()
            
            if contactDB!.executeStatements("DELETE FROM Search_Record WHERE Search_String = '"+urlPath+"'") { print("Record deleted from Search_Record") }
            else { print("Record deletion from Search_Record Error: \(String(describing: contactDB!.lastErrorMessage()))") }
            
            contactDB!.close()
            
            print("Failed to download data")
            
            if urlPath_backup.range(of: "email") != nil
            {
                print("update_products failed calling update_products again")
                urlPath = urlPath_backup
                downloadItems()
            }
        }
        else
        {
            print("Data downloaded");
            
            //dispatch_async(dispatch_get_main_queue(), { () -> Void in
            DispatchQueue.main.async
                {
                    //self.parseJSON()
                    //self.parseJSON_1()
            }
            //)
        }
    }
    
    func parseJSON()
    {
        //var jsonResult: NSMutableArray = NSMutableArray()
        do
        {
            dataRows = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            
            //print("parseJSON() dataRows \(dataRows)")
            
            let req = dataRows["products"] as? [NSDictionary];
            
            if page == "search" || page == "advanced" || page == "category" || page == "types" || page == "offers" || page == "all"
            { self.main_total = String(describing: dataRows["main_total"]!); };
            
            if page != "signup" && page != "register" && page != "login" && page != "confirm" && page != "add_to_cart" && page != "remove_from_cart" && page != "add_to_wishlist" && page != "remove_from_wishlist" && page != "remove_from_cart_wishlist" && page != "update_cart_minus" && page != "update_cart_plus" && page != "contactus" && page != "forgot" && page != "new_password" && page != "orders" && page != "confirm_guest"
            { self.total = String(describing: dataRows["total"]!) }
            
            //print("dataRows \(dataRows) dataRows.count \(dataRows.count) \(dataRows["products"]) req.count \(req!.count)")
            //print("req.count \(req!.count) main_total \(self.main_total) total \(self.total)")
            
            var jsonElement: NSDictionary = NSDictionary(), tinsertSQL = ""; let queue = FMDatabaseQueue(path: self.databasePath as String)
            
            if page == "login"
            {
                let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
                databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
                let contactDB = FMDatabase(path: databasePath as String);                           let queue = FMDatabaseQueue(path: self.databasePath as String)
                contactDB!.open()
                
                queue!.inTransaction()
                    {
                        contactDB, rollback in
                        
                        //for(var i = 0; i < req!.count; i++)
                        for i in 0 ..< req!.count
                        {
                            jsonElement = req![i]
                            
                            //print("jsonElement \(jsonElement) keep_signed_flag \(keep_signed_flag)")
                            var Id = jsonElement["id"] as! String;                      self.global_user_id = jsonElement["id"] as! String
                            var first_name = jsonElement["first_name"] as! String
                            var last_name = jsonElement["last_name"] as! String
                            var email = jsonElement["email"] as! String
                            var password = jsonElement["password"] as! String
                            var mobile = jsonElement["mobile"] as! String
                            var street = jsonElement["street"] as! String
                            var city = jsonElement["city"] as! String
                            var state = jsonElement["state"] as! String
                            var zip_code = jsonElement["zip_code"] as! String
                            
                            tinsertSQL = "INSERT INTO User (Id, First_Name, Last_Name, Email, Password, Phone, State, City, Street, Zip, KeepSigned) VALUES ("
                            
                            first_name = first_name.replacingOccurrences(of: "***", with: " ")
                            last_name = last_name.replacingOccurrences(of: "***", with: " ")
                            email = email.replacingOccurrences(of: "***", with: " ")
                            password =  password.replacingOccurrences(of: "***", with: " ")
                            mobile = mobile.replacingOccurrences(of: "***", with: " ")
                            street =  street.replacingOccurrences(of: "***", with: " ")
                            city = city.replacingOccurrences(of: "***", with: " ")
                            state = state.replacingOccurrences(of: "***", with: " ")
                            zip_code = zip_code.replacingOccurrences(of: "***", with: " ")
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '" + first_name + "', '" + last_name + "', '" + email + "', '" + password + "', '" + mobile + "', '" + state + "', '" + city + "', '" + street + "', '"+zip_code+"' , '"+String(self.keep_signed_flag)+"')"
                            
                            if contactDB!.executeStatements("DELETE FROM User") { print("All Records deleted from User") }
                            else { print("Record deletion from User Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Orders") { print("All Records deleted from Orders") }
                            else { print("Record deletion from Orders Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Cart") { print("All Records deleted from Cart") }
                            else { print("Record deletion from Cart Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Wishlist") { print("All Records deleted from Wishlist") }
                            else { print("Record deletion from Wishlist Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Cart_Products") { print("All Records deleted from Cart_Products") }  else { print("Record deletion from Cart_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Wishlist_Products") { print(" All Records deleted from Wishlist_Products") }  else { print("Record deletion from Wishlist_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("DELETE FROM Order_Products") { print(" All Records deleted from Order_Products") }  else { print("Record deletion from Order_Products Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                print("Record inserted in table User")
                                
                                //self.insertCount += 1
                            }
                        }
                        
                        /* let orders = self.dataRows["orders"] as? [NSDictionary];
                         
                         for(var i = 0; i < orders!.count; i++)
                         {
                         jsonElement = orders![i] as! NSDictionary
                         
                         let id = jsonElement["id"] as! String;                                     //let shipping_id = jsonElement["shipping_id"] as! String;
                         let user_id = jsonElement["user_id"] as! String;                           let paypal_id = jsonElement["paypal_id"] as! String;
                         let product_id = jsonElement["product_id"] as! String;                      let quantity = jsonElement["quantity"] as! String;
                         let return_status = jsonElement["return_status"] as! String;                let shipping_charges = jsonElement["shipping_charges"] as! String;
                         let warranty_charges = jsonElement["warranty_charges"] as! String;           let shipping_status = jsonElement["shipping_status"] as! String;
                         let delivered_status = jsonElement["delivered_status"] as! String;           let Img_Path = jsonElement["Img_Path"] as! String;
                         let Headding = jsonElement["Headding"] as! String;                          let price = jsonElement["price"] as! String;
                         let SKU = jsonElement["SKU"] as! String;                                    let Model = jsonElement["Model"] as! String;
                         
                         let date = NSDate();                                                                         let ndateFormatter = NSDateFormatter()
                         ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm";                                               let Created_On = ndateFormatter.stringFromDate(date);
                         
                         var tinsertSQL = "INSERT INTO Orders (Id, User_Id, Product_Id, Img_Path, Headding, USD, SKU, Model, Quantity, Warranty, Warranty_Cost, Status, return_status, shipping_status, delivered_status, Created_On) VALUES ("
                         
                         tinsertSQL = tinsertSQL + "'" + id + "', '" + user_id + "', '" + product_id + "', '" + Img_Path + "', '" + Headding  + "', '" + price + "', "
                         tinsertSQL = tinsertSQL + "'" + SKU + "', '" + Model + "', '" + quantity + "', '', '" + warranty_charges  + "', '', "
                         tinsertSQL = tinsertSQL + "'" + return_status + "', '" + shipping_status + "', '" + delivered_status + "', '" + Created_On  + "')"
                         
                         print("login Orders tinsertSQL \(tinsertSQL)")
                         
                         let result = contactDB.executeUpdate(tinsertSQL, withArgumentsInArray: nil)
                         
                         if !result { print("login Orders Insert Error: \(contactDB.lastErrorMessage())") }
                         else { print("login Record inserted in table Orders") }
                         } */
                        
                        let orders = self.dataRows["orders"] as? [NSDictionary];
                        
                        //for(var i = 0; i < orders!.count; i++)
                        for i in 0 ..< orders!.count
                        {
                            jsonElement = orders![i]
                            
                            let Id = jsonElement["Id"] as! String
                            
                            var User_ID = ""
                            if String(describing: jsonElement["User_ID"]) != "Optional(<null>)"
                            {
                                User_ID = jsonElement["User_ID"] as! String
                            }
                            
                            var productname = ""
                            if  String(describing: jsonElement["productname"]) != "Optional(<null>)"
                            {
                                productname = jsonElement["productname"] as! String
                            }
                            
                            var productcode = ""
                            if  String(describing: jsonElement["productcode"]) != "Optional(<null>)"
                            {
                                productcode = jsonElement["productcode"] as! String
                            }
                            
                            var Model = ""
                            if  String(describing: jsonElement["Model"]) != "Optional(<null>)"
                            {
                                Model = jsonElement["Model"] as! String
                            }
                            
                            var SKU = ""
                            if  String(describing: jsonElement["SKU"]) != "Optional(<null>)"
                            {
                                SKU = jsonElement["SKU"] as! String
                            }
                            
                            var vendor_partno = ""
                            if  String(describing: jsonElement["vendor_partno"]) != "Optional(<null>)"
                            {
                                vendor_partno = jsonElement["vendor_partno"] as! String
                            }
                            
                            var Weight = ""
                            if  String(describing: jsonElement["Weight"]) != "Optional(<null>)"
                            {
                                Weight = jsonElement["Weight"] as! String
                            }
                            
                            var Old_USD = ""
                            if  String(describing: jsonElement["Old_USD"]) != "Optional(<null>)"
                            {
                                Old_USD = jsonElement["Old_USD"] as! String
                            }
                            
                            var USD = ""
                            if  String(describing: jsonElement["USD"]) != "Optional(<null>)"
                            {
                                USD = jsonElement["USD"] as! String
                            }
                            
                            var offer_percentage = ""
                            if  String(describing: jsonElement["offer_percentage"]) != "Optional(<null>)"
                            {
                                offer_percentage = jsonElement["offer_percentage"] as! String
                            }
                            
                            var productcondition = ""
                            if  String(describing: jsonElement["productcondition"]) != "Optional(<null>)"
                            {
                                productcondition = jsonElement["productcondition"] as! String
                            }
                            
                            var productmanufacturer = ""
                            if  String(describing: jsonElement["productmanufacturer"]) != "Optional(<null>)"
                            {
                                productmanufacturer = jsonElement["productmanufacturer"] as! String
                            }
                            
                            var Description  = ""
                            if  String(describing: jsonElement["Description"]) != "Optional(<null>)"
                            {
                                Description = jsonElement["Description"] as! String
                            }
                            
                            var photourl_large = ""
                            if  String(describing: jsonElement["photourl_large"]) != "Optional(<null>)"
                            {
                                photourl_large = jsonElement["photourl_large"] as! String
                            }
                            
                            var categoryids = ""
                            if  String(describing: jsonElement["categoryids"]) != "Optional(<null>)"
                            {
                                categoryids = jsonElement["categoryids"] as! String
                            }
                            
                            var categorytree  = ""
                            if  String(describing: jsonElement["categorytree"]) != "Optional(<null>)"
                            {
                                categorytree = jsonElement["categorytree"] as! String
                            }
                            
                            var google_product_category = ""
                            if  String(describing: jsonElement["google_product_category"]) != "Optional(<null>)"
                            {
                                google_product_category = jsonElement["google_product_category"] as! String
                            }
                            
                            var google_product_type = ""
                            if  String(describing: jsonElement["google_product_type"]) != "Optional(<null>)"
                            {
                                google_product_type = jsonElement["google_product_type"] as! String
                            }
                            
                            var Sold_Out = ""
                            if  String(describing: jsonElement["Sold_Out"]) != "Optional(<null>)"
                            {
                                Sold_Out = jsonElement["Sold_Out"] as! String
                            }
                            
                            var technical_Specs = ""
                            
                            //if Id == "1" || Id == "10" { print("technical_Specs \(jsonElement["technical_Specs"])") }
                            
                            if  String(describing: jsonElement["technical_Specs"]) != "Optional(<null>)"
                            {
                                technical_Specs = jsonElement["technical_Specs"] as! String
                            }
                            
                            var buyCount = ""
                            if  String(describing: jsonElement["buyCount"]) != "Optional(<null>)"
                            {
                                buyCount = jsonElement["buyCount"] as! String
                            }
                            
                            var viewCount = ""
                            if  String(describing: jsonElement["viewCount"]) != "Optional(<null>)"
                            {
                                viewCount = jsonElement["viewCount"] as! String
                            }
                            
                            var Quantity = ""
                            if  String(describing: jsonElement["Quantity"]) != "Optional(<null>)"
                            {
                                Quantity = jsonElement["Quantity"] as! String
                            }
                            
                            var Created_Date = ""
                            if  String(describing: jsonElement["Created_Date"]) != "Optional(<null>)"
                            {
                                Created_Date = jsonElement["Created_Date"] as! String
                            }
                            
                            var Modified_Date = ""
                            if  String(describing: jsonElement["Modified_Date"]) != "Optional(<null>)"
                            {
                                Modified_Date = jsonElement["Modified_Date"] as! String
                            }
                            
                            var brandname = ""
                            if  String(describing: jsonElement["brandname"]) != "Optional(<null>)"
                            {
                                brandname = jsonElement["brandname"] as! String
                            }
                            
                            var categoryname = ""
                            if  String(describing: jsonElement["categoryname"]) != "Optional(<null>)"
                            {
                                categoryname = jsonElement["categoryname"] as! String
                            }
                            
                            //'"+Description.stringByReplacingOccurrencesOfString("'", withString: "")+"',
                            
                            tinsertSQL = "INSERT INTO Order_Products (Id, User_ID, productname, productcode, Model, SKU, vendor_partno, Weight, Old_USD, USD, offer_percentage, productcondition, productmanufacturer, Description, photourl_large, categoryids, categorytree, google_product_category, google_product_type, Sold_Out, technical_Specs, buyCount, viewCount, Quantity, Created_Date, Modified_Date, brandname, categoryname) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+User_ID+"', '"+productname+"', '"+productcode+"', "
                            tinsertSQL = tinsertSQL + "'" + Model+"', '"+SKU+"', '"+vendor_partno+"', '"+Weight+"', "
                            tinsertSQL = tinsertSQL + "'" + Old_USD + "', '"+USD+"', '"+offer_percentage+"', '"+productcondition+"', "
                            tinsertSQL = tinsertSQL + "'" + productmanufacturer+"',                        '"+Description.replacingOccurrences(of: "'", with: "")+"', '"+photourl_large+"', "
                            tinsertSQL = tinsertSQL + "'" + categoryids + "', '"+categorytree+"', "
                            tinsertSQL = tinsertSQL + "'" + google_product_category + "', '"+google_product_type+"', '"+Sold_Out+"', "
                            tinsertSQL = tinsertSQL + "'" + technical_Specs.replacingOccurrences(of: "'", with: "")+"', '"+buyCount+"', '"+viewCount+"', "
                            tinsertSQL = tinsertSQL + "'" + Quantity + "', '"+Created_Date+"', '"+Modified_Date+"', '"+brandname+"', '"+categoryname+"')"
                            
                            var result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true);
                                rollback!.pointee = true;
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("Record \(i) inserted in table Order_Products") }
                            
                            let id = jsonElement["id"] as! String;                                     //let shipping_id = jsonElement["shipping_id"] as! String;
                            let user_id = jsonElement["user_id"] as! String;                           let paypal_id = jsonElement["paypal_id"] as! String;
                            let product_id = jsonElement["product_id"] as! String;                      let quantity = jsonElement["quantity"] as! String;
                            let return_status = jsonElement["return_status"] as! String;                let shipping_charges = jsonElement["shipping_charges"] as! String;
                            let warranty_charges = jsonElement["warranty_charges"] as! String;          let shipping_status = jsonElement["shipping_status"] as! String;
                            let delivered_status = jsonElement["delivered_status"] as! String;          let price = jsonElement["price"] as! String;
                            
                            //let Img_Path = jsonElement["Img_Path"] as! String;                            let Headding = jsonElement["Headding"] as! String;
                            //let SKU = jsonElement["SKU"] as! String;                                      let Model = jsonElement["Model"] as! String;
                            
                            let date = NSDate();                                                                         let ndateFormatter = DateFormatter()
                            ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm";                                               let Order_Created_On = ndateFormatter.string(from: date as Date);
                            
                            var tinsertSQL = "INSERT INTO Orders (Id, User_Id, Product_Id, Img_Path, Headding, USD, SKU, Model, Quantity, Warranty, Warranty_Cost, Status, return_status, shipping_status, delivered_status, Created_On) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + id + "', '" + user_id + "', '" + product_id + "', '" + photourl_large + "', '" + productname  + "', '" + price + "', "
                            tinsertSQL = tinsertSQL + "'" + SKU + "', '" + Model + "', '" + quantity + "', '', '" + warranty_charges  + "', '', "
                            tinsertSQL = tinsertSQL + "'" + return_status + "', '" + shipping_status + "', '" + delivered_status + "', '" + Order_Created_On  + "')"
                            
                            print("login Orders tinsertSQL \(tinsertSQL)")
                            
                            result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { print("login Orders Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("login Record inserted in table Orders") }
                        }
                        
                        let cartlist = self.dataRows["cartlist"] as? [NSDictionary];
                        
                        //for(var i = 0; i < cartlist!.count; i++)
                        for i in 0 ..< cartlist!.count
                        {
                            jsonElement = cartlist![i]
                            
                            let Id = jsonElement["Id"] as! String
                            
                            var User_ID = ""
                            if  String(describing: jsonElement["User_ID"]) != "Optional(<null>)"
                            {
                                User_ID = jsonElement["User_ID"] as! String
                            }
                            
                            var productname = ""
                            if  String(describing: jsonElement["productname"]) != "Optional(<null>)"
                            {
                                productname = jsonElement["productname"] as! String
                            }
                            
                            var productcode = ""
                            if  String(describing: jsonElement["productcode"]) != "Optional(<null>)"
                            {
                                productcode = jsonElement["productcode"] as! String
                            }
                            
                            var Model = ""
                            if  String(describing: jsonElement["Model"]) != "Optional(<null>)"
                            {
                                Model = jsonElement["Model"] as! String
                            }
                            
                            var SKU = ""
                            if  String(describing: jsonElement["SKU"]) != "Optional(<null>)"
                            {
                                SKU = jsonElement["SKU"] as! String
                            }
                            
                            var vendor_partno = ""
                            if  String(describing: jsonElement["vendor_partno"]) != "Optional(<null>)"
                            {
                                vendor_partno = jsonElement["vendor_partno"] as! String
                            }
                            
                            var Weight = ""
                            if  String(describing: jsonElement["Weight"]) != "Optional(<null>)"
                            {
                                Weight = jsonElement["Weight"] as! String
                            }
                            
                            var Old_USD = ""
                            if  String(describing: jsonElement["Old_USD"]) != "Optional(<null>)"
                            {
                                Old_USD = jsonElement["Old_USD"] as! String
                            }
                            
                            var USD = ""
                            if  String(describing: jsonElement["USD"]) != "Optional(<null>)"
                            {
                                USD = jsonElement["USD"] as! String
                            }
                            
                            var offer_percentage = ""
                            if  String(describing: jsonElement["offer_percentage"]) != "Optional(<null>)"
                            {
                                offer_percentage = jsonElement["offer_percentage"] as! String
                            }
                            
                            var productcondition = ""
                            if  String(describing: jsonElement["productcondition"]) != "Optional(<null>)"
                            {
                                productcondition = jsonElement["productcondition"] as! String
                            }
                            
                            var productmanufacturer = ""
                            if  String(describing: jsonElement["productmanufacturer"]) != "Optional(<null>)"
                            {
                                productmanufacturer = jsonElement["productmanufacturer"] as! String
                            }
                            
                            var Description  = ""
                            if  String(describing: jsonElement["Description"]) != "Optional(<null>)"
                            {
                                Description = jsonElement["Description"] as! String
                            }
                            
                            var photourl_large = ""
                            if  String(describing: jsonElement["photourl_large"]) != "Optional(<null>)"
                            {
                                photourl_large = jsonElement["photourl_large"] as! String
                            }
                            
                            var categoryids = ""
                            if  String(describing: jsonElement["categoryids"]) != "Optional(<null>)"
                            {
                                categoryids = jsonElement["categoryids"] as! String
                            }
                            
                            var categorytree  = ""
                            if  String(describing: jsonElement["categorytree"]) != "Optional(<null>)"
                            {
                                categorytree = jsonElement["categorytree"] as! String
                            }
                            
                            var google_product_category = ""
                            if  String(describing: jsonElement["google_product_category"]) != "Optional(<null>)"
                            {
                                google_product_category = jsonElement["google_product_category"] as! String
                            }
                            
                            var google_product_type = ""
                            if  String(describing: jsonElement["google_product_type"]) != "Optional(<null>)"
                            {
                                google_product_type = jsonElement["google_product_type"] as! String
                            }
                            
                            var Sold_Out = ""
                            if  String(describing: jsonElement["Sold_Out"]) != "Optional(<null>)"
                            {
                                Sold_Out = jsonElement["Sold_Out"] as! String
                            }
                            
                            var technical_Specs = ""
                            
                            //if Id == "1" || Id == "10" { print("technical_Specs \(jsonElement["technical_Specs"])") }
                            
                            if  String(describing: jsonElement["technical_Specs"]) != "Optional(<null>)"
                            {
                                technical_Specs = jsonElement["technical_Specs"] as! String
                            }
                            
                            var buyCount = ""
                            if  String(describing: jsonElement["buyCount"]) != "Optional(<null>)"
                            {
                                buyCount = jsonElement["buyCount"] as! String
                            }
                            
                            var viewCount = ""
                            if  String(describing: jsonElement["viewCount"]) != "Optional(<null>)"
                            {
                                viewCount = jsonElement["viewCount"] as! String
                            }
                            
                            var Quantity = ""
                            if  String(describing: jsonElement["Quantity"]) != "Optional(<null>)"
                            {
                                Quantity = jsonElement["Quantity"] as! String
                            }
                            
                            var Created_Date = ""
                            if  String(describing: jsonElement["Created_Date"]) != "Optional(<null>)"
                            {
                                Created_Date = jsonElement["Created_Date"] as! String
                            }
                            
                            var Modified_Date = ""
                            if  String(describing: jsonElement["Modified_Date"]) != "Optional(<null>)"
                            {
                                Modified_Date = jsonElement["Modified_Date"] as! String
                            }
                            
                            var brandname = ""
                            if  String(describing: jsonElement["brandname"]) != "Optional(<null>)"
                            {
                                brandname = jsonElement["brandname"] as! String
                            }
                            
                            var categoryname = ""
                            if  String(describing: jsonElement["categoryname"]) != "Optional(<null>)"
                            {
                                categoryname = jsonElement["categoryname"] as! String
                            }
                            
                            tinsertSQL = "INSERT INTO Cart_Products (Id, User_ID, productname, productcode, Model, SKU, vendor_partno, Weight, Old_USD, USD, offer_percentage, productcondition, productmanufacturer, Description, photourl_large, categoryids, categorytree, google_product_category, google_product_type, Sold_Out, technical_Specs, buyCount, viewCount, Quantity, Created_Date, Modified_Date, brandname, categoryname) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+User_ID+"', '"+productname+"', '"+productcode+"', "
                            tinsertSQL = tinsertSQL + "'" + Model+"', '"+SKU+"', '"+vendor_partno+"', '"+Weight+"', "
                            tinsertSQL = tinsertSQL + "'" + Old_USD + "', '"+USD+"', '"+offer_percentage+"', '"+productcondition+"', "
                            tinsertSQL = tinsertSQL + "'" + productmanufacturer+"', '"+Description.replacingOccurrences(of: "'", with: "")+"', '"+photourl_large+"', "
                            tinsertSQL = tinsertSQL + "'" + categoryids + "', '"+categorytree+"', "
                            tinsertSQL = tinsertSQL + "'" + google_product_category + "', '"+google_product_type+"', '"+Sold_Out+"', "
                            tinsertSQL = tinsertSQL + "'" + technical_Specs.replacingOccurrences(of: "'", with: "")+"', '"+buyCount+"', '"+viewCount+"', "
                            tinsertSQL = tinsertSQL + "'" + Quantity + "', '"+Created_Date+"', '"+Modified_Date+"', '"+brandname+"', '"+categoryname+"')"
                            
                            var result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { //rollback.initialize(true);
                                rollback!.pointee = true
                                print("Insert Error: \(contactDB!.lastErrorMessage())") }
                            else { print("Record \(i) inserted in table Cart_Products") }
                            
                            //
                            var waranty_field = ""; if  String(describing: jsonElement["waranty_field"]) != "Optional(<null>)" { waranty_field = jsonElement["waranty_field"] as! String }
                            var quantity = ""; if  String(describing: jsonElement["quantity"]) != "Optional(<null>)" { quantity = jsonElement["quantity"] as! String }
                            var created_date = ""; if  String(describing: jsonElement["created_date"]) != "Optional(<null>)" { created_date = jsonElement["created_date"] as! String }
                            var cart_id = ""; if  String(describing: jsonElement["cart_id"]) != "Optional(<null>)" { cart_id = jsonElement["cart_id"] as! String }
                            
                            var tinsertSQL = "INSERT INTO Cart (Id, User_Id, Product_Id, Warranty, Quantity, Price, Max_Quantity, Offer_Percentage, Created_On) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + cart_id + "', '" + self.global_user_id + "', '" + Id + "', '" + waranty_field + "', '" + quantity  + "' , '" + USD  + "', '" + Quantity + "', '"+offer_percentage+"', " // offer_approved
                            tinsertSQL = tinsertSQL + "'" + created_date  + "')"
                            
                            print("login Cart tinsertSQL \(tinsertSQL)")
                            
                            result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { print("login Cart Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("login Record inserted in table Cart") }
                        }
                        
                        let wishlist = self.dataRows["wishlist"] as? [NSDictionary];
                        
                        //for(var i = 0; i < wishlist!.count; i++)
                        for i in 0 ..< wishlist!.count
                        {
                            jsonElement = wishlist![i]
                            
                            let Id = jsonElement["Id"] as! String
                            
                            var User_ID = ""
                            if  String(describing: jsonElement["User_ID"]) != "Optional(<null>)"
                            {
                                User_ID = jsonElement["User_ID"] as! String
                            }
                            
                            var productname = ""
                            if  String(describing: jsonElement["productname"]) != "Optional(<null>)"
                            {
                                productname = jsonElement["productname"] as! String
                            }
                            
                            var productcode = ""
                            if  String(describing: jsonElement["productcode"]) != "Optional(<null>)"
                            {
                                productcode = jsonElement["productcode"] as! String
                            }
                            
                            var Model = ""
                            if  String(describing: jsonElement["Model"]) != "Optional(<null>)"
                            {
                                Model = jsonElement["Model"] as! String
                            }
                            
                            var SKU = ""
                            if  String(describing: jsonElement["SKU"]) != "Optional(<null>)"
                            {
                                SKU = jsonElement["SKU"] as! String
                            }
                            
                            var vendor_partno = ""
                            if  String(describing: jsonElement["vendor_partno"]) != "Optional(<null>)"
                            {
                                vendor_partno = jsonElement["vendor_partno"] as! String
                            }
                            
                            var Weight = ""
                            if  String(describing: jsonElement["Weight"]) != "Optional(<null>)"
                            {
                                Weight = jsonElement["Weight"] as! String
                            }
                            
                            var Old_USD = ""
                            if  String(describing: jsonElement["Old_USD"]) != "Optional(<null>)"
                            {
                                Old_USD = jsonElement["Old_USD"] as! String
                            }
                            
                            var USD = ""
                            if  String(describing: jsonElement["USD"]) != "Optional(<null>)"
                            {
                                USD = jsonElement["USD"] as! String
                            }
                            
                            var offer_percentage = ""
                            if  String(describing: jsonElement["offer_percentage"]) != "Optional(<null>)"
                            {
                                offer_percentage = jsonElement["offer_percentage"] as! String
                            }
                            
                            var productcondition = ""
                            if  String(describing: jsonElement["productcondition"]) != "Optional(<null>)"
                            {
                                productcondition = jsonElement["productcondition"] as! String
                            }
                            
                            var productmanufacturer = ""
                            if  String(describing: jsonElement["productmanufacturer"]) != "Optional(<null>)"
                            {
                                productmanufacturer = jsonElement["productmanufacturer"] as! String
                            }
                            
                            var Description  = ""
                            if  String(describing: jsonElement["Description"]) != "Optional(<null>)"
                            {
                                Description = jsonElement["Description"] as! String
                            }
                            
                            var photourl_large = ""
                            if  String(describing: jsonElement["photourl_large"]) != "Optional(<null>)"
                            {
                                photourl_large = jsonElement["photourl_large"] as! String
                            }
                            
                            var categoryids = ""
                            if  String(describing: jsonElement["categoryids"]) != "Optional(<null>)"
                            {
                                categoryids = jsonElement["categoryids"] as! String
                            }
                            
                            var categorytree  = ""
                            if  String(describing: jsonElement["categorytree"]) != "Optional(<null>)"
                            {
                                categorytree = jsonElement["categorytree"] as! String
                            }
                            
                            var google_product_category = ""
                            if  String(describing: jsonElement["google_product_category"]) != "Optional(<null>)"
                            {
                                google_product_category = jsonElement["google_product_category"] as! String
                            }
                            
                            var google_product_type = ""
                            if  String(describing: jsonElement["google_product_type"]) != "Optional(<null>)"
                            {
                                google_product_type = jsonElement["google_product_type"] as! String
                            }
                            
                            var Sold_Out = ""
                            if  String(describing: jsonElement["Sold_Out"]) != "Optional(<null>)"
                            {
                                Sold_Out = jsonElement["Sold_Out"] as! String
                            }
                            
                            var technical_Specs = ""
                            
                            //if Id == "1" || Id == "10" { print("technical_Specs \(jsonElement["technical_Specs"])") }
                            
                            if  String(describing: jsonElement["technical_Specs"]) != "Optional(<null>)"
                            {
                                technical_Specs = jsonElement["technical_Specs"] as! String
                            }
                            
                            var buyCount = ""
                            if  String(describing: jsonElement["buyCount"]) != "Optional(<null>)"
                            {
                                buyCount = jsonElement["buyCount"] as! String
                            }
                            
                            var viewCount = ""
                            if  String(describing: jsonElement["viewCount"]) != "Optional(<null>)"
                            {
                                viewCount = jsonElement["viewCount"] as! String
                            }
                            
                            var Quantity = ""
                            if  String(describing: jsonElement["Quantity"]) != "Optional(<null>)"
                            {
                                Quantity = jsonElement["Quantity"] as! String
                            }
                            
                            var Created_Date = ""
                            if  String(describing: jsonElement["Created_Date"]) != "Optional(<null>)"
                            {
                                Created_Date = jsonElement["Created_Date"] as! String
                            }
                            
                            var Modified_Date = ""
                            if  String(describing: jsonElement["Modified_Date"]) != "Optional(<null>)"
                            {
                                Modified_Date = jsonElement["Modified_Date"] as! String
                            }
                            
                            var brandname = ""
                            if  String(describing: jsonElement["brandname"]) != "Optional(<null>)"
                            {
                                brandname = jsonElement["brandname"] as! String
                            }
                            
                            var categoryname = ""
                            if  String(describing: jsonElement["categoryname"]) != "Optional(<null>)"
                            {
                                categoryname = jsonElement["categoryname"] as! String
                            }
                            
                            tinsertSQL = "INSERT INTO Wishlist_Products (Id, User_ID, productname, productcode, Model, SKU, vendor_partno, Weight, Old_USD, USD, offer_percentage, productcondition, productmanufacturer, Description, photourl_large, categoryids, categorytree, google_product_category, google_product_type, Sold_Out, technical_Specs, buyCount, viewCount, Quantity, Created_Date, Modified_Date, brandname, categoryname) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+User_ID+"', '"+productname+"', '"+productcode+"', "
                            tinsertSQL = tinsertSQL + "'" + Model+"', '"+SKU+"', '"+vendor_partno+"', '"+Weight+"', "
                            tinsertSQL = tinsertSQL + "'" + Old_USD + "', '"+USD+"', '"+offer_percentage+"', '"+productcondition+"', "
                            tinsertSQL = tinsertSQL + "'" + productmanufacturer+"', '"+Description.replacingOccurrences(of: "'", with: "")+"', '"+photourl_large+"', "
                            tinsertSQL = tinsertSQL + "'" + categoryids + "', '"+categorytree+"', "
                            tinsertSQL = tinsertSQL + "'" + google_product_category + "', '"+google_product_type+"', '"+Sold_Out+"', "
                            tinsertSQL = tinsertSQL + "'" + technical_Specs.replacingOccurrences(of: "'", with: "")+"', '"+buyCount+"', '"+viewCount+"', "
                            tinsertSQL = tinsertSQL + "'" + Quantity + "', '"+Created_Date+"', '"+Modified_Date+"', '"+brandname+"', '"+categoryname+"')"
                            
                            var result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result {
                                //rollback.initialize(true);
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("Wishlist Record \(i) inserted in table Wishlist_Products") }
                            
                            //
                            var wish_id = ""; if  String(describing: jsonElement["wish_id"]) != "Optional(<null>)" { wish_id = jsonElement["wish_id"] as! String }
                            
                            var tinsertSQL = "INSERT INTO Wishlist (Id, User_Id, Product_Id) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + wish_id + "', '" + self.global_user_id + "', '" + Id + "')"
                            
                            print("login Wishlist tinsertSQL \(tinsertSQL)")
                            
                            result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { print("login Wishlist Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") } else { print("login Record inserted in table Wishlist") }
                        }
                }
                
                contactDB!.close()
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checklogin"), object: nil)
                
                if req!.count == 0
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Login failed."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "orders"
            {
                let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
                databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
                let contactDB = FMDatabase(path: databasePath as String);                           let queue = FMDatabaseQueue(path: self.databasePath as String)
                contactDB!.open()
                
                if contactDB!.executeStatements("DELETE FROM Orders") { print("All Records deleted from Orders") }
                else { print("Record deletion from Orders Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                
                queue!.inTransaction()
                    {
                        contactDB, rollback in
                        
                        //for(var i = 0; i < req!.count; i++)
                        for i in 0 ..< req!.count
                        {
                            jsonElement = req![i]
                            
                            let id = jsonElement["id"] as! String;                                     //let shipping_id = jsonElement["shipping_id"] as! String;
                            let user_id = jsonElement["user_id"] as! String;                           let paypal_id = jsonElement["paypal_id"] as! String;
                            let product_id = jsonElement["product_id"] as! String;                      let quantity = jsonElement["quantity"] as! String;
                            let return_status = jsonElement["return_status"] as! String;                let shipping_charges = jsonElement["shipping_charges"] as! String;
                            let warranty_charges = jsonElement["warranty_charges"] as! String;           let shipping_status = jsonElement["shipping_status"] as! String;
                            let delivered_status = jsonElement["delivered_status"] as! String;           let Img_Path = jsonElement["Img_Path"] as! String;
                            let Headding = jsonElement["Headding"] as! String;                          let price = jsonElement["price"] as! String;
                            let SKU = jsonElement["SKU"] as! String;                                    let Model = jsonElement["Model"] as! String;
                            
                            let date = NSDate();                                                                         let ndateFormatter = DateFormatter()
                            ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm";                                               let Created_On = ndateFormatter.string(from: date as Date);
                            
                            var tinsertSQL = "INSERT INTO Orders (Id, User_Id, Product_Id, Img_Path, Headding, USD, SKU, Model, Quantity, Warranty, Warranty_Cost, Status, return_status, shipping_status, delivered_status, Created_On) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + id + "', '" + user_id + "', '" + product_id + "', '" + Img_Path + "', '" + Headding  + "', '" + price + "', "
                            tinsertSQL = tinsertSQL + "'" + SKU + "', '" + Model + "', '" + quantity + "', '', '" + warranty_charges  + "', '', "
                            tinsertSQL = tinsertSQL + "'" + return_status + "', '" + shipping_status + "', '" + delivered_status + "', '" + Created_On  + "')"
                            
                            print(" Orders tinsertSQL \(tinsertSQL)")
                            
                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { print("Orders Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("orders Record inserted in table Orders") }
                        }
                }
                
                contactDB!.close()
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "orders_load"), object: nil)
                
                if req!.count == 0
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Orders fetch failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "add_to_cart"
            {
                let response = String(describing: dataRows["response"]!);                                        print("add_to_cart response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "add_to_cart"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Add to Cart failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "remove_from_cart"
            {
                let response = String(describing: dataRows["response"]!);                                        print("remove_from_cart response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "remove_from_cart"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Remove from Cart failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "add_to_wishlist"
            {
                let response = String(describing: dataRows["response"]!);                                        print("add_to_wishlist response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "add_to_wishlist"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Add to Wishlist failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "remove_from_wishlist"
            {
                let response = String(describing: dataRows["response"]!);                                        print("remove_from_wishlist response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "remove_from_wishlist"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Remove from Wishlist failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "remove_from_cart_wishlist"
            {
                let response = String(describing: dataRows["response"]!);                                        print("remove_from_cart_wishlist response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "remove_from_cart_wishlist"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Cart to Wishlist failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "update_cart_minus"
            {
                let response = String(describing: dataRows["response"]!);                                        print("update_cart_minus response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update_cart_minus"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Removing quantity from Cart failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "update_cart_plus"
            {
                let response = String(describing: dataRows["response"]!);                                        print("update_cart_plus response \(response)")
                
                if response == "1" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update_cart_plus"), object: nil) }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Adding quantity in Cart failed. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "register"
            {
                let response = String(describing: dataRows["response"]!)
                print("page \(page) response \(response)")
                
                if response == "1"
                {
                    /* tinsertSQL = "INSERT INTO User (First_Name, Last_Name, Email, Password, Phone, State, City, Street, Zip) VALUES ("
                     
                     tinsertSQL = tinsertSQL + "'" + First_Name + "', '" + Last_Name + "', '" + Email + "', '" + Password + "', '" + Phone + "', '" + State_text + "', '" + City + "', '" + Street + "', '"+Zip+"')"
                     
                     queue.inTransaction()
                     {
                     contactDB, rollback in
                     
                     let result = contactDB.executeUpdate(tinsertSQL, withArgumentsInArray: nil)
                     
                     if !result
                     {
                     rollback.initialize(true)
                     print("Insert Error: \(contactDB.lastErrorMessage())")
                     }
                     else
                     {
                     print("Record inserted in table User")
                     
                     //self.insertCount += 1
                     }
                     } */
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "paypal"), object: nil)
                }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Registration failed (Email already exists)."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
            else if page == "confirm"
            {
                let response = String(describing: dataRows["response"]!);                                        print("parseJSON() page \(page) response \(response)")
                
                if response == "1"
                {
                    //for(var i = 0; i < req!.count; i++)
                    for i in 0 ..< req!.count
                    {
                        jsonElement = req![i]
                        
                        //print("jsonElement \(jsonElement)")
                        
                        var first_name = jsonElement["first_name"] as! String;                        var last_name = jsonElement["last_name"] as! String
                        var email = jsonElement["email"] as! String;                                  var password = jsonElement["password"] as! String
                        var mobile = jsonElement["mobile"] as! String;                                var street = jsonElement["street"] as! String
                        var city = jsonElement["city"] as! String;                                    var state = jsonElement["state"] as! String
                        var zip_code = jsonElement["zip_code"] as! String
                        
                        first_name = first_name.replacingOccurrences(of: "***", with: " ")
                        last_name = last_name.replacingOccurrences(of: "***", with: " ")
                        email = email.replacingOccurrences(of: "***", with: " ")
                        password =  password.replacingOccurrences(of: "***", with: " ")
                        mobile = mobile.replacingOccurrences(of: "***", with: " ")
                        street =  street.replacingOccurrences(of: "***", with: " ")
                        city = city.replacingOccurrences(of: "***", with: " ")
                        state = state.replacingOccurrences(of: "***", with: " ")
                        zip_code = zip_code.replacingOccurrences(of: "***", with: " ")
                        
                        tinsertSQL = "UPDATE User SET First_Name = '" + first_name + "', Last_Name = '" + last_name + "', Phone = '" + mobile + "', State = '" + state + "', City = '" + city + "', Street = '" + street + "', Zip = '"+zip_code+"' WHERE Email = '" + email + "'"
                        
                        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
                        databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
                        let contactDB = FMDatabase(path: databasePath as String);                           let queue = FMDatabaseQueue(path: self.databasePath as String)
                        contactDB!.open()
                        
                        queue!.inTransaction()
                            {
                                contactDB, rollback in
                                
                                let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                                
                                if !result
                                {
                                    //rollback.initialize(true);
                                    rollback!.pointee = true
                                    print("Update Error: \(String(describing: contactDB!.lastErrorMessage()))")
                                }
                                else
                                {
                                    print("Record updated in table User \(HomeModel.getInstance().register)" )
                                    //self.insertCount += 1
                                }
                        }
                        contactDB!.close()
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "paypal"), object: nil)
                }
            }
                
            else if page == "confirm_guest"
            {
                let response = String(describing: dataRows["response"]!);                                        print("parseJSON() page \(page) response \(response)")
                
                if response == "1"
                {
                    //for(var i = 0; i < req!.count; i++)
                    for i in 0 ..< req!.count
                    {
                        jsonElement = req![i]
                        
                        //print("jsonElement \(jsonElement)")
                        
                        //{"products":[{"id":"131","guestloginid":"5a46342c3312a","first_name":"jk","last_name":"prasad","mobile":"1234567890","street":"5410 newport dr
                        //#36","city":"Rolling Meadows","state":"Illinois","zip_code":"60008","email":"jk.prasad@biznussoft.com","password":""}],"response":true}
                        
                        var first_name = jsonElement["first_name"] as! String;                        var last_name = jsonElement["last_name"] as! String
                        var email = jsonElement["email"] as! String;                                  var id = jsonElement["id"] as! String
                        var mobile = jsonElement["mobile"] as! String;                                var street = jsonElement["street"] as! String
                        var city = jsonElement["city"] as! String;                                    var state = jsonElement["state"] as! String
                        var zip_code = jsonElement["zip_code"] as! String;                            guestloginid = jsonElement["guestloginid"] as! String
                        
                        first_name = first_name.replacingOccurrences(of: "***", with: " ")
                        last_name = last_name.replacingOccurrences(of: "***", with: " ")
                        email = email.replacingOccurrences(of: "***", with: " ")
                        mobile = mobile.replacingOccurrences(of: "***", with: " ")
                        street =  street.replacingOccurrences(of: "***", with: " ")
                        city = city.replacingOccurrences(of: "***", with: " ")
                        state = state.replacingOccurrences(of: "***", with: " ")
                        zip_code = zip_code.replacingOccurrences(of: "***", with: " ")
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "paypal"), object: nil)
                }
            }
                
            else if page == "signup"
            {
                //for(var i = 0; i < req!.count; i++)
                for i in 0 ..< req!.count
                {
                    jsonElement = req![i]
                    
                    //print("jsonElement \(jsonElement)")
                    
                    let city = jsonElement["city_name"] as! String
                    
                    tinsertSQL = "INSERT INTO Cities (City, State) VALUES ("
                    
                    tinsertSQL = tinsertSQL + "'" + city + "', '"+state+"')"
                    
                    //print("tinsertSQL \(tinsertSQL)")
                    
                    queue!.inTransaction()
                        {
                            contactDB, rollback in
                            
                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                print("Record \(i) inserted in table Cities")
                                
                                //self.insertCount += 1
                            }
                    }
                }
            }
            else if page == "contactus"
            {
                let response = String(describing: dataRows["response"]!)
                print("response \(response)")
                
                if response == "1"
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        self.toplabel_message = "Info"
                        self.errormessage = "Thank you for contacting us. We will contact shortly."
                        
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.showErrorMessage()
                        
                    }
                    //)
                    //NSNotificationCenter.defaultCenter().postNotificationName("contactus", object: nil)
                }
            }
            else if page == "update_products"
            {
                //let response = String(dataRows["shipping_id"]!);                                             print("response \(response)")
                //let date = NSDate();                                                                              let ndateFormatter = NSDateFormatter()
                //ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm";                                                   let Created_On = ndateFormatter.stringFromDate(date);
                
                //let status = "Payment accepted.";
                
                let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
                databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
                let contactDB = FMDatabase(path: databasePath as String);
                contactDB!.open()
                
                queue!.inTransaction()
                    {
                        contactDB, rollback in
                        
                        var User_Id = "guest";   let results_2 : FMResultSet? = contactDB!.executeQuery("SELECT * FROM User", withArgumentsIn: nil)
                        while results_2!.next() { User_Id = results_2!.string(forColumn: "Email"); }
                        
                        /* var tinsertSQL = "INSERT INTO Shipping (Id, User_Id, Order_Id, Status, Created_On) VALUES ("
                         
                         tinsertSQL = tinsertSQL + "'" + response + "', '" + User_Id + "', '" + self.pids + "', '" + status + "', '" + self.Created_On + "')"
                         
                         print("update_products Shipping tinsertSQL \(tinsertSQL)")
                         
                         let result = contactDB.executeUpdate(tinsertSQL, withArgumentsInArray: nil)
                         
                         if !result { print("update_products Shipping Insert Error: \(contactDB.lastErrorMessage())") }
                         else { print("update_products Record inserted in table Shipping") } */
                        
                        /* for(var i = 0; i < req!.count; i++)
                         {
                         jsonElement = req![i] as! NSDictionary
                         
                         let id = jsonElement["id"] as! String;                                     //let shipping_id = jsonElement["shipping_id"] as! String;
                         let user_id = jsonElement["user_id"] as! String;                           let paypal_id = jsonElement["paypal_id"] as! String;
                         let product_id = jsonElement["product_id"] as! String;                      let quantity = jsonElement["quantity"] as! String;
                         let return_status = jsonElement["return_status"] as! String;                let shipping_charges = jsonElement["shipping_charges"] as! String;
                         let warranty_charges = jsonElement["warranty_charges"] as! String;           let shipping_status = jsonElement["shipping_status"] as! String;
                         let delivered_status = jsonElement["delivered_status"] as! String;           let Img_Path = jsonElement["Img_Path"] as! String;
                         let Headding = jsonElement["Headding"] as! String;                          let price = jsonElement["price"] as! String;
                         let SKU = jsonElement["SKU"] as! String;                                    let Model = jsonElement["Model"] as! String;
                         
                         let date = NSDate();                                                                         let ndateFormatter = NSDateFormatter()
                         ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm";                                               let Created_On = ndateFormatter.stringFromDate(date);
                         
                         var tinsertSQL = "INSERT INTO Orders (Id, User_Id, Product_Id, Img_Path, Headding, USD, SKU, Model, Quantity, Warranty, Warranty_Cost, Status, return_status, shipping_status, delivered_status, Created_On) VALUES ("
                         
                         tinsertSQL = tinsertSQL + "'" + id + "', '" + user_id + "', '" + product_id + "', '" + Img_Path + "', '" + Headding  + "', '" + price + "', "
                         tinsertSQL = tinsertSQL + "'" + SKU + "', '" + Model + "', '" + quantity + "', '', '" + warranty_charges  + "', '', "
                         tinsertSQL = tinsertSQL + "'" + return_status + "', '" + shipping_status + "', '" + delivered_status + "', '" + Created_On  + "')"
                         
                         print("update_products Orders tinsertSQL \(tinsertSQL)")
                         
                         let result = contactDB.executeUpdate(tinsertSQL, withArgumentsInArray: nil)
                         
                         if !result { print("update_products Orders Insert Error: \(contactDB.lastErrorMessage())") }
                         else { print("update_products Record inserted in table Orders") }
                         } */
                        
                        //for(var i = 0; i < req!.count; i++)
                        for i in 0 ..< req!.count
                        {
                            jsonElement = req![i]
                            
                            let Id = jsonElement["Id"] as! String
                            
                            var User_ID = ""
                            if  String(describing: jsonElement["User_ID"]) != "Optional(<null>)"
                            {
                                User_ID = jsonElement["User_ID"] as! String
                            }
                            
                            var productname = ""
                            if  String(describing: jsonElement["productname"]) != "Optional(<null>)"
                            {
                                productname = jsonElement["productname"] as! String
                            }
                            
                            var productcode = ""
                            if  String(describing: jsonElement["productcode"]) != "Optional(<null>)"
                            {
                                productcode = jsonElement["productcode"] as! String
                            }
                            
                            var Model = ""
                            if  String(describing: jsonElement["Model"]) != "Optional(<null>)"
                            {
                                Model = jsonElement["Model"] as! String
                            }
                            
                            var SKU = ""
                            if  String(describing: jsonElement["SKU"]) != "Optional(<null>)"
                            {
                                SKU = jsonElement["SKU"] as! String
                            }
                            
                            var vendor_partno = ""
                            if  String(describing: jsonElement["vendor_partno"]) != "Optional(<null>)"
                            {
                                vendor_partno = jsonElement["vendor_partno"] as! String
                            }
                            
                            var Weight = ""
                            if  String(describing: jsonElement["Weight"]) != "Optional(<null>)"
                            {
                                Weight = jsonElement["Weight"] as! String
                            }
                            
                            var Old_USD = ""
                            if  String(describing: jsonElement["Old_USD"]) != "Optional(<null>)"
                            {
                                Old_USD = jsonElement["Old_USD"] as! String
                            }
                            
                            var USD = ""
                            if  String(describing: jsonElement["USD"]) != "Optional(<null>)"
                            {
                                USD = jsonElement["USD"] as! String
                            }
                            
                            var offer_percentage = ""
                            if  String(describing: jsonElement["offer_percentage"]) != "Optional(<null>)"
                            {
                                offer_percentage = jsonElement["offer_percentage"] as! String
                            }
                            
                            var productcondition = ""
                            if  String(describing: jsonElement["productcondition"]) != "Optional(<null>)"
                            {
                                productcondition = jsonElement["productcondition"] as! String
                            }
                            
                            var productmanufacturer = ""
                            if  String(describing: jsonElement["productmanufacturer"]) != "Optional(<null>)"
                            {
                                productmanufacturer = jsonElement["productmanufacturer"] as! String
                            }
                            
                            var Description  = ""
                            if  String(describing: jsonElement["Description"]) != "Optional(<null>)"
                            {
                                Description = jsonElement["Description"] as! String
                            }
                            
                            var photourl_large = ""
                            if  String(describing: jsonElement["photourl_large"]) != "Optional(<null>)"
                            {
                                photourl_large = jsonElement["photourl_large"] as! String
                            }
                            
                            var categoryids = ""
                            if  String(describing: jsonElement["categoryids"]) != "Optional(<null>)"
                            {
                                categoryids = jsonElement["categoryids"] as! String
                            }
                            
                            var categorytree  = ""
                            if  String(describing: jsonElement["categorytree"]) != "Optional(<null>)"
                            {
                                categorytree = jsonElement["categorytree"] as! String
                            }
                            
                            var google_product_category = ""
                            if  String(describing: jsonElement["google_product_category"]) != "Optional(<null>)"
                            {
                                google_product_category = jsonElement["google_product_category"] as! String
                            }
                            
                            var google_product_type = ""
                            if  String(describing: jsonElement["google_product_type"]) != "Optional(<null>)"
                            {
                                google_product_type = jsonElement["google_product_type"] as! String
                            }
                            
                            var Sold_Out = ""
                            if  String(describing: jsonElement["Sold_Out"]) != "Optional(<null>)"
                            {
                                Sold_Out = jsonElement["Sold_Out"] as! String
                            }
                            
                            var technical_Specs = ""
                            
                            //if Id == "1" || Id == "10" { print("technical_Specs \(jsonElement["technical_Specs"])") }
                            
                            if  String(describing: jsonElement["technical_Specs"]) != "Optional(<null>)"
                            {
                                technical_Specs = jsonElement["technical_Specs"] as! String
                            }
                            
                            var buyCount = ""
                            if  String(describing: jsonElement["buyCount"]) != "Optional(<null>)"
                            {
                                buyCount = jsonElement["buyCount"] as! String
                            }
                            
                            var viewCount = ""
                            if  String(describing: jsonElement["viewCount"]) != "Optional(<null>)"
                            {
                                viewCount = jsonElement["viewCount"] as! String
                            }
                            
                            var Quantity = ""
                            if  String(describing: jsonElement["Quantity"]) != "Optional(<null>)"
                            {
                                Quantity = jsonElement["Quantity"] as! String
                            }
                            
                            var Created_Date = ""
                            if  String(describing: jsonElement["Created_Date"]) != "Optional(<null>)"
                            {
                                Created_Date = jsonElement["Created_Date"] as! String
                            }
                            
                            var Modified_Date = ""
                            if  String(describing: jsonElement["Modified_Date"]) != "Optional(<null>)"
                            {
                                Modified_Date = jsonElement["Modified_Date"] as! String
                            }
                            
                            var brandname = ""
                            if  String(describing: jsonElement["brandname"]) != "Optional(<null>)"
                            {
                                brandname = jsonElement["brandname"] as! String
                            }
                            
                            var categoryname = ""
                            if  String(describing: jsonElement["categoryname"]) != "Optional(<null>)"
                            {
                                categoryname = jsonElement["categoryname"] as! String
                            }
                            
                            tinsertSQL = "INSERT INTO Order_Products (Id, User_ID, productname, productcode, Model, SKU, vendor_partno, Weight, Old_USD, USD, offer_percentage, productcondition, productmanufacturer, Description, photourl_large, categoryids, categorytree, google_product_category, google_product_type, Sold_Out, technical_Specs, buyCount, viewCount, Quantity, Created_Date, Modified_Date, brandname, categoryname) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+User_ID+"', '"+productname+"', '"+productcode+"', "
                            tinsertSQL = tinsertSQL + "'" + Model+"', '"+SKU+"', '"+vendor_partno+"', '"+Weight+"', "
                            tinsertSQL = tinsertSQL + "'" + Old_USD + "', '"+USD+"', '"+offer_percentage+"', '"+productcondition+"', "
                            tinsertSQL = tinsertSQL + "'" + productmanufacturer+"', '"+Description.replacingOccurrences(of: "'", with: "")+"', '"+photourl_large+"', "
                            tinsertSQL = tinsertSQL + "'" + categoryids + "', '"+categorytree+"', "
                            tinsertSQL = tinsertSQL + "'" + google_product_category + "', '"+google_product_type+"', '"+Sold_Out+"', "
                            tinsertSQL = tinsertSQL + "'" + technical_Specs.replacingOccurrences(of: "'", with: "")+"', '"+buyCount+"', '"+viewCount+"', "
                            tinsertSQL = tinsertSQL + "'" + Quantity + "', '"+Created_Date+"', '"+Modified_Date+"', '"+brandname+"', '"+categoryname+"')"
                            
                            var result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { //rollback.initialize(true);
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("Record \(i) inserted in table Order_Products") }
                            
                            //
                            let id = jsonElement["io_id"] as! String;                                     //let shipping_id = jsonElement["shipping_id"] as! String;
                            //var user_id =  "";              if User_Id != "guest" { user_id = jsonElement["user_id"] as! String; } else { user_id = User_Id }
                            
                            let user_id = jsonElement["user_id"] as! String;
                            
                            let paypal_id = jsonElement["paypal_id"] as! String;
                            let product_id = jsonElement["product_id"] as! String;                     let quantity = jsonElement["quantity"] as! String;
                            let return_status = jsonElement["return_status"] as! String;                let shipping_charges = jsonElement["shipping_charges"] as! String;
                            let warranty_charges = jsonElement["warranty_charges"] as! String;          let shipping_status = jsonElement["shipping_status"] as! String;
                            let delivered_status = jsonElement["delivered_status"] as! String;          let price = jsonElement["price"] as! String;
                            
                            //let Img_Path = jsonElement["Img_Path"] as! String;                            let Headding = jsonElement["Headding"] as! String;
                            //let SKU = jsonElement["SKU"] as! String;                                      let Model = jsonElement["Model"] as! String;
                            
                            let date = NSDate();                                                      let ndateFormatter = DateFormatter()
                            ndateFormatter.dateFormat = "yyyy-MM-dd HH:mm";                            let Order_Created_On = ndateFormatter.string(from: date as Date);
                            
                            var tinsertSQL = "INSERT INTO Orders (Id, User_Id, Product_Id, Img_Path, Headding, USD, SKU, Model, Quantity, Warranty, Warranty_Cost, Status, return_status, shipping_status, delivered_status, Created_On) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + id + "', '" + user_id + "', '" + product_id + "', '" + photourl_large + "', '" + productname  + "', '" + price + "', "
                            tinsertSQL = tinsertSQL + "'" + SKU + "', '" + Model + "', '" + quantity + "', '', '" + warranty_charges  + "', '', "
                            tinsertSQL = tinsertSQL + "'" + return_status + "', '" + shipping_status + "', '" + delivered_status + "', '" + Order_Created_On  + "')"
                            
                            print("update_products Orders tinsertSQL \(tinsertSQL)")
                            
                            result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result { print("update_products Orders Insert Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            else { print("update_products Record inserted in table Orders") }
                        }
                }
                
                contactDB!.close()
                
                urlPath_backup = ""
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "orders_load"), object: nil)
            }
            else if page == "cancel_order"
            {
                let response = String(describing: dataRows["success"]!);                print("cancel_order response \(response)")
                
                if response == "1"
                {
                    let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask);
                    databasePath = dirPaths[0].appendingPathComponent("curbgenie.db").path as NSString;
                    let contactDB = FMDatabase(path: databasePath as String);
                    contactDB!.open()
                    
                    let tinsertSQL = "UPDATE Shipping SET Status = 'Order Cancelled' WHERE Id = '" + shippingId + "'"
                    print("cancel_order Delete Shipping tinsertSQL \(tinsertSQL)")
                    
                    let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                    
                    if !result { print("cancel_order Shipping Delete Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                    else { print("cancel_order Deleted from table Shipping") }
                    
                    contactDB!.close()
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "orders_load"), object: nil)
                }
            }
            else if page == "forgot"
            {
                if req!.count == 0
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Email does not exist."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
                else
                {
                    jsonElement = req![0]
                    
                    otp = jsonElement["otp"] as! String
                    
                    print("forgot password OTP jsonElement \(jsonElement) otp \(otp)")
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "new_password"), object: nil)
                }
            }
            else if page == "new_password"
            {
                let response = String(describing: dataRows["response"]!)
                print("response \(response)")
                
                if response == "1"
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.toplabel_message = "Info"
                        
                        self.errormessage = "Password has been changed successfully."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
                else
                {
                    //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    DispatchQueue.main.async {
                        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                        
                        if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                        
                        if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                        
                        self.errormessage = "Something went wrong. Please try again."
                        
                        self.showErrorMessage()
                    }
                    //)
                }
            }
                
            else if page == "types"
            {
                queue!.inTransaction()
                    { contactDB, rollback in
                        //for(var i = 0; i < req!.count; i++)
                        for i in 0 ..< req!.count
                        {
                            jsonElement = req![i]
                            
                            //print("jsonElement \(jsonElement)")
                            
                            let Id = jsonElement["Id"] as! String;      let Type = jsonElement["Type"] as! String;          let Icon = jsonElement["Icon"] as! String
                            
                            tinsertSQL = "INSERT INTO type (Id, Type, Icon) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+Type+"', '"+Icon+"')"
                            
                            //print("tinsertSQL \(tinsertSQL)")
                            
                            //queue.inTransaction()
                            //{
                            //    contactDB, rollback in
                            
                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                print("Record \(i) inserted in table type")
                                
                                //self.insertCount += 1
                            }
                            //}
                        }
                }
            }
            else if page == "keyword_search"
            {
                queue!.inTransaction()
                    {
                        contactDB, rollback in
                        
                        //for(var i = 0; i < req!.count; i++)
                        for i in 0 ..< req!.count
                        {
                            jsonElement = req![i]
                            
                            //print("jsonElement \(jsonElement)")
                            
                            let Id = jsonElement["Id"] as! String;   let Name = jsonElement["Name"] as! String;         let Headding = jsonElement["Headding"] as! String
                            
                            tinsertSQL = "INSERT INTO Model_Names (Id, Name, Headding) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+Name+"', '"+Headding+"')"
                            
                            //print("tinsertSQL \(tinsertSQL)")
                            
                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                print("Record \(i) inserted in table Model_Names")
                                
                                //self.insertCount += 1
                            }
                        }
                }
            }
            else
            {
                queue!.inTransaction()
                    {
                        contactDB, rollback in
                        //for(var i = 0; i < req!.count; i++)
                        for i in 0 ..< req!.count
                        {
                            jsonElement = req![i]
                            
                            let Id = jsonElement["Id"] as! String
                            
                            var User_ID = ""
                            if  String(describing: jsonElement["User_ID"]) != "Optional(<null>)"
                            {
                                User_ID = jsonElement["User_ID"] as! String
                            }
                            
                            var productname = ""
                            if  String(describing: jsonElement["productname"]) != "Optional(<null>)"
                            {
                                productname = jsonElement["productname"] as! String
                            }
                            
                            var productcode = ""
                            if  String(describing:  jsonElement["productcode"]) != "Optional(<null>)"
                            {
                                productcode = jsonElement["productcode"] as! String
                            }
                            
                            var Model = ""
                            if  String(describing: jsonElement["Model"]) != "Optional(<null>)"
                            {
                                Model = jsonElement["Model"] as! String
                            }
                            
                            var SKU = ""
                            if  String(describing: jsonElement["SKU"]) != "Optional(<null>)"
                            {
                                SKU = jsonElement["SKU"] as! String
                            }
                            
                            var vendor_partno = ""
                            if  String(describing: jsonElement["vendor_partno"]) != "Optional(<null>)"
                            {
                                vendor_partno = jsonElement["vendor_partno"] as! String
                            }
                            
                            var Weight = ""
                            if  String(describing: jsonElement["Weight"]) != "Optional(<null>)"
                            {
                                Weight = jsonElement["Weight"] as! String
                            }
                            
                            var Old_USD = ""
                            if  String(describing: jsonElement["Old_USD"]) != "Optional(<null>)"
                            {
                                Old_USD = jsonElement["Old_USD"] as! String
                            }
                            
                            var USD = ""
                            if  String(describing: jsonElement["USD"]) != "Optional(<null>)"
                            {
                                USD = jsonElement["USD"] as! String
                            }
                            
                            var offer_percentage = ""
                            if  String(describing: jsonElement["offer_percentage"]) != "Optional(<null>)"
                            {
                                offer_percentage = jsonElement["offer_percentage"] as! String
                            }
                            
                            var productcondition = ""
                            if  String(describing: jsonElement["productcondition"]) != "Optional(<null>)"
                            {
                                productcondition = jsonElement["productcondition"] as! String
                            }
                            
                            var productmanufacturer = ""
                            if  String(describing: jsonElement["productmanufacturer"]) != "Optional(<null>)"
                            {
                                productmanufacturer = jsonElement["productmanufacturer"] as! String
                            }
                            
                            var Description  = ""
                            if  String(describing: jsonElement["Description"]) != "Optional(<null>)"
                            {
                                Description = jsonElement["Description"] as! String
                            }
                            
                            var photourl_large = ""
                            if  String(describing: jsonElement["photourl_large"]) != "Optional(<null>)"
                            {
                                photourl_large = jsonElement["photourl_large"] as! String
                            }
                            
                            var categoryids = ""
                            if  String(describing: jsonElement["categoryids"]) != "Optional(<null>)"
                            {
                                categoryids = jsonElement["categoryids"] as! String
                            }
                            
                            var categorytree  = ""
                            if  String(describing: jsonElement["categorytree"]) != "Optional(<null>)"
                            {
                                categorytree = jsonElement["categorytree"] as! String
                            }
                            
                            var google_product_category = ""
                            if  String(describing: jsonElement["google_product_category"]) != "Optional(<null>)"
                            {
                                google_product_category = jsonElement["google_product_category"] as! String
                            }
                            
                            var google_product_type = ""
                            if  String(describing: jsonElement["google_product_type"]) != "Optional(<null>)"
                            {
                                google_product_type = jsonElement["google_product_type"] as! String
                            }
                            
                            var Sold_Out = ""
                            if  String(describing: jsonElement["Sold_Out"]) != "Optional(<null>)"
                            {
                                Sold_Out = jsonElement["Sold_Out"] as! String
                            }
                            
                            var technical_Specs = ""
                            
                            //if Id == "8341" { print("technical_Specs \(jsonElement["technical_Specs"])") }
                            
                            if  String(describing: jsonElement["technical_Specs"]) != "Optional(<null>)"
                            {
                                technical_Specs = jsonElement["technical_Specs"] as! String
                            }
                            
                            var buyCount = ""
                            if  String(describing: jsonElement["buyCount"]) != "Optional(<null>)"
                            {
                                buyCount = jsonElement["buyCount"] as! String
                            }
                            
                            var viewCount = ""
                            if  String(describing: jsonElement["viewCount"]) != "Optional(<null>)"
                            {
                                viewCount = jsonElement["viewCount"] as! String
                            }
                            
                            var Quantity = ""
                            if  String(describing: jsonElement["Quantity"]) != "Optional(<null>)"
                            {
                                Quantity = jsonElement["Quantity"] as! String
                            }
                            
                            var Created_Date = ""
                            if  String(describing: jsonElement["Created_Date"]) != "Optional(<null>)"
                            {
                                Created_Date = jsonElement["Created_Date"] as! String
                            }
                            
                            var Modified_Date = ""
                            if  String(describing: jsonElement["Modified_Date"]) != "Optional(<null>)"
                            {
                                Modified_Date = jsonElement["Modified_Date"] as! String
                            }
                            
                            var brandname = ""
                            if  String(describing: jsonElement["brandname"]) != "Optional(<null>)"
                            {
                                brandname = jsonElement["brandname"] as! String
                            }
                            
                            var categoryname = ""
                            if  String(describing: jsonElement["categoryname"]) != "Optional(<null>)"
                            {
                                categoryname = jsonElement["categoryname"] as! String
                            }
                            
                            /*if Id == "179" || Id == "211" || Id == "164" || Id == "97" || Id == "212" || Id == "81"
                             {
                             print("Id \(Id) categoryname \(categoryname) brandname \(brandname)")
                             }*/
                            
                            if self.page == "search"
                            {
                                tinsertSQL = "INSERT INTO Products (Id, User_ID, productname, productcode, Model, SKU, vendor_partno, Weight, Old_USD, USD, offer_percentage, productcondition, productmanufacturer, Description, photourl_large, categoryids, categorytree, google_product_category, google_product_type, Sold_Out, technical_Specs, buyCount, viewCount, Quantity, Created_Date, Modified_Date, brandname, categoryname) VALUES ("
                            }
                            else
                            {
                                tinsertSQL = "INSERT INTO Products (Id, User_ID, productname, productcode, Model, SKU, vendor_partno, Weight, Old_USD, USD, offer_percentage, productcondition, productmanufacturer, Description, photourl_large, categoryids, categorytree, google_product_category, google_product_type, Sold_Out, technical_Specs, buyCount, viewCount, Quantity, Created_Date, Modified_Date, brandname, categoryname) VALUES ("
                            }
                            
                            tinsertSQL = tinsertSQL + "'" + Id + "', '"+User_ID+"', '"+productname+"', '"+productcode+"', "
                            tinsertSQL = tinsertSQL + "'" + Model+"', '"+SKU+"', '"+vendor_partno+"', '"+Weight+"', "
                            tinsertSQL = tinsertSQL + "'" + Old_USD + "', '"+USD+"', '"+offer_percentage+"', '"+productcondition+"', "
                            tinsertSQL = tinsertSQL + "'" + productmanufacturer+"', '"+Description.replacingOccurrences(of: "'", with: "")+"', '"+photourl_large+"', "
                            tinsertSQL = tinsertSQL + "'" + categoryids + "', '"+categorytree+"', "
                            tinsertSQL = tinsertSQL + "'" + google_product_category + "', '"+google_product_type+"', '"+Sold_Out+"', "
                            tinsertSQL = tinsertSQL + "'" + technical_Specs.replacingOccurrences(of: "'", with: "")+"', '"+buyCount+"', '"+viewCount+"', "
                            tinsertSQL = tinsertSQL + "'" + Quantity + "', '"+Created_Date+"', '"+Modified_Date+"', '"+brandname+"', '"+categoryname+"')"
                            
                            //if Id == "1" || Id == "10" { print("tinsertSQL \(tinsertSQL)") }
                            
                            //queue.inTransaction()
                            //{
                            //    contactDB, rollback in
                            
                            let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                //if self.page == "search" { print("Record \(i) inserted in table Products") } else { print("Record \(i) inserted in table Products") }
                                //self.insertCount += 1
                            }
                            //}queue.inTransaction()
                        }
                        
                        print("\(req!.count) products inserted")
                        //} queue.inTransaction()
                        
                        if self.urlPath.range(of: "get_all_products.php") != nil //if urlPath.rangeOfString("get_all_home_products.php") != nil
                        {
                            let types = self.dataRows["types"] as? [NSDictionary];
                            
                            //queue.inTransaction()
                            //{
                            //contactDB, rollback in
                            
                            if contactDB!.executeStatements("DELETE FROM type") { print("All Records deleted from type") }
                            else { print("Record deletion from type Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            //for(var i = 0; i < types!.count; i++)
                            for i in 0 ..< types!.count
                            {
                                jsonElement = types![i]
                                
                                //print("jsonElement \(jsonElement)") let Id = jsonElement["Id"] as! String
                                
                                //let Id = jsonElement["Id"] as! String;      let Type = jsonElement["Type"] as! String;          let Icon = jsonElement["Icon"] as! String
                                
                                let Id = jsonElement["Id"] as! String;                              let categoryid = jsonElement["categoryid"] as! String;
                                let parentid = jsonElement["parentid"] as! String;                   let categoryname = jsonElement["categoryname"] as! String
                                let categoryorder = jsonElement["categoryorder"] as! String
                                
                                tinsertSQL = "INSERT INTO type (Id, categoryid, parentid, categoryname, categoryorder) VALUES ("     //Type, Icon
                                
                                tinsertSQL = tinsertSQL + "'" + Id + "', '"+categoryid+"', '"+parentid+"', '"+categoryname+"', '"+categoryorder+"')"
                                
                                //print("tinsertSQL \(tinsertSQL)")
                                
                                //queue.inTransaction()
                                //{
                                //    contactDB, rollback in
                                
                                let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                                
                                if !result
                                {
                                    //rollback.initialize(true);
                                    rollback!.pointee = true
                                    print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                                }
                                else
                                {
                                    //print("Record \(i) inserted in table type")
                                    
                                    //self.insertCount += 1
                                }
                                //}queue.inTransaction()
                            }
                            
                            //"SELECT products.*, (select category.categoryname from category where category.categoryid in (select category.parentid from category where (category.parentid in (select category.categoryid from category where (category.categoryname <> 'Windows')) and (category.categoryname not in ('Apple', 'Windows', 'Products', 'Daily Deals', 'Weekly Promotions', 'Refurbished Products')) and (category.categoryid = products.categoryids)))) AS brandname, (select category.categoryname from category where (category.categoryid = products.categoryids)) AS categoryname FROM products";
                            //
                            /* if contactDB.executeStatements("DELETE FROM brand") { print("All Records deleted from brand") }
                             else { print("Record deletion from brand Error: \(contactDB.lastErrorMessage())") }
                             
                             let brands = self.dataRows["brands"] as? [NSDictionary];
                             
                             for(var i = 0; i < brands!.count; i++)
                             {
                             jsonElement = brands![i] as! NSDictionary
                             
                             let Id = jsonElement["Id"] as! String;      let Brand = jsonElement["Brand"] as! String;
                             
                             tinsertSQL = "INSERT INTO brand (Id, Brand) VALUES ("
                             
                             tinsertSQL = tinsertSQL + "'" + Id + "', '"+Brand+"')"
                             
                             //print("tinsertSQL \(tinsertSQL)")
                             
                             //queue.inTransaction()
                             //{
                             //contactDB, rollback in
                             
                             let result = contactDB.executeUpdate(tinsertSQL, withArgumentsInArray: nil)
                             
                             if !result
                             {
                             rollback.initialize(true)
                             print("Insert Error: \(contactDB.lastErrorMessage())")
                             }
                             else
                             {
                             print("Record \(i) inserted in table brand")
                             
                             //self.insertCount += 1
                             }
                             //}
                             }
                             
                             if contactDB.executeStatements("DELETE FROM color") { print("All Records deleted from color") }
                             else { print("Record deletion from color Error: \(contactDB.lastErrorMessage())") }
                             
                             let colors = self.dataRows["colors"] as? [NSDictionary];
                             
                             for(var i = 0; i < colors!.count; i++)
                             {
                             jsonElement = colors![i] as! NSDictionary
                             
                             //print("jsonElement \(jsonElement)") let Id = jsonElement["Id"] as! String
                             
                             var Color = ""; if jsonElement["Color"] != nil && String(jsonElement["Color"]) != "Optional(<null>)"
                             { Color = jsonElement["Color"] as! String }
                             
                             tinsertSQL = "INSERT INTO color (Color) VALUES ("
                             
                             tinsertSQL = tinsertSQL + "'"+Color+"')"
                             
                             print("page \(self.page) tinsertSQL \(tinsertSQL)")
                             
                             //queue.inTransaction()
                             //{
                             //contactDB, rollback in
                             
                             let result = contactDB.executeUpdate(tinsertSQL, withArgumentsInArray: nil)
                             
                             if !result
                             {
                             rollback.initialize(true)
                             print("Insert Error: \(contactDB.lastErrorMessage())")
                             }
                             else
                             {
                             print("Record \(i) inserted in table color")
                             //self.insertCount += 1
                             }
                             //}queue.inTransaction()
                             } */
                            
                            if contactDB!.executeStatements("DELETE FROM price") { print("All Records deleted from price") }
                            else { print("Record deletion from price Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            let Small = String(describing: self.dataRows["min_price"]!);
                            let Large = String(describing: self.dataRows["max_price"]!);
                            
                            tinsertSQL = "INSERT INTO price (Small, Large) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'"+Small+"', '"+Large+"')"
                            
                            print("page \(self.page) tinsertSQL \(tinsertSQL)")
                            
                            //queue.inTransaction()
                            //    {
                            //        contactDB, rollback in
                            
                            var result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                print("Record inserted in table price")
                                //self.insertCount += 1
                            }
                            //}queue.inTransaction()
                            
                            //
                            if contactDB!.executeStatements("DELETE FROM banners") { print("All Records deleted from banners") }
                            else { print("Record deletion from banners Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            let banners = self.dataRows["banners"] as? [NSDictionary];
                            
                            //for(var i = 0; i < banners!.count; i++)
                            for i in 0 ..< banners!.count
                            {
                                jsonElement = banners![i]
                                
                                //print("jsonElement \(jsonElement)") let Id = jsonElement["Id"] as! String
                                
                                //let Id = jsonElement["Id"] as! String;      let Type = jsonElement["Type"] as! String;          let Icon = jsonElement["Icon"] as! String
                                
                                let Id = jsonElement["Id"] as! String;                              let Image = jsonElement["Image"] as! String;
                                
                                tinsertSQL = "INSERT INTO banners (Id, Image) VALUES ("     //Type, Icon
                                
                                tinsertSQL = tinsertSQL + "'" + Id + "', '"+Image+"')"
                                
                                //print("tinsertSQL \(tinsertSQL)")
                                
                                //queue.inTransaction()
                                //{
                                //    contactDB, rollback in
                                
                                let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                                
                                if !result
                                {
                                    //rollback.initialize(true);
                                    rollback!.pointee = true
                                    print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                                }
                                else
                                {
                                    //print("Record \(i) inserted in table type")
                                    
                                    //self.insertCount += 1
                                }
                                //}queue.inTransaction()
                            }
                            
                            //
                            if contactDB!.executeStatements("DROP TABLE IF EXISTS build_version") { print("build_version table dropped") }  else { print("build_version table not dropped Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            if contactDB!.executeStatements("CREATE TABLE IF NOT EXISTS build_version  (build_version TEXT)") { print("build_version table created") }
                            else { print("build_version table not created Error: \(String(describing: contactDB!.lastErrorMessage()))") }
                            
                            let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
                            
                            tinsertSQL = "INSERT INTO build_version (build_version) VALUES ("
                            
                            tinsertSQL = tinsertSQL + "'"+version+"')"
                            
                            print("page \(self.page) tinsertSQL \(tinsertSQL)")
                            
                            //queue.inTransaction()
                            //    {
                            //        contactDB, rollback in
                            
                            result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                            
                            if !result
                            {
                                //rollback.initialize(true)
                                rollback!.pointee = true
                                print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                            }
                            else
                            {
                                print("Record inserted in table build_version")
                                //self.insertCount += 1
                            }
                            //}queue.inTransaction()
                            //}queue.inTransaction()
                        }   //if self.urlPath.rangeOfString("get_all_products.php")
                } //queue.inTransaction()
                
                if page == "offers"
                {
                    let todays = dataRows["todays"] as? [NSDictionary];
                    
                    queue!.inTransaction()
                        {
                            contactDB, rollback in
                            
                            //for(var i = 0; i < todays!.count; i++)
                            for i in 0 ..< todays!.count
                            {
                                jsonElement = todays![i]
                                
                                //print("jsonElement \(jsonElement)") let Id = jsonElement["Id"] as! String
                                
                                var image_url = ""; if jsonElement["image_url"] != nil && String(describing: jsonElement["image_url"]) != "Optional(<null>)"
                                { image_url = jsonElement["image_url"] as! String }
                                
                                var details = ""; if jsonElement["details"] != nil && String(describing: jsonElement["details"]) != "Optional(<null>)"
                                { details = jsonElement["details"] as! String }
                                
                                var terms_conditions = ""; if jsonElement["terms_conditions"] != nil && String(describing:  jsonElement["terms_conditions"]) != "Optional(<null>)"
                                { terms_conditions = jsonElement["terms_conditions"] as! String }
                                
                                tinsertSQL = "INSERT INTO Todays (image_url, details, terms_conditions) VALUES ("
                                
                                tinsertSQL = tinsertSQL + "'"+image_url+"', '"+details.replacingOccurrences(of: "'", with: "")+"', '"+terms_conditions.replacingOccurrences(of: "'", with: "")+"')"
                                
                                print("page \(self.page) tinsertSQL \(tinsertSQL)")
                                
                                //queue.inTransaction()
                                //{
                                //    contactDB, rollback in
                                
                                let result = contactDB!.executeUpdate(tinsertSQL, withArgumentsIn: nil)
                                
                                if !result
                                {
                                    //rollback.initialize(true)
                                    rollback!.pointee = true
                                    print("Insert Error: \(String(describing: contactDB!.lastErrorMessage()))")
                                }
                                else
                                {
                                    print("Record \(i) inserted in table Todays")
                                    //self.insertCount += 1
                                }
                                //}
                            }
                    }
                }
            }
        }
        catch let error as NSError
        {
            print(error)
            
            //dispatch_async(dispatch_get_main_queue(), { () -> Void in
            DispatchQueue.main.async {
                
                let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
                
                if win.viewWithTag(1115) != nil  { if let viewWithTag = win.viewWithTag(1115)  { print("1115"); viewWithTag.removeFromSuperview(); } }
                
                if win.viewWithTag(1116) != nil  { if let viewWithTag = win.viewWithTag(1116)  { print("1116"); viewWithTag.removeFromSuperview(); } }
                
                self.errormessage = "Something went wrong. Please try again."
                
                self.showErrorMessage()
            }
            //)
        }
        
        if page == "home" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil) }
        
        if page == "search"
        {
            if present_page == "DetailController"
            { redirected = 1; NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect"), object: nil) }
            
            if present_page == "CartController"
            { redirected = 1; NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect_cart"), object: nil) }
            
            if present_page == "LoginController"
            { redirected = 1; NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect_login"), object: nil) }
            
            if present_page == "AdvancedController"
            { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redirect_advanced"), object: nil) }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSearchResults"), object: nil)
        }
        
        if page == "advanced" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAdvancedResults"), object: nil) }
        
        if page == "signup" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadcities"), object: nil) }
        
        if page == "category" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadCategoryResults"), object: nil) }
        
        if page == "types" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTypesResults"), object: nil) }
        
        if page == "offers" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadOffersResults"), object: nil) }
        
        if page == "keyword_search" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadModelsResults"), object: nil) }
        
        if page == "all" { NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSplashResults"), object: nil) }
    }
    
    func keyword_search()
    {
        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        if win.viewWithTag(16) != nil { win.viewWithTag(16)!.removeFromSuperview() }
        
        var shadowView = UIView(frame: CGRect(x: 0, y: win.frame.height * 5 / 100 + 15, width: win.frame.width - 10, height: win.frame.height * 5 / 100))
        shadowView.layer.shadowColor = UIColor.black.cgColor;
        shadowView.layer.shadowOffset = CGSize(width: win.frame.width, height: win.frame.height)
        shadowView.layer.shadowOpacity = 0.5;                                           shadowView.layer.shadowRadius = 5
        
        let av = AlertView(frame: CGRect(x: 0, y: 0, width: win.frame.width, height: win.frame.height * 8 / 100), cas: 3);
        av.tag = 21;
        
        //alertView.backgroundColor = UIColor.whiteColor()
        av.layer.cornerRadius = 10.0;                                                  av.layer.borderColor = UIColor.gray.cgColor
        av.layer.borderWidth = 0.5;                                                    av.clipsToBounds = true
        
        av.closeButton.addTarget(self, action: #selector(self.search_box_close), for: UIControl.Event.touchUpInside)
        av.button.addTarget(self, action: #selector(self.search), for: UIControl.Event.touchUpInside)
        
        shadowView.addSubview(av);                                                     shadowView.tag = 16;
        win.addSubview(shadowView)
    }
    
    @objc func search_box_close(sender:  UIButton)
    {
        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        if win.viewWithTag(16) != nil { win.viewWithTag(16)!.removeFromSuperview() }
    }
    
    @objc func search(sender:  UIButton)
    {
        let win: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        
        if win.viewWithTag(21) != nil
        {
            //HomeModel.getInstance().search_value = win.viewWithTag(21)!.textfield.text
            
            let viewWithTag = win.viewWithTag(21)! as! AlertView;   //UITextField;
            
            if viewWithTag.textfield.text!.characters.count > 3
            {
                page = "search"
                urlPath = "http://dev.nettradez.com/ios/get_keyword_products.php?key=" + viewWithTag.textfield.text!.replacingOccurrences(of: " ", with: "***") + "&start=0"
                checkDB()
                
                category = viewWithTag.textfield.text!
                
                if win.viewWithTag(16) != nil { win.viewWithTag(16)!.removeFromSuperview() }
                
                search_page = 1
            }
            else
            {
                let alert = UIAlertView();                  alert.title = "Alert";              alert.message = "Please type atleast 4 characters."
                alert.addButton(withTitle: "Ok");             alert.show()
            }
            
            //HomeModel.getInstance().search_value = ""
        }
    }
}
