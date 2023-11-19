//
//  Focus Mode.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct Focus_ModeView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var darkMode: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                if darkMode == false {
                    LinearGradient(colors: [Color(red: 45/255, green: 212/255, blue: 191/255), Color(red: 0/255, green: 157/255, blue: 221/255)], startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.top)
                } else {
                    LinearGradient(colors: [Color(red: 17/255, green: 94/255, blue: 89/255), Color(red: 0/255, green: 0/255, blue: 0/255), Color(red: 0/255, green: 0/255, blue: 0/255)], startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.top)
                }
                VStack {
                    Image("triangles")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 191)
                    Spacer()
                }
                VStack {
                    Spacer()
                    VStack {
                        Text("**2 : 20**")
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                        HStack {
                            Text("hr")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .padding(.trailing, 70)
                            Text("minutes")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 270, height: 60)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.black)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .background(.white)
                            .opacity(0.1)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50)
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .background(.white)
                            .opacity(0.1)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50)
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .background(.white)
                            .opacity(0.1)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50)
                    Rectangle()
                        .opacity(0)
                        .frame(height: 15)
                    Text("add a task")
                        .foregroundColor(.white)
                        .opacity(0.7)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(darkMode ? Color(red: 127/255, green: 29/255, blue: 29/255) : Color(red: 239/255, green: 68/255, blue: 86/255))
                                .cornerRadius(20)
                            Image(systemName: "square.fill")
                                .resizable()
                                .frame(width: 25, height: 26)
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "leaf")
                        Text("saver mode")
                    }
                    .frame(width: 155, height: 32)
                    .background(darkMode ? .black : .white)
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 10)
                        .foregroundColor(darkMode ? .black : .white)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Focus_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeView(darkMode: .constant(false))
    }
}
