//
//  Settings.swift
//  Focust
//
//  Created by Ng Qi An on 2/12/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var theme: Theme;
    @Binding var goal: Int;
    @Binding var mode: AppearanceMode;
    @Binding var color: AppearanceScheme;
    @Binding var darkMode: Bool;
    @State var goalSelection: String = "1 hour"

    let goals = ["1 hour", "2 hours", "3 hours", "4 hours", "5 hours"]
    let goalMap = [1 * 3600, 2 * 3600, 3 * 3600, 4 * 3600, 5 * 3600]
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Preferences")){
                    HStack {
                        Picker("Personal Goal: ", selection: $goalSelection) {
                            ForEach(goals, id: \.self) {
                                Text($0)
                            }
                        }.onChange(of: goalSelection){ new in
                            let indx = goals.firstIndex(of: new)
                            if indx != nil {
                                goal = goalMap[indx!]
                            }
                        }
                    }
                }
                Section(header: Text("Appearance")) {
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
            }.navigationTitle("Settings")
                .onAppear(){
                    let indx = goalMap.firstIndex(of: goal)
                    if indx != nil {
                        goalSelection = goals[indx!]
                    }
                }
        }
    }
}

#Preview {
    SettingsView(theme: .constant(Theme()), goal: .constant(60), mode: .constant(AppearanceMode.Light), color: .constant(AppearanceScheme.Teal), darkMode: .constant(false))
}
