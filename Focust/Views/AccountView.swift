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
            List {
                NavigationLink(destination: Text("hi")) {
                    HStack (spacing: 20) {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(theme.color.background)
                        VStack (alignment: .leading) {
                            Text("@John_Doe")
                                .font(.title3)
                            Text("Account settings")
                        }
                        Spacer()
                    }
                }
                Section() {
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
                        .frame(height: 190)
                    }
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
