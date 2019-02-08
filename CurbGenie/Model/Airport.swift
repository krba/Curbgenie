import UIKit

class Airport: NSObject {
    
    //used @objc to expose the value (Swift 4) to objective C since Cocoa is ObjC
    //need to change the way the dictionaries are set up when pulling from Firebase
    @objc var name: String?
    @objc var city: String?
    @objc var airportImageUrl: String?
}

