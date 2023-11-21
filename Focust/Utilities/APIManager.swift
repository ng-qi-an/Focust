//
//  APIManager.swift
//  Focust
//
//  Created by Ng Qi An on 20/11/23.
//

import Foundation
import SwiftUI

let disallowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_")

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
        fdata += "\(key)=\(data[key]!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)&"
    }
    return String(fdata.dropLast())
}

func apiUrl(_ path:String, params: Dictionary<String, String> = [:]) -> URL {
    return URL(string: "\(baseUrl)\(path)\(parameters(params))")!
}


func convertToDictionary(_ text: String) throws -> [String:AnyObject] {
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

func parseData(_ data: Data) throws -> [String: Any]{
    let failed: Dictionary = ["status": "FAILED"]
    do {
        return try convertToDictionary(String(data: data, encoding: .utf8)!)
    } catch {
        return failed
    }
}


struct APIManager {
    
    func isAlive() async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/"))
        return try parseData(data)
    }
}


struct UsersManager {
    func get(token:String) async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/get", params: ["token": token]))
        return try parseData(data)
    }
    func register(password:String, username: String) async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/register", params: ["password": password, "username": username]))
        return try parseData(data)
    }
    func login(username: String, password:String) async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(from: apiUrl("/users/login", params: ["username": username, "password": password]))
        return try parseData(data)
    }
}
