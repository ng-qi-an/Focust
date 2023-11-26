//
//  APIManager.swift
//  Focust
//
//  Created by Ng Qi An on 20/11/23.
//

import Foundation
import SwiftUI
import Alamofire

let disallowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_")

enum StatusCodes {
    case Success, NotFound, ServerError, Forbidden, BadRequest, UnknownError
}

func convertToTime(timestamp: Double) -> String {
    print(timestamp)
    let date = Date(timeIntervalSince1970: timestamp)
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.short
    dateFormatter.timeZone = .current
    return dateFormatter.string(from: date)
}

struct StatusResponse {
    var status: Int
    var data: Dictionary<String, Any>
    var code: StatusCodes
    
}

struct UserData: Codable {
    var status: String
    var data: User
}

struct Stat: Hashable {
    var id: String
    var owner: String
    var breaks: String
    var breakLength: String
    var sessionLength: String
    var date: String
    var month: String
    var created_on: Double
    
    init(dictionary: [String: Any]=[:]) {
        self.id = dictionary["id"] as? String ?? "qbfeibfwf"
        self.owner = dictionary["owner"] as? String ?? "yes"
        self.breaks = dictionary["breaks"] as? String ?? "1"
        self.breakLength = dictionary["breakLength"] as? String ?? "10"
        self.sessionLength = dictionary["sessionLength"] as? String ?? "60"
        self.date = dictionary["date"] as? String ?? "1/1/2024"
        self.month = dictionary["month"] as? String ?? "January 2024"
        self.created_on = Double((dictionary["created_on"] as? Int) ?? 0)

    }
}

struct User: Codable {
    var name: String
    var lower_name: String
    var id: String
    var token: String
    var goal: Int
    init(dictionary: [String: Any]=["name": "John_Doe", "lower_name": "john_doe", "id": "eL64zUDAWd3mLK612En2i504Q5tO9er2tNQc-RwOznU", "goal": 60, "token": "BaJVgTasL_PjwwugBt__9bNGKG0Wz0nLu4pjT6hnc5UlAkjoUKa34y06gYksEeWFXL7-3MrMZqYqAX7MFoHDRg"]) {
        self.name = dictionary["name"] as? String ?? "John_Doe"
        self.id = dictionary["id"] as? String ?? "eL64zUDAWd3mLK612En2i504Q5tO9er2tNQc-RwOznU"
        self.lower_name = dictionary["lower_name"] as? String ?? "john_doe"
        self.goal = dictionary["goal"] as? Int ?? 60
        self.token = dictionary["token"] as? String ?? "BaJVgTasL_PjwwugBt__9bNGKG0Wz0nLu4pjT6hnc5UlAkjoUKa34y06gYksEeWFXL7-3MrMZqYqAX7MFoHDRg"
    }
}


let baseUrl: String = "http://localhost:2087" // "https://api.pop-plays.live:2087"


func parameters(_ data: Dictionary<String, String>) -> String {
    var fdata = "?"
    for key in data.keys {
        fdata += "\(key)=\(data[key]!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)&"
    }
    return String(fdata.dropLast())
}

func apiUrl(_ path:String) -> String {
    return "\(baseUrl)\(path)"
}


func convertToDictionary(_ text: String) -> [String:AnyObject] {
    if let data = text.data(using: .utf8) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
            return json!
        } catch {
            return [:]
        }
    }
    return [:]
}

func parseData(_ data: Data) -> [String: Any]{
    return convertToDictionary(String(data: data, encoding: .utf8)!)
}


struct APIManager {
    func status(_ response: AFDataResponse<Data?>) -> StatusResponse {
        var status = StatusCodes.UnknownError
        var data:Dictionary<String, Any> = [:]
        switch response.response?.statusCode ?? 0 {
        case 200...299:
            status = .Success
            data = parseData(response.data!)
        case 400:
            status = .BadRequest
        case 403:
            status = .Forbidden
        case 404:
            status = .NotFound
        case 500:
            status = .ServerError
        default:
            status = .UnknownError
        }
        return StatusResponse(status: response.response?.statusCode ?? 0,  data: data, code: status)
    }
}




