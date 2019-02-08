import UIKit

struct Booking
{
    let id: String
    let confirmationCode: String
    let date: String
    let time: String
    let endDate: String
    let endTime: String
    let airport: String
    let airportCity: String
    let airportImage: String
    let airline: String
    let airlineImage: String
    let company: String
    let companyImage: String
    let price: String
    let customerName: String
}

//let bookings = [Booking(confirmationCode: "8hfyv4i", date: "January 19, 2019", time: "2:30 PM", airport: "JFK International Airport", airportCity: "New York, NY", airportImage: "DMEMoscowRussia", airline: "Delta", airlineImage: "DL", company: "Budget", companyImage: "budget", price: "$25", customerName: "John Smith"),
               // Booking(confirmationCode: "3h5gv8r", date: "January 29, 2019", time: "22:55 PM", airport: "LaGuardia Airport", airportCity: "Queens, NY", airportImage: "DMEMoscowRussia", airline: "American", airlineImage: "AA", company: "Avis", companyImage: "avis", price: "$25", customerName: "Jen Smith")]

var bookings = [Booking]()
