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
    @State private var counter = 0
    @State private var saverCounter = 0
    @State private var min = 0
    @State private var hour = 0
    @State private var taskCount = 0
    @State private var paused = false
    @Binding var theme: Theme
    @Binding var startedSession: Bool
    @Binding var focusLength: Int
    @Binding var breakLength: Int
    @Binding var longBreakLength: Int
    @Binding var pomo: Bool
    @Binding var focusOptions: Array<String>
    @Binding var breakOptions: Array<String>
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var saverCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var saver = false
    let alertTitle: String = "Set your task's name:"
    
    var body: some View {
        NavigationView {
            if saver {
                Saver_ModeView(hour: $hour, min: $min, saver: $saver)
            } else {
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
                        HStack(spacing: 25) {
                            VStack(spacing: -20) {
                                Text("**\(hour)**")
                                    .font(.system(size: 100))
                                    .foregroundColor(.white)
                                Text("hr")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .opacity(07)
                            }
                            Text("**:**")
                                .font(.system(size: 100))
                                .foregroundColor(.white)
                                .padding(.bottom, 30)
                            VStack(spacing: -20) {
                                Text("**\(min < 10 ? "0" : "")\(min)**")
                                    .font(.system(size: 100))
                                    .foregroundColor(.white)
                                Text("minutes")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .opacity(07)
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
                                .onChanged { _ in
                                    isLongPressing = true
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
                        HStack(spacing: 0) {
                            Button {
                                paused = !paused
                                if paused {
                                    timer.upstream.connect().cancel()
                                } else {
                                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                }
                                
                            } label: {
                                HStack {
                                    Image(systemName: paused ? "play.fill" : "pause.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(theme.color.foreground)
                                    Text(paused ? "Resume" : "Pause")
                                        .font(.system(size: 23))
                                        .foregroundColor(theme.gray.foreground)
                                        .padding(.leading, 5)
                                        .padding(.trailing, 20)
                                }
                                .frame(height: 70)
                                .padding(.leading, 30)
                                .background(theme.gray.background)
                                .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                            }
                            Button {
                                timer.upstream.connect().cancel()
                                dismiss()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 80, height: 70)
                                        .foregroundColor(theme.red.button)
                                        .cornerRadius(25, corners: [.topRight, .bottomRight])
                                    HStack {
                                        Image(systemName: "square.fill")
                                            .font(.system(size: 30))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        Spacer()
                        Button {
                            saver = true
                        } label: {
                            HStack {
                                Image(systemName: "leaf")
                                    .foregroundColor(.black)
                                Text("saver mode")
                                    .foregroundColor(.black)
                            }
                            .frame(width: 155, height: 32)
                            .background(.white)
                            .cornerRadius(15)
                            .padding(.bottom, 10)
                        }
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 10)
                            .foregroundColor(theme.gray.background)
                    }
                }
            }
        }
        .onAppear(){
            startedSession = true
        }
        .onReceive(timer) { _ in
            counter += 1
            hour = counter / (60 * 60)
            if counter / 60 == 60 {
                min = 0
            } else {
                min = (counter / 60) - (hour * 60)
            }
        }
        .onReceive(saverCount) { _ in
            saverCounter += 1
            if saverCounter >= 30 {
                saver = true
            }
            print(saverCounter)
        }
        .onChange(of: saver){ newValue in
            if newValue == true {
                saverCount.upstream.connect().cancel()
            } else {
                saverCounter = 0
                saverCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Focus_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeView(theme: .constant(Theme()), startedSession: .constant(false), focusLength: .constant(0), breakLength: .constant(0), longBreakLength: .constant(0), pomo: .constant(false), focusOptions: .constant(["25mins", "35mins", "45mins", "55min"]), breakOptions: .constant(["5mins", "10mins", "15mins", "20min"]))
    }
}



