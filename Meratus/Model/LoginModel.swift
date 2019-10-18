import Foundation
import Alamofire

// MARK: - LoginModel
struct LoginModel: Codable {
    let uname, firstname, lastname, cust: String
    let custname, status, loginModelDESCRIPTION, lokasi: String
    let mcareContact: String
    let urlPp: String
    let email, errstatus, phone, pinrequired: String
    let statuspin, lvl, asCS, token: String
    
    enum CodingKeys: String, CodingKey {
        case uname = "UNAME"
        case firstname = "FIRSTNAME"
        case lastname = "LASTNAME"
        case cust = "CUST"
        case custname = "CUSTNAME"
        case status = "STATUS"
        case loginModelDESCRIPTION = "DESCRIPTION"
        case lokasi = "LOKASI"
        case mcareContact = "MCARE_CONTACT"
        case urlPp = "URL_PP"
        case email = "EMAIL"
        case errstatus = "ERRSTATUS"
        case phone = "PHONE"
        case pinrequired = "PINREQUIRED"
        case statuspin = "STATUSPIN"
        case lvl = "LVL"
        case asCS = "AS_CS"
        case token = "TOKEN"
    }
}
