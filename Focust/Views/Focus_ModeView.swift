//
//  Focus Mode.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct Focus_ModeView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var theme: Theme;

    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [theme.color.button, theme.color.background], startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.top)
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
                            .foregroundColor(.white)
                            .opacity(0.1)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50)
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .foregroundColor(.white)
                            .opacity(0.1)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50)
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .foregroundColor(.white)
                            .opacity(0.1)
                            .cornerRadius(15)
                        Text("finish cl homework")
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50)
                    Rectangle()
                        .opacity(0)
                        .frame(height: 15)
                    Button {
                        // Add your action when the "add a task" button is tapped
                        // For now, it just prints a message to the console
                        print("Add a task tapped")
                    } label: {
                        Text("add a task")
                            .foregroundColor(.white)
                            .opacity(1)
                    }
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(theme.red.foreground)
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
                    .background(theme.gray.background)
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 10)
                        .foregroundColor(theme.gray.background)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Focus_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeView(theme: .constant(Theme()))
    }
}



