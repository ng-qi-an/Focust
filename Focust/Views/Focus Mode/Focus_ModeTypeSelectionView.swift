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
    @State private var flexible = true
    
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
                    HStack {
                        if flexible {
                            NavigationLink {
                                Focus_ModeView(theme: $theme, startedSession: $startedSession)
                            } label: {
                                VStack {
                                    Text("Start Session")
                                        .foregroundColor(theme.color.foreground)
                                }
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.bottom, 20)
                            }
                        } else {
                            NavigationLink {
                                Focus_PomoView(theme: $theme)
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
        }.navigationBarBackButtonHidden(startedSession)
    }
}

struct Focus_ModeTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeTypeSelectionView(theme: .constant(Theme()), startedSession: .constant(false))
    }
}
