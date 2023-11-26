//
//  AccountDetailsView.swift
//  Focust
//
//  Created by Ng Qi An on 22/11/23.
//

import SwiftUI
import Alamofire
import AlertToast

struct AccountDetailsView: View {
    let apiManager = APIManager()
    @Binding var user: User;
    @Binding var theme: Theme;
    @Binding var verifyToken: Bool;
    @Binding var token: String;
    @State var name: String = ""
    @State var goal: String = "1 hour"
    @State var oldPassword: String = ""
    @State var newPassword: String = ""
    @State var loading = false
    @State var passwordReset: Bool = false
    @State var deleteConfirm: Bool = false
    @State var deletePasswordConfirmation: String = ""
    @State var confirmLogout: Bool = false
    @State private var apiError = false
    @State private var apiErrorMessage = ""
    @State private var resetPasswordError = ""
    @State private var deleteAccountError = ""

    let goals = ["1 hour", "1.5 hours", "2 hours", "2.5 hours", "3 hours"]
    let goalMap = [60, 90, 120, 150, 180]
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Information")) {
                        HStack {
                            Text("Username: ")
                            Spacer()
                            TextField("", text: $name)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Picker("Personal Goal: ", selection: $goal) {
                                ForEach(goals, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                    }
                    Section() {
                        Button {
                            passwordReset = true
                        } label: {
                            Text("Reset Password")
                                .foregroundColor(theme.color.foreground)
                        }
                        Button {
                            deleteConfirm = true
                        } label: {
                            Text("Delete Account")
                                .foregroundColor(.red)
                        }
                        Button {
                            confirmLogout = true
                        } label: {
                            Text("Log Out")
                                .foregroundColor(.red)
                        }.confirmationDialog("Log out?", isPresented: $confirmLogout, titleVisibility: .visible) {
                            Button("Log Out", role: .destructive){
                                Haptics.shared.notify(.success)
                                token = ""
                                verifyToken = true
                            }
                        } message: {
                            Text("This would require you to sign in again.")
                        }
                    }.sheet(isPresented: $passwordReset){
                        VStack (spacing: 20){
                            Spacer()
                            Image(systemName: "person.crop.circle.badge.questionmark.fill")
                                .font(.system(size: 100))
                                .foregroundColor(theme.color.foreground)
                            Text("**Password Reset**")
                                .font(.largeTitle)
                            Spacer()
                            VStack (alignment: .leading){
                                Text("Old Password:")
                                SecureField("Enter text here", text: $oldPassword)
                            }.padding(20)
                            //.frame(width: 300)
                                .background(theme.gray.surface1)
                                .cornerRadius(20)
                            VStack (alignment: .leading){
                                Text("New Password:")
                                SecureField("Enter text here", text: $newPassword)
                            }
                            //.frame(width: 300)
                            .padding(20)
                            .background(theme.gray.surface1)
                            .cornerRadius(20)
                            Spacer()
                            if resetPasswordError == "" {
                                Text("Resetting signs out all signed in devices")
                                    .foregroundColor(theme.gray.surface4)
                            } else {
                                Text(resetPasswordError)
                                    .foregroundColor(theme.red.foreground)
                            }
                            Button {
                                if loading {
                                    
                                } else if newPassword.isEmpty || oldPassword.isEmpty {
                                    resetPasswordError = "Password is required"
                                    Haptics.shared.notify(.error)
                                    
                                } else if newPassword.count < 8 {
                                    resetPasswordError = "Password must have at least 8 characters"
                                    Haptics.shared.notify(.error)
                                    
                                } else {
                                    loading = true
                                    resetPasswordError = ""
                                    AF.upload(multipartFormData: { multiFormData in
                                        multiFormData.append(Data(token.utf8), withName: "token")
                                        multiFormData.append(Data(oldPassword.utf8), withName: "oldPassword")
                                        multiFormData.append(Data(newPassword.utf8), withName: "newPassword")
                                        
                                    }, to: apiUrl("/users/resetPassword")).response { response in
                                        let res = apiManager.status(response)
                                        switch res.code {
                                        case .Success:
                                            loading = false
                                            passwordReset = false
                                            Haptics.shared.notify(.success)
                                            token = ""
                                            verifyToken = true
                                        case .Forbidden:
                                            loading = false
                                            resetPasswordError = "Token invalid. Try logging in again."
                                            Haptics.shared.notify(.error)
                                        case .NotFound:
                                            loading = false
                                            resetPasswordError = "Old password is incorrect."
                                            Haptics.shared.notify(.error)
                                        default:
                                            loading = false
                                            resetPasswordError = "An unknown error occured"
                                            Haptics.shared.notify(.error)
                                        }
                                    }
                                }
                            } label: {
                                HStack {
                                    if loading {
                                        ProgressView()
                                    } else {
                                        Text("Confirm")
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity)
                                .background(theme.color.background)
                                .cornerRadius(20)
                                .disabled(loading)
                            }
                        }.padding(20)
                    }
                }.sheet(isPresented: $deleteConfirm){
                    VStack (spacing: 20){
                        Spacer()
                        Image(systemName: "memories.badge.minus")
                            .font(.system(size: 100))
                            .foregroundColor(theme.red.foreground)
                        Text("**Delete Account**")
                            .font(.largeTitle)
                        Text("This action is **irreversable**. Your data will be deleted from the servers. **Confirm your password to continue**.")
                            .multilineTextAlignment(.center)
                        Spacer()
                        VStack (alignment: .leading){
                            Text("Confirm your password:")
                            SecureField("Enter text here", text: $deletePasswordConfirmation)
                        }
                            .padding(20)
                            .background(theme.gray.surface1)
                            .cornerRadius(20)
                        Spacer()
                        if deleteAccountError == "" {
                            Text("This action can't be reverted!")
                                .foregroundColor(theme.gray.surface4)
                        } else {
                            Text(deleteAccountError)
                                .foregroundColor(theme.red.foreground)
                        }
                        Button {
                            if loading {
                                
                            } else if deletePasswordConfirmation.isEmpty {
                                deleteAccountError = "Password is required"
                                Haptics.shared.notify(.error)
                                
                            } else if deletePasswordConfirmation.count < 8 {
                                deleteAccountError = "Password must have at least 8 characters"
                                Haptics.shared.notify(.error)
                                
                            } else {
                                loading = true
                                deleteAccountError = ""
                                AF.upload(multipartFormData: { multiFormData in
                                    multiFormData.append(Data(token.utf8), withName: "token")
                                    multiFormData.append(Data(deletePasswordConfirmation.utf8), withName: "password")
                                    
                                }, to: apiUrl("/users/delete")).response { response in
                                    let res = apiManager.status(response)
                                    switch res.code {
                                    case .Success:
                                        loading = false
                                        deleteConfirm = false
                                        Haptics.shared.notify(.success)
                                        token = ""
                                        verifyToken = true
                                    case .Forbidden:
                                        loading = false
                                        deleteAccountError = "Token invalid. Try logging in again."
                                        Haptics.shared.notify(.error)
                                    case .NotFound:
                                        loading = false
                                        deleteAccountError = "Password is incorrect."
                                        Haptics.shared.notify(.error)
                                    default:
                                        loading = false
                                        deleteAccountError = "An unknown error occured"
                                        Haptics.shared.notify(.error)
                                    }
                                }
                            }
                        } label: {
                            HStack {
                                if loading {
                                    ProgressView()
                                } else {
                                    Text("Delete")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(theme.red.background)
                            .cornerRadius(20)
                            .disabled(loading)
                        }
                    }.padding(20)
        
                }
                HStack {
                    Button {
                        if loading {
                            
                        } else if name.isEmpty {
                            apiError = true
                            apiErrorMessage = "Username is required"
                            Haptics.shared.notify(.error)
                            
                        } else if name.count < 3 {
                            apiError = true
                            apiErrorMessage = "Username must have at least 3 characters"
                            Haptics.shared.notify(.error)
                            
                        } else if name.count > 32 {
                            apiError = true
                            apiErrorMessage = "Username must have at most 32 characters"
                            Haptics.shared.notify(.error)
                            
                        } else if name.rangeOfCharacter(from: disallowedCharacters.inverted) != nil {
                            apiError = true
                            apiErrorMessage = "Username only allows A-Z, 0-9, periods, _, or -"
                            Haptics.shared.notify(.error)
                        } else {
                            loading = true
                            AF.upload(multipartFormData: { multiFormData in
                                multiFormData.append(Data(token.utf8), withName: "token")
                                multiFormData.append(Data(name.utf8), withName: "username")
                                let indx = goals.firstIndex(of: goal)
                                if indx != nil {
                                    let mapping = goalMap[indx!]
                                    multiFormData.append(Data(String(mapping).utf8), withName: "goal")
                                }
                            }, to: apiUrl("/users/update")).response { response in
                                let res = apiManager.status(response)
                                switch res.code {
                                case .Success:
                                    loading = false
                                    Haptics.shared.notify(.success)
                                    let data = res.data["data"] as! [String: Any]
                                    user = User(dictionary: data)
                                case .Forbidden:
                                    loading = false
                                    apiErrorMessage = "Token invalid. Try logging in again."
                                    apiError = true
                                    Haptics.shared.notify(.error)
                                default:
                                    loading = false
                                    apiErrorMessage = "An unknown error occured"
                                    apiError = true
                                    Haptics.shared.notify(.error)
                                }
                            }
                        }
                    }label:{
                        HStack {
                            if loading {
                                ProgressView()
                            } else {
                                Text("Save Changes")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(theme.color.background)
                        .cornerRadius(20)
                        .disabled(loading)
                    }
                }.padding(20)
            }.onAppear(){
                name = user.name
                let indx = goalMap.firstIndex(of: user.goal)
                if indx != nil {
                    goal = goals[indx!]
                }
            }.toast(isPresenting: $apiError){
                AlertToast(displayMode: .hud, type: .error(Color.red), title: "Request Failed", subTitle: apiErrorMessage)
            }
        }.navigationTitle("Settings")
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView(user: .constant(User()), theme: .constant(Theme()), verifyToken: .constant(false), token: .constant(""))
    }
}
