//
//  MainDisplay.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct MainController: View {
    
    @State var darkMode = false
    @State var page: Int = 1
    
    var body: some View {
        TabView(selection: $page) {
            HomescreenView(darkMode: $darkMode, page: $page)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }
                .tag(2)
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Stats")
                }
                .tag(3)
            AccountView(darkMode: $darkMode)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Account")
                }
                .tag(4)
        }
        .accentColor(Color(red: 45/255, green: 212/255, blue: 191/255))
    }
}

struct MainController_Previews: PreviewProvider {
    static var previews: some View {
        MainController()
    }
}
