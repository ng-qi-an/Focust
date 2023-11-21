//
//  Login.swift
//  Focust
//
//  Created by Ethan Chow on 16/11/23.
//

import SwiftUI
import AlertToast

struct LoginView: View {
    let users = UsersManager()

    @Binding var authenticated: Bool;
    @Binding var username: String;
    @Binding var password: String;
    @State var loading: Bool = false
    
    enum Field:Hashable {
        case Username, Password
    }
    
    @FocusState private var focused:Field?
    @State private var isFocused: Bool = false
    @State private var error: String = ""
    @State private var errorFree: Bool = false
    @State private var hasError: Array<Field> = []
    
    @State private var apiError = false
    @State private var apiErrorMessage = ""

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
                        if loading == false {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.backward")
                                    .offset(x: 0, y: 0)
                                    .font(.system(size: 25))
                                    .foregroundColor(.black)
                            }
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
                            Image(systemName: "at")
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            TextField("Username", text: $username, prompt: Text("Username").foregroundColor(.gray))
                                .foregroundColor(.black)
                                .focused($focused, equals: .Username)
                                .keyboardType(.numberPad)
                                .padding(.leading, 10)
                                .onChange(of: username) { newValue in
                                    if newValue.count > 8 {
                                        username = String(newValue.prefix(8))
                                    }
                                }
                                .disabled(loading)
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
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            SecureField("Password", text: $password, prompt: Text("Password").foregroundColor(.gray))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                                .focused($focused, equals: .Password)
                                .disabled(loading)

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
                            Task {
                                errorFree = false
                                if loading {
                                    // Do nothing
                                } else if username.isEmpty {
                                    error = "This field is required"
                                    if hasError.contains(Field.Username) == false {
                                        hasError.append(Field.Username)
                                    }
                                    Haptics.shared.notify(.error)
                                } else if username.count < 3 {
                                    error = "Invalid username"
                                    if hasError.contains(Field.Username) == false {
                                        hasError.append(Field.Username)
                                    }
                                    Haptics.shared.notify(.error)
                                } else if password.isEmpty {
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
                                }  else {
                                    error = ""
                                    errorFree = true
                                    if hasError.contains(Field.Username) == true {
                                        hasError.remove(at: hasError.firstIndex(of: Field.Username)!)
                                    }
                                    if hasError.contains(Field.Password) == true {
                                        hasError.remove(at: hasError.firstIndex(of: Field.Password)!)
                                    }
                                    do {
                                        loading = true
                                        let result = try await users.login(username: username, password: password)
                                        if result["status"] as! String == "OK" {
                                            Haptics.shared.notify(.success)
                                            authenticated = true
                                        } else if result["status"] as! String == "INVALID" {
                                            loading = false
                                            apiErrorMessage = "No account exists with those credentials"
                                            apiError = true
                                            Haptics.shared.notify(.error)
                                        }
                                    } catch {
                                        loading = false
                                        print(String(describing: error))
                                        apiErrorMessage = "UNKNOWN ERROR"
                                        apiError = true
                                        Haptics.shared.notify(.error)
                                    }
                                }
                            }
                        } label : {
                            HStack {
                                if loading{
                                    ProgressView()
                                } else {
                                    Text("Login")
                                        .padding(.leading, 30)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "paperplane.fill")
                                        .padding(.trailing, 30)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 350, height: 60)
                            .background(Color(red: 45/255, green: 212/255, blue: 191/255))
                            .cornerRadius(20)
                            .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                        }.disabled(loading)
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
                .toast(isPresenting: $apiError){
                    AlertToast(displayMode: .hud, type: .error(Color.red), title: "Request Failed", subTitle: apiErrorMessage)
                }

        }.navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticated: .constant(false), username: .constant("john_doe"), password: .constant("12345678"))
    }
}
