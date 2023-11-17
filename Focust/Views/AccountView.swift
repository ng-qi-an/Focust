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
            VStack(spacing: 20) {
                Rectangle()
                    .frame(maxWidth: 380, maxHeight: 87)
                    .opacity(0.1)
                    .cornerRadius(10)
                HStack {
                    Text("**Appearance**")
                        .opacity(0.5)
                        .padding(.leading, 40)
                    Spacer()
                }
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
                        }.padding(Edge.Set(arrayLiteral: .trailing, .leading), 60)
                    }
                    //                    if isDarkMode == false {
                    //                        Rectangle()
                    //                            .frame(maxWidth: 60, maxHeight: 200)
                    //                            .foregroundColor(.white)
                    //                            .offset(x: -190)
                    //                        Rectangle()
                    //                            .frame(maxWidth: 60, maxHeight: 200)
                    //                            .foregroundColor(.white)
                    //                            .offset(x: 190)
                    //                    } else {
                    //                        Rectangle()
                    //                            .frame(maxWidth: 60, maxHeight: 200)
                    //                            .foregroundColor(.black)
                    //                            .offset(x: -190)
                    //                        Rectangle()
                    //                            .frame(maxWidth: 60, maxHeight: 200)
                    //                            .foregroundColor(.black)
                    //                            .offset(x: 190)
                    //                    }
                }
                ZStack {
                    Rectangle()
                        .frame(maxWidth: 380, maxHeight: 50)
                        .opacity(0.1)
                        .cornerRadius(10)
                    HStack {
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode")
                                .font(.system(size: 17))
                        }
                    }
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                }
                Spacer()
            }
                
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
