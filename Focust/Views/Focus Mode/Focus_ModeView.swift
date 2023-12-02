//
//  Focus Mode.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI
import SwiftUIIntrospect
import Alamofire
import AlertToast

struct Focus_ModeView: View {
    let apiManager = APIManager()
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
    @State private var taskCount = 0
    
    // Error handling
    @State private var apiError = false
    @State private var apiErrorMessage = ""
    @State private var paused = false
    
    // Bindings
    @Binding var theme: Theme
    @Binding var startedSession: Bool
//    @Binding var focusLength: Int
//    @Binding var breakLength: Int
//    @Binding var longBreakLength: Int
//    @Binding var pomo: Bool
//    @Binding var focusOptions: Array<String>
//    @Binding var breakOptions: Array<String>
    @Binding var today: Int
    @Binding var todayDate: String;
    @Binding var sessions: Array<Session>;
    
    // Timers
    @State private var counter = 0
    @State private var saverCounter = 0
    @State private var sec = 0
    @State private var min2 = 0
    @State private var min = 0
    @State private var hour = 0
    @State var breakNum = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var saverCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var totalBreakCount = 0
    @State var breakCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var saver = false
    @State var breakCounter = 0
    @State var startDate = Date.now
    @State var uiTabarController: UITabBarController?
    @State var saving = false
    
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
                    GeometryReader { proxy in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                Spacer()
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
                                if paused {
                                    VStack(spacing: -10) {
                                        HStack(spacing: 5) {
                                            VStack(spacing: -15) {
                                                Text("\(min2 < 10 ? "0" : "")\(min2)")
                                                    .font(.system(size: 30))
                                                    .opacity(0.7)
                                                    .foregroundColor(theme.gray.foreground)
                                            }
                                            Text(":")
                                                .font(.system(size: 30))
                                                .opacity(0.7)
                                                .foregroundColor(theme.gray.foreground)
                                                .padding(.bottom, 6)
                                            VStack(spacing: -15) {
                                                Text("\(sec < 10 ? "0" : "")\(sec)")
                                                    .opacity(0.7)
                                                    .font(.system(size: 30))
                                                    .foregroundColor(theme.gray.foreground)
                                            }
                                        }
                                    }
                                    .frame(width: 200, height: 70)
                                    .background(theme.gray.background)
                                    .cornerRadius(50)
                                }
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
                                Spacer()
                                HStack(spacing: 0) {
                                    if saving {
                                        ProgressView()
                                            .frame(height: 60)
                                            .padding(.leading, 30)
                                            .padding(.trailing, 30)
                                            .background(theme.gray.background)
                                            .cornerRadius(25, corners: [.topLeft, .bottomLeft, .topRight, .bottomRight])
                                    } else {
                                        Button {
                                            paused = !paused
                                            if paused {
                                                timer.upstream.connect().cancel()
                                                breakNum += 1
                                                breakCount = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                            } else {
                                                breakCount.upstream.connect().cancel()
                                                totalBreakCount += breakCounter
                                                breakCounter = 0
                                                min2 = 0
                                                sec = 0
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
                                            saver = false
                                            timer.upstream.connect().cancel()
                                            saverCount.upstream.connect().cancel()
                                            saverCounter = 0
                                            breakCount.upstream.connect().cancel()
                                            saving = true
                                            print(totalBreakCount)
                                            print(breakNum)
                                            print(counter)
                                            sessions.append(Session(id: UUID(), breaks: breakNum, breakLength: totalBreakCount, sessionLength: counter, date: Date()))
                                            saveSessions(sessions)
                                            Haptics.shared.notify(.success)
                                            let date = checkDate(date: todayDate)
                                            if date != "VALID" {
                                                todayDate = date
                                                today = 0
                                            }
                                            today += (counter - totalBreakCount)
                                            startedSession = false
                                            dismiss()
                                            //                                                AF.upload(multipartFormData: { multiFormData in
//                                                    multiFormData.append(Data(String(token).utf8), withName: "token")
//                                                    multiFormData.append(Data(String(totalBreakCount).utf8), withName: "breakLength")
//                                                    multiFormData.append(Data(String(breakNum).utf8), withName: "breakCount")
//                                                    multiFormData.append(Data(String(counter).utf8), withName: "sessionLength")
//                                                }, to: apiUrl("/sessions/create")).response { response in
//                                                    let res = apiManager.status(response)
//                                                    switch res.code {
//                                                    case .Success:
//                                                        Haptics.shared.notify(.success)
//                                                        today = res.data["data"] as! String
//                                                        startedSession = false
//                                                        dismiss()
//                                                    case .Forbidden:
//                                                        saving = false
//                                                        apiErrorMessage = "Token error. Login again."
//                                                        apiError = true
//                                                        Haptics.shared.notify(.error)
//                                                    default:
//                                                        saving = false
//                                                        apiErrorMessage = "An unknown error occured"
//                                                        apiError = true
//                                                        Haptics.shared.notify(.error)
//                                                    }
//                                                }
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
                                }
//                                Button {
//                                    saver = true
//                                } label: {
//                                    HStack {
//                                        Image(systemName: "leaf")
//                                            .foregroundColor(theme.gray.foreground)
//                                        Text("saver mode")
//                                            .foregroundColor(theme.gray.foreground)
//                                    }
//                                    .frame(width: 155, height: 32)
//                                    .background(theme.gray.background)
//                                    .cornerRadius(15)
//                                    .padding()
//                                }
                                Rectangle()
                                    .frame(maxWidth: .infinity, maxHeight: 30)
                                    .opacity(0)
                            }
                            .frame(minHeight: proxy.size.height)
                        }
                    }.simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                saverCounter = 0
                            }
                    )
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            startedSession = true
            Haptics.shared.play(.medium)
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            // Re-enable the idle timer when the view disappears
            UIApplication.shared.isIdleTimerDisabled = false
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
                //print(breakCounter)
            }
        }
        .onReceive(timer) { _ in
            counter += 1
            hour = counter / (60 * 60)
            if min == hour * 60 && min != 0 {
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
        .toast(isPresenting: $apiError){
            AlertToast(type: .error(Color.red), title: "Request Failed", subTitle: apiErrorMessage)
        }
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
        Focus_ModeView(theme: .constant(Theme()), startedSession: .constant(false), today: .constant(0), todayDate: .constant(""), sessions: .constant([]))
    }
}



