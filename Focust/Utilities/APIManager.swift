//
//  APIManager.swift
//  Focust
//
//  Created by Ng Qi An on 20/11/23.
//

import Foundation
import SwiftUI

struct BaseData: Codable {
    var status: String
}

struct UserData: Codable {
    var status: String
    var data: User
}

struct User: Codable {
    var name: String
    var id: String
    var phoneNumber: String
}
let baseUrl: String = "http://localhost:2087"


func parameters(_ data: Dictionary<String, String>) -> String {
    var fdata = "?"
    for key in data.keys {
        fdata += "\(data[key]!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)&"
    }
    return String(fdata.dropLast())
}

func apiUrl(_ path:String, params: Dictionary<String, String> = [:]) -> URL {
    return URL(string: "\(baseUrl)\(path)\(parameters(params))")!
}


func convertToDictionary(_ text: String) throws -> [String:AnyObject]? {
   if let data = text.data(using: .utf8) {
       do {
           let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
           return json
       } catch {
           return nil
       }
   }
   return nil
}

func parseData(_ data: Data) -> [String: Any]{
    let failed: Dictionary = ["status": "FAILED"]
    do {
        return try convertToDictionary(String(data: data, encoding: .utf8)!)!
    } catch {
        return failed
    }
}


struct APIManager {
    
    func isAlive() async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/"))
        return parseData(data)
    }
}


struct UsersManager {
    func get(token:String) async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/get?token=\(token)"))
        return parseData(data)
    }
    func register(phoneNumber: String, password:String, username: String) async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/register", params: ["phone": phoneNumber, "password": password, "username": username]))
        return parseData(data)
    }
}
