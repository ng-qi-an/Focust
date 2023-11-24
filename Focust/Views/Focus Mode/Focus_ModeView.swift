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
    @State private var showDeleteAlert = false
    @State private var text: String = ""
    @State private var isLongPressing = false
    @State private var deleteQuestion = false
    @State private var taskValue = 0
    @State private var tasks = ["1.", "2.", "3."]
    @State private var task1 = ""
    @State private var task2 = ""
    @State private var task3 = ""
    @State private var task4 = ""
    @State private var counter = 0
    @State private var saverCounter = 0
    @State private var sec = 0
    @State private var min2 = 0
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
    @State var breakCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var saver = false
    @State var breakCounter = 0
    @State var startDate = Date.now
    
    var body: some View {
        NavigationView {
            if saver {
                Saver_ModeView(hour: $hour, min: $min, saver: $saver)
            } else {
                ZStack {
                    LinearGradient(colors: [theme.color.button, theme.color.background], startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Image("triangles")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 191)
                        Spacer()
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            HStack(spacing: 20) {
                                VStack(spacing: -20) {
                                    Text("**\(hour)**")
                                        .font(.system(size: 80))
                                        .foregroundColor(.white)
                                    Text("hr")
                                        .font(.system(size: 23))
                                        .foregroundColor(.white)
                                }
                                Text("**:**")
                                    .font(.system(size: 80))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 30)
                                VStack(spacing: -20) {
                                    Text("**\(min < 10 ? "0" : "")\(min)**")
                                        .font(.system(size: 80))
                                        .foregroundColor(.white)
                                    Text("minutes")
                                        .font(.system(size: 23))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.top, 150)
                            VStack(spacing: -10) {
                                HStack(spacing: 5) {
                                    VStack(spacing: -15) {
                                        Text("**\(min2 < 10 ? "0" : "")\(min2)**")
                                            .font(.system(size: 30))
                                            .opacity(0.7)
                                            .foregroundColor(theme.color.foreground)
                                    }
                                    Text("**:**")
                                        .font(.system(size: 30))
                                        .opacity(0.7)
                                        .foregroundColor(theme.color.foreground)
                                        .padding(.bottom, 6)
                                    VStack(spacing: -15) {
                                        Text("**\(sec < 10 ? "0" : "")\(sec)**")
                                            .opacity(0.7)
                                            .font(.system(size: 30))
                                            .foregroundColor(theme.color.foreground)
                                    }
                                }
                                Text("Break time")
                                    .font(.system(size: 20))
                                    .opacity(0.7)
                                    .foregroundColor(theme.color.foreground)
                            }
                            .frame(width: 200, height: 70)
                            .background(.white)
                            .cornerRadius(50)
                            //Spacer()
                            
                            //                            Button {
                            //                                taskCount = 1
                            //                                if isLongPressing && taskCount == 1 {
                            //                                    deleteQuestion = true
                            //                                    if deleteQuestion == true {
                            //                                        task1 = ""
                            //                                        let seconds = 0.5
                            //                                        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                            //                                            task1 = task2
                            //                                            task2 = task3
                            //                                            task3 = task4
                            //                                            task4 = ""
                            //                                        }
                            //
                            //                                    }
                            //                                }
                            //                            } label: {
                            //                                ZStack {
                            //                                    Rectangle()
                            //                                        .frame(width: 270, height: 60)
                            //                                        .foregroundColor(.white)
                            //                                        .cornerRadius(15)
                            //                                    Text("1. \(task1)")
                            //                                        .foregroundColor(.black)
                            //                                }
                            //                            }
                            //                            .simultaneousGesture(
                            //                                LongPressGesture(minimumDuration: 1.0)
                            //                                    .onChanged { _ in
                            //                                        isLongPressing = true
                            //                                    }
                            //                            )
                            //                            Button {
                            //                                taskCount = 2
                            //                            } label: {
                            //                                ZStack {
                            //                                    Rectangle()
                            //                                        .frame(width: 250, height: 50)
                            //                                        .foregroundColor(.white)
                            //                                        .opacity(0.1)
                            //                                        .cornerRadius(15)
                            //                                    Text("2. \(task2)")
                            //                                        .foregroundColor(.white)
                            //                                }.frame(width: 250, height: 50)
                            //                            }
                            //                            Button {
                            //                                taskCount = 3
                            //                            } label: {
                            //                                ZStack {
                            //                                    Rectangle()
                            //                                        .frame(width: 250, height: 50)
                            //                                        .foregroundColor(.white)
                            //                                        .opacity(0.1)
                            //                                        .cornerRadius(15)
                            //                                    Text("3. \(task3)")
                            //                                        .foregroundColor(.white)
                            //                                }.frame(width: 250, height: 50)
                            //                            }
                            //                            Button {
                            //                                taskCount = 4
                            //                            } label: {
                            //                                ZStack {
                            //                                    Rectangle()
                            //                                        .frame(width: 250, height: 50)
                            //                                        .foregroundColor(.white)
                            //                                        .opacity(0.1)
                            //                                        .cornerRadius(15)
                            //                                    Text("4. \(task4)")
                            //                                        .foregroundColor(.white)
                            //                                }.frame(width: 250, height: 50)
                            //                            }
                            //                            Rectangle()
                            //                                .opacity(0)
                            //                                .frame(height: 15)
                            //                            Button {
                            //                                showAlert = true
                            //                                taskValue += 1
                            //                                if taskValue == 5 {
                            //                                    taskValue = 0
                            //                                }
                            //                            } label: {
                            //                                Text("add a task")
                            //                                    .foregroundColor(.white)
                            //                                    .opacity(1)
                            //                                    .padding()
                            //                            }
                            //                            .alert(
                            //                                Text("Set your task's title:"),
                            //                                isPresented: $showAlert
                            //                            ) {
                            //                                Button("Cancel", role: .cancel) {
                            //                                    // Handle the acknowledgement.
                            //                                }
                            //                                Button("Add Task!") {
                            //                                    if taskValue == 1 {
                            //                                        task1 = "\(text)"
                            //                                    }
                            //                                    if taskValue == 2 {
                            //                                        task2 = "\(text)"
                            //                                    }
                            //                                    if taskValue == 3 {
                            //                                        task3 = "\(text)"
                            //                                    }
                            //                                    if taskValue == 4 {
                            //                                        task4 = "\(text)"
                            //                                    }
                            //                                }
                            //
                            //                                TextField("Enter here", text: $text)
                            //                                    .foregroundColor(.black)
                            //                            } message: {
                            //                                Text("Note: Limit to 4 entries!")
                            //                            }
                            HStack(spacing: 0) {
                                Button {
                                    paused = !paused
                                    if paused {
                                        timer.upstream.connect().cancel()
                                        breakCount.upstream.connect().cancel()
                                        breakCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
                                    .frame(height: 60)
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
                                            .frame(width: 80, height: 60)
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
                            .padding(.top, 200)
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
                                .padding()
                            }
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 10)
                                .opacity(0)
                        }
                    }
                }
                .onAppear(){
                    startedSession = true
                }
                
                .onReceive(breakCount) { _ in
                    if paused == true {
                        breakCounter += 1
                        if breakCounter .isMultiple(of: 60)  {
                            sec = 0
                        } else {
                            sec = breakCounter - (min2 * 60)
                        }
                        min2 = (breakCounter / 60)
                        print(breakCounter)
                    }
                }
                .onReceive(timer) { _ in
                    counter += 1
                    hour = counter / (60 * 60)
                    if counter .isMultiple(of: 60) {
                        min = 0
                    } else {
                        min = (counter / 60) - (hour * 60)
                    }
                }
                .onReceive(saverCount) { _ in
                    saverCounter += 1
                    if saverCounter >= 30 {
                        saverCounter = 0
                        saver = true
                    }
                }
                .onChange(of: saver){ newValue in
                    if newValue == true {
                        saverCount.upstream.connect().cancel()
                    } else {
                        saverCounter = 0
                        saverCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        
                    }
                }
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



