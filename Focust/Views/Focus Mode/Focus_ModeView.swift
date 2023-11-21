//
//  Focus Mode.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct Focus_ModeView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var showAlert = false
    @State private var text: String = ""
    @State private var isLongPressing = false
    @State private var deleteQuestion = false
    @State private var taskValue = 0
    @State private var tasks = []
    @State private var task1 = "1."
    @State private var task2 = "2."
    @State private var task3 = "3."
    @State private var task4 = "4."
    @State private var taskCount = 0
    @Binding var theme: Theme;
    @Binding var startedSession: Bool;

    let alertTitle: String = "Set your task's name:"
    
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
                    
                    Button {
                        taskCount = 1
                        if isLongPressing && taskCount == 1 {
                            deleteQuestion = true
                            if deleteQuestion == true {
                                task1 = ""
                                let seconds = 1.0
                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                    task1 = task2
                                }
                                
                            }
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 270, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                            Text(task1)
                                .foregroundColor(.black)
                        }
                    }
                    .simultaneousGesture(
                        LongPressGesture(minimumDuration: 1.0)
                            .onChanged { _ in                        isLongPressing = true
                            }
                    )
                    Button {
                        taskCount = 2
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 250, height: 50)
                                .foregroundColor(.white)
                                .opacity(0.1)
                                .cornerRadius(15)
                            Text(task2)
                                .foregroundColor(.white)
                        }.frame(width: 250, height: 50)
                    }
                    Button {
                        taskCount = 3
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 250, height: 50)
                                .foregroundColor(.white)
                                .opacity(0.1)
                                .cornerRadius(15)
                            Text(task3)
                                .foregroundColor(.white)
                        }.frame(width: 250, height: 50)
                    }
                    Button {
                        taskCount = 4
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 250, height: 50)
                                .foregroundColor(.white)
                                .opacity(0.1)
                                .cornerRadius(15)
                            Text(task4)
                                .foregroundColor(.white)
                        }.frame(width: 250, height: 50)
                    }
                    Rectangle()
                        .opacity(0)
                        .frame(height: 15)
                    Button {
                        showAlert = true
                        taskValue += 1
                        if taskValue == 5 {
                            taskValue = 0
                        }
                    } label: {
                        Text("add a task")
                            .foregroundColor(.white)
                            .opacity(1)
                    }
                    .alert(
                        Text(alertTitle),
                        isPresented: $showAlert
                    ) {
                        Button("Cancel", role: .cancel) {
                            // Handle the acknowledgement.
                        }
                        Button("Add Task!") {
                            if taskValue == 1 {
                                task1 = "1. \(text)"
                            }
                            if taskValue == 2 {
                                task2 = "2. \(text)"
                            }
                            if taskValue == 3 {
                                task3 = "3. \(text)"
                            }
                            if taskValue == 4 {
                                task4 = "4. \(text)"
                            }
                        }
                        
                        TextField("Enter here", text: $text)
                    } message: {
                        Text("Note: Limit to 4 entries!")
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
            }.onAppear(){
                startedSession = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Focus_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeView(theme: .constant(Theme()), startedSession: .constant(false))
    }
}



