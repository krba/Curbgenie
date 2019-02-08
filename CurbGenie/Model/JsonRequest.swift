import Foundation
class JsonRequest: Codable
{
    var jsonrpc = "2.0"
    var method = "getToken"
    var params = ["testtest1", "3aa03265b3024818ee0de9baf85bcb255e284632aa6f663ebdc306065dadcf08"]
    var id = 1
    
    init()
    {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Request: Codable
{
    var jsonrpc = "2.0"
    var method = "getToken"
    var params = ""
    var id = 1
    
    init()
    {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
