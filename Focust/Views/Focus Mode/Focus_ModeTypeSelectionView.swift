//
//  Focus_ModeTypeSelectionView.swift
//  Focust
//
//  Created by Ethan Chow on 20/11/23.
//

import SwiftUI

struct Focus_ModeTypeSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var theme: Theme
    @Binding var startedSession: Bool
    @Binding var pomodoroSelection: Bool
    @State var focusLength = 0
    @State var breakLength = 0
    @State var longBreakLength = 0
    @State var pomo = false
    @State var flexible = true
    @State var focusOptions = ["25mins", "35mins", "45mins", "55min"]
    @State var breakOptions = ["5mins", "10mins", "15mins", "20min"]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [theme.color.button, theme.color.background], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("triangles")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 191)
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("**0  :  00**")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                    HStack {
                        Text("hr")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(.leading, 125)
                            .padding(.bottom, 50)
                        Spacer()
                        Text("minutes")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(.trailing, 121)
                            .padding(.bottom, 50)
                    }
                    if pomo == false {
                        Text("**Choose a focus type**")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        Button {
                            flexible = true
                        } label: {
                            ZStack {
                                Color(.white)
                                    .frame(maxWidth: 330, maxHeight: 165)
                                    .opacity(flexible ? 1 : 0.2)
                                    .cornerRadius(10)
                                VStack {
                                    Text("Flexible")
                                        .font(.system(size: 25))
                                        .foregroundColor(flexible ? .black : .white)
                                        .padding(10)
                                    Text("Choose when to take a break on a non fixed \n schedule. Allows for more unstructured \n sessions.")
                                        .font(.system(size: 15))
                                        .padding(.trailing, 10)
                                        .foregroundColor(flexible ? .black : .white)
                                }
                            }
                        }
                        Button {
                            flexible = false
                        } label: {
                            ZStack {
                                Color(.white)
                                    .frame(maxWidth: 330, maxHeight: 165)
                                    .opacity(flexible == false ? 1 : 0.2)
                                    .cornerRadius(10)
                                VStack {
                                    Text("Pomodoro")
                                        .font(.system(size: 25))
                                        .foregroundColor(flexible == false ? .black : .white)
                                        .padding(10)
                                    Text("Fixed breaks and focus duration. Follows a \n strict schedule to ensure good time \n management.")
                                        .font(.system(size: 15))
                                        .padding(.trailing, 10)
                                        .foregroundColor(flexible == false ? .black : .white)
                                }
                            }
                        }
                        Spacer()
                    } else {
                        Text("**Configure Pomodoro**")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                        VStack {
                            HStack {
                                Text("**Focus length**")
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .font(.system(size: 23))
                                    .padding(.top, 50)
                                    .padding(.leading, 40)
                                Spacer()
                            }
                            HStack(spacing: 10) {
                                ForEach(Array(focusOptions.enumerated()), id: \.element) { index, focus in
                                    Button {
                                        focusLength = index
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 80, height: 35)
                                                .opacity(focusLength == index ? 1 :  0)
                                                .foregroundColor(.white)    
                                                .cornerRadius(10)
                                            HStack {
                                                if focusLength != index && index != 0 {
                                                    Rectangle()
                                                        .frame(width: 1, height: 35)
                                                        .padding(.trailing, 10)
                                                        .foregroundColor(theme.gray.surface1)
                                                }
                                                Text(focus)
                                                    .foregroundColor(focusLength == index ? theme.color.foreground : .white)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        VStack {
                            HStack {
                                Text("**Break length**")
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .font(.system(size: 23))
                                    .padding(.top, 50)
                                    .padding(.leading, 40)
                                Spacer()
                            }
                            HStack {
                                ForEach(Array(breakOptions.enumerated()), id: \.element) { index, breaks in
                                    Button {
                                        breakLength = index
                                    } label: {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 80, height: 35)
                                                    .opacity(breakLength == index ? 1 :  0)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                                HStack {
                                                    if breakLength != index && index != 0 {
                                                        Rectangle()
                                                            .frame(width: 1, height: 35)
                                                            .padding(.trailing, 10)
                                                            .foregroundColor(theme.gray.surface1)
                                                    }
                                                    Text(breaks)
                                                        .foregroundColor(breakLength == index ? theme.color.foreground : .white)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        Spacer()
                        Button {
                            pomo = false
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(maxWidth: 350, maxHeight: 50)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .cornerRadius(10)
                                Text("Back")
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    HStack {
                        if flexible {
                            NavigationLink {
                                Focus_ModeView(theme: $theme, startedSession: $startedSession, focusLength: $focusLength, breakLength: $breakLength, longBreakLength: $longBreakLength, pomo: $pomo, focusOptions: $focusOptions, breakOptions: $breakOptions)
                            } label: {
                                VStack {
                                    Text("Start Session")
                                        .foregroundColor(theme.color.foreground)
                                }
                                .frame(maxWidth: 350, maxHeight: 50)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.bottom, 20)
                                
                            }
                        } else {
                            if pomo == false {
                                Button {
                                    pomo = true
                                } label: {
                                    VStack {
                                        Text("Next")
                                            .foregroundColor(theme.color.foreground)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 20)
                                }
                            } else {
                                NavigationLink {
                                    Focus_ModeView(theme: $theme, startedSession: $startedSession, focusLength: $focusLength, breakLength: $breakLength, longBreakLength: $longBreakLength, pomo: $pomo, focusOptions: $focusOptions, breakOptions: $breakOptions)
                                } label: {
                                    VStack {
                                        Text("Next")
                                            .foregroundColor(theme.color.foreground)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                    }
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .onAppear(){
                        if startedSession == true {
                            startedSession = false
                            dismiss()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(startedSession)
    }
}

struct Focus_ModeTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeTypeSelectionView(theme: .constant(Theme()), startedSession: .constant(false), pomodoroSelection: .constant(false))
    }
}

