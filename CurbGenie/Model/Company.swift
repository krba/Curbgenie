import UIKit

struct Company {
    
    let image: String
    let name: String
}

let unsortedCompanies = [Company(image: "ace", name: "Ace Rent A Car"),
                Company(image: "alamo", name: "Alamo"),
                Company(image: "avis", name: "Avis"),
                Company(image: "budget", name: "Budget"),
                Company(image: "dollar", name: "Dollar"),
                Company(image: "enterprise", name: "Enterprise"),
                Company(image: "firefly", name: "Firefly"),
                Company(image: "fox", name: "Fox Rent a Car"),
                Company(image: "hertz", name: "Hertz"),
                Company(image: "national", name: "National"),
                Company(image: "sixt", name: "Sixt"),
                Company(image: "thrifty", name: "Thrifty")] 

//return sorted array
let companies = unsortedCompanies.sorted { ($0.name, $0.image) < ($1.name, $0.image)}
