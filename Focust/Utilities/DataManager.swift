//
//  DataManager.swift
//  Focust
//
//  Created by Ng Qi An on 2/12/23.
//

import Foundation
import SwiftUI

struct Session: Codable, Hashable {
    var id: UUID = UUID()
    var breaks: Int = 1
    var breakLength: Int = 20 * 60
    var sessionLength: Int = 3600
    var date: Date = Date()
}

func getURL() -> URL {
    guard let plistURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Sessions.plist") else {
        fatalError("Unable to get URL for plist file")
    }
    return plistURL
}

func saveSessions(_ data: Array<Session>) {
    do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(data)
        let plistURL = getURL()
        try data.write(to: plistURL)
    } catch {
        print("Error: \(error)")
    }
}

func getSessions() -> [Session] {
    do {
        let plistURL = getURL()
        let data = try Data(contentsOf: plistURL)
        let decoder = PropertyListDecoder()
        let people = try decoder.decode([Session].self, from: data)
        return people
    } catch {
        print("Error: \(error)")
    }
    return []
}

func checkDate(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy" // Define your desired date format
    let todayDate = dateFormatter.string(from: Date())
    if todayDate == date {
        return "VALID"
    } else {
        return todayDate
    }
}

func parseDate(date: Date, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.timeZone = TimeZone.current
    return dateFormatter.string(from: date)
}
