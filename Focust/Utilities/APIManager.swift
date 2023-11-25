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
    init(dictionary: [String: Any]=[:]) {
        self.id = dictionary["id"] as? String ?? "qbfeibfwf"
        self.owner = dictionary["owner"] as? String ?? "yes"
        self.breaks = dictionary["breaks"] as? String ?? "1"
        self.breakLength = dictionary["breakLength"] as? String ?? "10"
        self.sessionLength = dictionary["sessionLength"] as? String ?? "60"
    }
}

struct User: Codable {
    var name: String
    var id: String
    var token: String
    init(dictionary: [String: Any]=["name": "John Doe", "id": "1234567890", "token": "1234567896543456789"]) {
        self.name = dictionary["name"] as? String ?? "John Doe"
        self.id = dictionary["id"] as? String ?? "1234567890"
        self.token = dictionary["token"] as? String ?? "1234567890"
    }
}


let baseUrl: String = "http://172.16.102.159:2087"


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
//    func isAlive() async throws -> [String: Any] {
//        let (data, _) = try await URLSession.shared.data(from: apiUrl("/"))
//        return try parseData(data)
//    }
}


struct UsersManager {
//    func get(token:String) async throws -> [String: Any] {
//        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/get", params: ["token": token]))
//        return try parseData(data)
//    }
//    func register(password:String, username: String) async throws -> [String: Any] {
//        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/register", params: ["password": password, "username": username]))
//        return try parseData(data)
//    }
//    func login(username: String, password:String) async throws -> [String: Any] {
//        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/login", params: ["username": username, "password": password]))
//        return try parseData(data)
//    }
//    func retrieve(token:String) async throws -> [String: Any] {
//        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/verify", params: ["token": token]))
//        return try parseData(data)
//    }
}

