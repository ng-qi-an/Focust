//
//  MainDisplay.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct MainDisplay: View {
    var body: some View {
        TabView {
            Homescreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Friends()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }
            Statistics()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Stats")
                }
            Account()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Account")
                }
        }
    }
}

#Preview {
    MainDisplay()
}
