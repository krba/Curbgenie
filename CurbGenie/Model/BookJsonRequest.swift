import Foundation

struct AddClientJsonRequest: Codable
{
    var jsonrpc = "2.0"
    var method = "getToken"
    //var params : params
    var params = [AddClientParams]()
    var id = 1
    
    enum CodingKeys: String, CodingKey {
        case jsonrpc = "jsonrpc"
        case method = "method"
        case params = "params"
        case id = "id"
    }
}

struct AddClientParams: Codable
{
    //client book
    var name = ""
    var phone = ""
    var email = ""
    var address1 = ""
    var address2 = ""
    var city = ""
    var zip = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name" //"a" //
        case phone = "phone" //"b" //
        case email = "email" //"c" //
        case address1 = "address1" //"d" //
        case address2 = "address2" //e" //
        case city = "city" //f"
        case zip = "zip" //g"
    } 
}

struct BookJsonRequest: Codable
{
    var jsonrpc = "2.0"
    var method = "getToken"
    var params : Params
    //var params = ""
    var id = 1
    
    enum CodingKeys: String, CodingKey {
        case jsonrpc = "jsonrpc"
        case method = "method"
        case params = "params"
        case id = "id"
    }
}

struct Params: Codable
{
    //client book
    var eventId = ""
    var unitId = ""
    var date = ""
    var time = ""
    var clientData: ClientData
    var additionalFields: Additional
    //var additionalFields = ""
     
    enum CodingKeys: String, CodingKey {
        case eventId = "a"
        case unitId = "b"
        case date = "c"
        case time = "d"
        case clientData = "e"
        case additionalFields = "f"
    } 
}

struct ClientData: Codable
{
    var client_login = ""
    var client_password = ""
    
    enum CodingKeys: String, CodingKey {
        case client_login, client_password
    }
}

struct Additional: Codable
{
    var airport = ""
    var airline = ""
    var company = ""
    var terms = ""
    
    enum CodingKeys: String, CodingKey
    {
        case airport = "1d07becab841a321ccaef0cd313fef80"
        case airline = "53b9b344d47010435c4389f521aca6c9"
        case company = "75cb026c5cc5be16f2a6f4d830782fe9"
        case terms = "c427aae07222006fb929edc4f5a432ad"
    }
}
struct Form: Codable {
    let id: Int
    let name: String
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "form_id"
        case name = "form_name"
        case description = "form_desc"
    }
}
