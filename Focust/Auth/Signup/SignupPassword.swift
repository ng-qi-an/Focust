//
//  SignupPassword.swift
//  Focust
//
//  Created by Ng Qi An on 19/11/23.
//

import SwiftUI

struct SignupPassword: View {
    @Binding var authenticated: Bool;
    
    @Binding var password: String;
    @Binding var username: String;
    @State private var passwordConfirm = ""
    @State private var errorFree: Bool = false

    enum Field:Hashable {
        case Password, PasswordConfirm
    }
    
    @FocusState private var focused:Field?
    @State private var isFocused: Bool = false
    @State private var error: String = ""
    @State private var hasError: Array<Field> = []
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
                            Text("**Create an Account**")
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
                            Text("Create a new **Password**")
                                .foregroundColor(.black)
                            Spacer()
                        }.frame(width: 350)
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            SecureField("Password", text: $password, prompt: Text("Password").foregroundColor(.gray))
                                .padding(.leading, 10)
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
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
                        HStack{}
                        HStack {
                            Text("**Confirm** your new Password")
                                .foregroundColor(.black)
                            Spacer()
                        }.frame(width: 350)
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            SecureField("Confirm Password", text: $passwordConfirm, prompt: Text("Confirm your Password").foregroundColor(.gray))
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .foregroundColor(.black)
                                .focused($focused, equals: .PasswordConfirm)
                        }
                        .frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        if hasError.contains(Field.PasswordConfirm) {
                            HStack {
                                Text(error)
                                    .foregroundColor(.red)
                                Spacer()
                            }.frame(width: 350)
                        }
                        HStack{}
                        NavigationLink(destination: SignupUsername(authenticated: $authenticated, password: $password, username: $username), isActive: $errorFree){
                            Button {
                                withAnimation {
                                    errorFree = false
                                    if password.isEmpty {
                                        error = "This field is required"
                                        if hasError.contains(Field.Password) == false {
                                            hasError.append(Field.Password)
                                        }
                                        Haptics.shared.notify(.error)

                                    } else if password.count < 8 {
                                        error = "Minimum of 8 characters"
                                        if hasError.contains(Field.Password) == false {
                                            hasError.append(Field.Password)
                                        }
                                        Haptics.shared.notify(.error)

                                    } else if passwordConfirm != password {
                                        error = "Passwords do not match"
                                        if hasError.contains(Field.Password) == false {
                                            hasError.append(Field.Password)
                                        }
                                        if hasError.contains(Field.PasswordConfirm) == false {
                                            hasError.append(Field.PasswordConfirm)
                                        }
                                        Haptics.shared.notify(.error)

                                    } else {
                                        error = ""
                                        errorFree = true
                                        if hasError.contains(Field.Password) == true {
                                            hasError.remove(at: hasError.firstIndex(of: Field.Password)!)
                                        }
                                        if hasError.contains(Field.PasswordConfirm) == true {
                                            hasError.remove(at: hasError.firstIndex(of: Field.PasswordConfirm)!)
                                        }
                                        Haptics.shared.play(.light)
                                    }
                                }
                            } label : {
                                HStack {
                                    Text("Next")
                                        .padding(.leading, 30)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 30)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 350, height: 60)
                                .background(Color(red: 45/255, green: 212/255, blue: 191/255))
                                .cornerRadius(20)
                                .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                            }
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
                }.onAppear(){
                    errorFree = false
                }

        }.navigationBarBackButtonHidden(true)
    }
}

struct SignupPassword_Previews: PreviewProvider {
    static var previews: some View {
        SignupPassword(authenticated: .constant(false), password: .constant("12345678"), username: .constant("12345678"))
    }
}
