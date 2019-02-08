import Foundation

struct EditBookJsonRequest: Codable
{
    var jsonrpc = "2.0"
    var method = "getToken"
    var params : EditParams
    var id = 1
    
    enum CodingKeys: String, CodingKey {
        case jsonrpc = "jsonrpc"
        case method = "method"
        case params = "params"
        case id = "id"
    }
}

struct EditParams: Codable
{
    var shedulerId = ""
    var eventId = ""
    var unitId = ""
    var clientId = ""
    var date = ""
    var time = ""
    var endDate = ""
    var endTime = ""
    var clientTimeOffset = ""
    var additionalFields: Additional        //EditAdditional
    
    enum CodingKeys: String, CodingKey {
        case shedulerId = "a"
        case eventId = "b"
        case unitId = "c"
        case clientId = "d"
        case date = "e"
        case time = "f"
        case endDate = "g"
        case endTime = "h"
        case clientTimeOffset = "i"
        case additionalFields = "j" //"i"
    }
}

struct EditAdditional: Codable
{
    //var airport = ""
    var airline = ""
    var company = ""
    var terms = ""
    
    enum CodingKeys: String, CodingKey
    {
        //case airport = "1d07becab841a321ccaef0cd313fef80"
        case airline = "53b9b344d47010435c4389f521aca6c9"
        case company = "75cb026c5cc5be16f2a6f4d830782fe9"
        case terms = "c427aae07222006fb929edc4f5a432ad"
    }
}
