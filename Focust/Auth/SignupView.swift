//
//  Login.swift
//  Focust
//
//  Created by Ethan Chow on 16/11/23.
//

import SwiftUI
import Combine

struct SignupView: View {
    @State private var phoneNo = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 216/255, green: 255/255, blue:250/255)
                    .ignoresSafeArea(.all)
                VStack {
                    Image("authBg")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 350)
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Button {
                            print("hi")
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .offset(x: 0, y: 0)
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    Spacer()
                }.padding(.leading, 50)
                    .padding(.top, 100)
                VStack {
                    VStack {
                        Spacer()
                        HStack {
                            Text("**Signup**")
                                .font(.system(size: 20))
                        }
                        .frame(width: 220, height: 70)
                        .background(.white)
                        .cornerRadius(15)
                        Spacer()
                    }.frame(maxWidth: .infinity, maxHeight: 350)
                    Spacer()
                    VStack(spacing: 20){
                        HStack {
                            Image(systemName: "phone")
                                .padding(.leading, 30)
                            TextField("Phone Number", text: $phoneNo)
                                .keyboardType(.numberPad)
                                .padding(.leading, 10)
                                .onChange(of: phoneNo) { newValue in
                                    if newValue.count > 8 {
                                        phoneNo = String(newValue.prefix(8))
                                    }
                                }
                        }
                        .frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        HStack {
                            Image(systemName: "lock")
                                .padding(.leading, 30)
                            SecureField("Password", text: $password)
                                .padding(.leading, 10)
                        }
                        .frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        Button {
                            
                        } label : {
                            HStack {
                                Text("Login")
                                    .padding(.leading, 30)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "paperplane.fill")
                                    .padding(.trailing, 30)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 350, height: 60)
                            .background(Color(red: 45/255, green: 212/255, blue: 191/255))
                            .cornerRadius(20)
                            .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        }
                    }
                    Spacer()
                }
            }.ignoresSafeArea(.all)
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
