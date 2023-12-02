//
//  ContentView.swift
//  Focust
//
//  Created by Ng Qi An on 12/11/23.
//

import SwiftUI
import AlertToast
import Alamofire

struct ContentView: View {
    @AppStorage("Today") var today: Int = 0
    @AppStorage("Goal") var goal: Int = 3600
    @AppStorage("TodayDate") var todayDate: String = ""
    @State var sessions: Array<Session> = []
    @State var user:User = User()
    @State var authenticated = false
    @State var enabled = false
    @State var hasError = false
    @State var verifyToken = false
    @AppStorage("darkMode") var darkMode = true
    @AppStorage("AppearanceMode") var mode: AppearanceMode = AppearanceMode.Light
    @AppStorage("AppearanceScheme") var color: AppearanceScheme = AppearanceScheme.Teal
    @State var theme = Theme()
    let apiManager = APIManager()
    
    var body: some View {
        VStack {
            MainController(today: $today, goal: $goal, todayDate: $todayDate, sessions: $sessions, darkMode: $darkMode, mode: $mode, color: $color, theme: $theme)
                .preferredColorScheme(theme.mode == AppearanceMode.Dark ? .dark : .light)
        }.onAppear(){
            if darkMode == true {
                mode = AppearanceMode.Dark
            }
            theme = Theme(mode: mode, scheme: color)
            let date = checkDate(date: todayDate)
            if date != "VALID" {
                todayDate = date
            }
            sessions = getSessions()
            print(sessions)
        }.onChange(of: mode) { new in
            theme = Theme(mode: new, scheme: color)
        }
        .onChange(of: color) { new in
            theme = Theme(mode: mode, scheme: new)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
