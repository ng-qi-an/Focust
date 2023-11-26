//
//  MainDisplay.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI
import SwiftUIIntrospect
struct MainController: View {
    @Binding var authenticated: Bool;
    @Binding var user: User;
    @Binding var today: String;
    @Binding var token: String;
    @Binding var verifyToken: Bool;

    @Binding var darkMode: Bool
    @Binding var mode: AppearanceMode
    @Binding var color: AppearanceScheme
    @Binding var theme: Theme
    @State var startedSession = false
    @State var page: Int = 1

    var body: some View {
        NavigationView {
            TabView(selection: $page) {
                HomescreenView(theme: $theme, page: $page, startedSession: $startedSession, today: $today, token: $token)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                StatisticsView(theme: $theme, token: $token)
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Stats")
                    }
                    .tag(2)
                AccountView(theme: $theme, mode: $mode, color: $color, user: $user, darkMode: $darkMode, verifyToken: $verifyToken, token: $token)
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Account")
                    }
                    .tag(3)
            }
            
            .introspect(.tabView, on: .iOS(.v15, .v16, .v17)){ tabBarController in
                tabBarController.tabBar.isHidden = startedSession
            }
            .preferredColorScheme(darkMode ? .dark : .light)
            .accentColor(theme.color.foreground)
        }
    }
}

struct MainController_Previews: PreviewProvider {
    static var previews: some View {
        MainController(authenticated: .constant(true), user: .constant(User()), today: .constant("0"), token: .constant("epofj23prjrj23"), verifyToken: .constant(false), darkMode: .constant(false), mode: .constant(AppearanceMode.Light), color: .constant(AppearanceScheme.Teal), theme: .constant(Theme()))
    }
}
