//
//  MainDisplay.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct MainController: View {
    @State var darkMode = false
    var body: some View {
        TabView {
            HomescreenView(darkMode: $darkMode)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Stats")
                }
            AccountView(darkMode: $darkMode)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Account")
                }
            Focus_ModeView()
                .tabItem {
                    Image(systemName: "dollarsign")
                    Text("@money")
                }
        }
        .accentColor(Color(red: 45/255, green: 212/255, blue: 191/255))
    }
}

struct MainController_Previews: PreviewProvider {
    static var previews: some View {
        MainController()
    }
}
