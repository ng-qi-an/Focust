//
//  Account.swift
//  Focust
//
//  Created by Ethan Chow on 14/11/23.
//

import SwiftUI

struct AccountView: View {
    @Binding var theme: Theme;
    @Binding var mode: AppearanceMode;
    @Binding var color: AppearanceScheme;

    @Binding var darkMode: Bool;
    
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
                        HStack(spacing: 20) {
                            Button {
                                withAnimation {
                                    color = AppearanceScheme.Blue
                                }
                            } label: {
                                Image("blueTheme")
                                    .resizable()
                                    .frame(width: 70, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(color == AppearanceScheme.Blue ? 1.2 : 1)
                            }
                            Button {
                                withAnimation {
                                    color = AppearanceScheme.Teal
                                }
                            } label: {
                                Image("tealTheme")
                                    .resizable()
                                    .frame(width: 70, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(color == AppearanceScheme.Teal ? 1.2 : 1)
                            }
                            Button {
                                withAnimation {
                                    color = AppearanceScheme.Yellow
                                }
                            } label: {
                                Image("yellowTheme")
                                    .resizable()
                                    .frame(width: 70, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(color == AppearanceScheme.Yellow ? 1.2 : 1)
                            }
                            Button {
                                withAnimation {
                                    color = AppearanceScheme.Orange
                                }
                            } label: {
                                Image("orangeTheme")
                                    .resizable()
                                    .frame(width: 70, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(color == AppearanceScheme.Orange ? 1.2 : 1)
                            }
                            Button {
                                withAnimation {
                                    color = AppearanceScheme.Red
                                }
                            } label: {
                                Image("redTheme")
                                    .resizable()
                                    .frame(width: 70, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(color == AppearanceScheme.Red ? 1.2 : 1)
                            }
                            Button {
                                withAnimation {
                                    color = AppearanceScheme.Purple
                                }
                            } label: {
                                Image("purpleTheme")
                                    .resizable()
                                    .frame(width: 70, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(color == AppearanceScheme.Purple ? 1.2 : 1)
                            }
                        }
                        .frame(maxHeight: 190)
                        .padding(Edge.Set(arrayLiteral: .trailing, .leading), 60)
                    }
                    //                    if darkMode == false {
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
                        Toggle(isOn: $darkMode) {
                            Text("Dark Mode")
                                .font(.system(size: 17))
                        }.onChange(of: darkMode) { new in
                            if new == true {
                                mode = AppearanceMode.Dark
                            } else {
                                mode = AppearanceMode.Light
                            }
                        }
                    }
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                }
                Spacer()
            }
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(theme: .constant(Theme()), mode: .constant(AppearanceMode.Light), color: .constant(AppearanceScheme.Teal), darkMode: .constant(false))
    }
}
