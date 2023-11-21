//
//  MainDisplay.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct MainController: View {
    @Binding var authenticated: Bool;
    @State var darkMode = true
    @State var mode = AppearanceMode.Light
    @State var color = AppearanceScheme.Teal
    @State var page: Int = 1
    @State var theme = Theme()
    @State var startedSession = false

    var body: some View {
        NavigationView {
            TabView(selection: $page) {
                HomescreenView(theme: $theme, page: $page, startedSession: $startedSession)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                FriendsView(theme: $theme)
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Friends")
                    }
                    .tag(2)
                StatisticsView(theme: $theme)
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Stats")
                    }
                    .tag(3)
                AccountView(theme: $theme, mode: $mode, color: $color, darkMode: $darkMode)
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Account")
                    }
                    .tag(4)
            }
            .onChange(of: mode) { new in
                theme = Theme(mode: new, scheme: color)
            }
            .onChange(of: color) { new in
                theme = Theme(mode: mode, scheme: new)
            }
            .onAppear(){
                // Sets the default / user created theme
                if darkMode == true {
                    mode = AppearanceMode.Dark
                }
                theme = Theme(mode: mode, scheme: color)
            }
            .preferredColorScheme(darkMode ? .dark : .light)
            .accentColor(theme.color.foreground)
        }
    }
}

struct MainController_Previews: PreviewProvider {
    static var previews: some View {
        MainController(authenticated: .constant(true))
    }
}
