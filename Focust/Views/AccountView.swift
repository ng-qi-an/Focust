//
//  Account.swift
//  Focust
//
//  Created by Ethan Chow on 14/11/23.
//

import SwiftUI

struct AccountView: View {
    @State var isDarkMode = false
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(maxWidth: 350, maxHeight: 87)
                    .opacity(0.1)
                    .cornerRadius(10)
                    .offset(y: 15)
                Text("**Appearance**")
                    .opacity(0.5)
                    .offset(x: -130, y: 25)
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            Image("blueTheme")
                                .resizable()
                                .frame(width: 70, height: 150)
                                .aspectRatio(contentMode: .fit)
                            Image("greenTheme")
                                .resizable()
                                .frame(width: 70, height: 150)
                                .aspectRatio(contentMode: .fit)
                            Image("yellowTheme")
                                .resizable()
                                .frame(width: 70, height: 150)
                                .aspectRatio(contentMode: .fit)
                            Image("orangeTheme")
                                .resizable()
                                .frame(width: 70, height: 150)
                                .aspectRatio(contentMode: .fit)
                            Image("redTheme")
                                .resizable()
                                .frame(width: 70, height: 150)
                                .aspectRatio(contentMode: .fit)
                            Image("purpledTheme")
                                .resizable()
                                .frame(width: 70, height: 150)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    if isDarkMode == false {
                        Rectangle()
                            .frame(maxWidth: 60, maxHeight: 200)
                            .foregroundColor(.white)
                            .offset(x: -190)
                        Rectangle()
                            .frame(maxWidth: 60, maxHeight: 200)
                            .foregroundColor(.white)
                            .offset(x: 190)
                    } else {
                        Rectangle()
                            .frame(maxWidth: 60, maxHeight: 200)
                            .foregroundColor(.black)
                            .offset(x: -180)
                        Rectangle()
                            .frame(maxWidth: 60, maxHeight: 200)
                            .foregroundColor(.black)
                            .offset(x: 180)
                    }
                }.offset(y: 35)
                ZStack {
                    Rectangle()
                        .frame(maxWidth: 370, maxHeight: 44)
                        .opacity(0.1)
                        .cornerRadius(10)
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                            .font(.system(size: 17))
                            .offset(x: 80)
                    } .offset(x: -40)
                }.offset(y: 67)
            }.offset(y: -130)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
