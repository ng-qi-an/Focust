//
//  Login.swift
//  Focust
//
//  Created by Ng Qi An on 16/11/23.
//

import SwiftUI

struct SignupUsername: View {
    @Binding var authenticated: Bool;

    @Binding var phoneNo: String;
    @Binding var password: String;
    @Binding var username: String;
    
    enum Field:Hashable {
        case Username
    }
    @FocusState private var focused:Field?
    @State private var error: String = ""
    @State private var errorFree: Bool = false
    @State private var hasError: Array<Field> = []
    @State private var isFocused: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 216/255, green: 255/255, blue:250/255)
                    .ignoresSafeArea(.all)
                VStack {
                    Image("authBg")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: isFocused ? 300 : 350)
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
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        .frame(width: 220, height: 70)
                        .background(.white)
                        .cornerRadius(15)
                        Spacer()
                    }.frame(maxWidth:.infinity, maxHeight: isFocused ? 300 : 350)
                    if isFocused == false {
                        Spacer()
                    } else {
                        HStack {
                            
                        }.frame(height: 50)
                    }
                    VStack(spacing: 10){
                        HStack {
                            Text("Finally, make a unique **Username**")
                                .foregroundColor(.black)
                            Spacer()
                        }.frame(width: 350)
                        HStack {
                            Image(systemName: "at")
                                .padding(.leading, 30)
                                .foregroundColor(.black)
                            TextField("Username", text: $username, prompt: Text("Username").foregroundColor(.gray))
                                .focused($focused, equals: .Username)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .foregroundColor(.black)

                        }
                        .frame(width: 350, height: 50)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        if hasError.contains(Field.Username) {
                            HStack {
                                Text(error)
                                    .foregroundColor(.red)
                                Spacer()
                            }.frame(width: 350)
                        }
                        HStack{}
                        Button {
                                errorFree = false
                                if username.isEmpty {
                                    error = "This field is required"
                                    if hasError.contains(Field.Username) == false {
                                        hasError.append(Field.Username)
                                    }
                                    Haptics.shared.notify(.error)

                                } else if username.count < 3 {
                                    error = "Minimum of 3 characters"
                                    if hasError.contains(Field.Username) == false {
                                        hasError.append(Field.Username)
                                    }
                                    Haptics.shared.notify(.error)

                                } else if username.count > 32 {
                                    error = "Maxmimum of 32 characters"
                                    if hasError.contains(Field.Username) == false {
                                        hasError.append(Field.Username)
                                    }
                                    Haptics.shared.notify(.error)

                                } else {
                                    error = ""
                                    errorFree = true
                                    if hasError.contains(Field.Username) == true {
                                        hasError.remove(at: hasError.firstIndex(of: Field.Username)!)
                                    }
                                    print(phoneNo)
                                    print(password)
                                    print(username)
                                    authenticated = true
                                    Haptics.shared.notify(.success)

                                }
                        } label : {
                            HStack {
                                Text("Register account")
                                    .padding(.leading, 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "paperplane")
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
                .onAppear(){
                    errorFree = false
                }

        }.navigationBarBackButtonHidden(true)
    }
}

struct SignupUsername_Previews: PreviewProvider {
    static var previews: some View {
        SignupUsername(authenticated: .constant(false), phoneNo: .constant("12345678"), password: .constant("12345678"), username: .constant("12345678"))
    }
}
