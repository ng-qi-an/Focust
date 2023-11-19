//
//  Login.swift
//  Focust
//
//  Created by Ethan Chow on 16/11/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var authenticated: Bool;

    @State private var phoneNo = ""
    
    enum Field:Hashable {
        case PhoneNumber, Password
    }
    
    @FocusState private var focused:Field?
    @State private var isFocused: Bool = false
    @State private var error: String = ""
    @State private var errorFree: Bool = false
    @State private var hasError: Array<Field> = []
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
                        .frame(maxWidth: .infinity, maxHeight: isFocused ? 250 : 350)
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
                                .foregroundColor(.black)
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
                            Text("**Login**")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                        }
                        .frame(width: 220, height: 70)
                        .background(.white)
                        .cornerRadius(15)
                        Spacer()
                    }.frame(maxWidth:.infinity, maxHeight: isFocused ? 250 : 350)
                    if isFocused == false {
                        Spacer()
                    } else {
                        HStack {
                            
                        }.frame(height: 25)
                    }
                    VStack(spacing: 10){
                        HStack {
                            Image(systemName: "phone")
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            TextField("Phone Number", text: $phoneNo, prompt: Text("Phone Number").foregroundColor(.gray))
                                .foregroundColor(.black)
                                .focused($focused, equals: .PhoneNumber)
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
                        if hasError.contains(Field.PhoneNumber) {
                            HStack {
                                Text(error)
                                    .foregroundColor(.red)
                                Spacer()
                            }.frame(width: 350)
                        }
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            SecureField("Password", text: $password, prompt: Text("Password").foregroundColor(.gray))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                                .focused($focused, equals: .Password)

                        }
                        .frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        if hasError.contains(Field.Password) {
                            HStack {
                                Text(error)
                                    .foregroundColor(.red)
                                Spacer()
                            }.frame(width: 350)
                        }
                        HStack {}
                        Button {
                            errorFree = false
                            if phoneNo.isEmpty {
                                error = "This field is required"
                                if hasError.contains(Field.PhoneNumber) == false {
                                    hasError.append(Field.PhoneNumber)
                                }
                                Haptics.shared.notify(.error)
                            } else if phoneNo.count < 8 {
                                error = "Not a valid SG phone number"
                                if hasError.contains(Field.PhoneNumber) == false {
                                    hasError.append(Field.PhoneNumber)
                                }
                                Haptics.shared.notify(.error)
                            } else if password.isEmpty {
                                error = "This field is required"
                                if hasError.contains(Field.Password) == false {
                                    hasError.append(Field.Password)
                                }
                                Haptics.shared.notify(.error)
                            } else if password.count != 8 {
                                error = "Minimum of 8 characters"
                                if hasError.contains(Field.Password) == false {
                                    hasError.append(Field.Password)
                                }
                                Haptics.shared.notify(.error)
                            }  else {
                                error = ""
                                errorFree = true
                                if hasError.contains(Field.PhoneNumber) == true {
                                    hasError.remove(at: hasError.firstIndex(of: Field.PhoneNumber)!)
                                }
                                if hasError.contains(Field.Password) == true {
                                    hasError.remove(at: hasError.firstIndex(of: Field.Password)!)
                                }
                                authenticated = true
                                Haptics.shared.notify(.success)
                            }
                        } label : {
                            HStack {
                                Text("Login")
                                    .padding(.leading, 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "paperplane.fill")
                                    .padding(.trailing, 30)
                                    .foregroundColor(.black)
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
                .onChange(of: focused) { value in
                    withAnimation {
                        if (value != nil){
                            isFocused = true
                        } else {
                            isFocused = false
                        }
                    }
                }

        }.navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticated: .constant(false))
    }
}
