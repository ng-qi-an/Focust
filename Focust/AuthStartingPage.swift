//
//  AuthStartingPage.swift
//  Focust
//
//  Created by Ethan Chow on 16/11/23.
//

import SwiftUI

struct AuthStartingPage: View {
    var body: some View {
        ZStack {
            Color(red: 216/255, green: 255/255, blue:250/255)
                .ignoresSafeArea(.all)
            Image("startPageBg")
                .resizable()
                .frame(width: 394, height: 456)
                .offset(y: 185)
            VStack(spacing: 20){
                VStack(spacing: 5) {
                    Image("placeholderIcon")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .offset(y: -30)
                    Text("**Start you focus journey with us**")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 102/255, green: 100/255, blue: 100/255))
                    Text("**TODAY!**")
                        .font(.system(size: 40))
                        .foregroundColor(Color(red: 45/255, green: 212/255, blue: 191/255))
                }.offset(y: -125)
                
                Button {
                    
                } label : {
                    HStack {
                        Text("Sign Up")
                        Image(systemName: "person.crop.circle.badge.plus")
                            .padding(.leading, 150)
                    }
                    .frame(width: 315, height: 50)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                }
                Button {
                    
                } label : {
                    HStack {
                        Text("Log In ")
                        Image(systemName: "key")
                            .padding(.leading, 150)
                    }
                    .frame(width: 315, height: 50)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                }
            }
        }
    }
}

#Preview {
    AuthStartingPage()
}
