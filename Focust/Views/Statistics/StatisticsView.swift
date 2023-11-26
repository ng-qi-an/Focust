//
//  Statistics.swift
//  Focust
//
//  Created by Ethan Chow on 14/11/23.
//

import SwiftUI
import Alamofire
import AlertToast

struct StatisticsView: View {
    let apiManager = APIManager()
    @Binding var theme: Theme;
    @Binding var token: String;
    @State var clear = false
    @State var data: Array<Stat> = []
    @State var months: Array<String> = []
    @State var dates: Array<String> = []
    @State var selectedMonth: String = ""
    @State var loading = false
    @State var search: String = ""
    @State private var apiError = false
    @State private var apiErrorMessage = ""
    var body: some View {
        NavigationView {
            VStack {
                if loading {
                    ProgressView()
                } else {
                    if months.count == 0 {
                        HStack {
                            Image(systemName: "archivebox.circle.fill")
                                .foregroundColor(theme.gray.foreground)
                            Text("No sessions found. Try starting one.")
                                .foregroundColor(theme.gray.foreground)
                        }.padding()
                        .background(theme.gray.surface1)
                        .cornerRadius(20)
                        Spacer()
                    } else {
                        HStack {
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack {
                                    ForEach(months, id: \.self){ month in
                                        HStack {
                                            Text(month)
                                                .foregroundColor(selectedMonth == month ? .white : theme.color.foreground)
                                        }.padding(.trailing, 30)
                                            .padding(.leading, 30)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .background(selectedMonth == month ? theme.color.background : theme.gray.surface1)
                                            .cornerRadius(20)
                                            .onTapGesture {
                                                withAnimation {
                                                    selectedMonth = month
                                                }
                                            }
                                    }
                                }
                            }
                        }.padding()
                        List {
                            ForEach(dates, id: \.self){ date in
                                if date.contains(selectedMonth){
                                    Section(header:
                                                Text("**\(date)**")
                                        .font(.title3)
                                        .textCase(nil)
                                    ){
                                        ForEach(data, id: \.self) { stat in
                                            if stat.month == selectedMonth {
                                                NavigationLink (destination: StatisticsDetailsView(data: stat)){
                                                    VStack(alignment: .leading) {
                                                        Text("**Focus Session**")
                                                        Text("\(Int(stat.sessionLength)! / 60) mins - \(convertToTime(timestamp: stat.created_on))")
                                                            .opacity(0.7)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }.navigationTitle("Statistics")
        }
        .onAppear() {
            loading = true
        }.onChange(of: loading){ newValue in
            if newValue {
                data = []
                AF.upload(multipartFormData: { multiFormData in
                    multiFormData.append(Data(token.utf8), withName: "token")
                }, to: apiUrl("/sessions/get")).response { response in
                    let res = apiManager.status(response)
                    switch res.code {
                    case .Success:
                        loading = false
                        Haptics.shared.notify(.success)
                        months = res.data["months"] as! Array<String>
                        dates = res.data["dates"] as! Array<String>
                        if months.count > 0 {
                            selectedMonth = months[0]
                        }
                        for value in res.data["data"] as! Array<Dictionary<String, Any>> {
                            data.append(Stat(dictionary: value))
                        }
                        
                    case .Forbidden:
                        loading = false
                        apiError = true
                        apiErrorMessage = "Token invalid. Try logging in again."
                        Haptics.shared.notify(.error)
                    default:
                        loading = false
                        apiError = true
                        apiErrorMessage = "An unknown error occured"
                        Haptics.shared.notify(.error)
                    }
                }
            }
        }.toast(isPresenting: $apiError){
            AlertToast(displayMode: .hud, type: .error(Color.red), title: "Request Failed", subTitle: apiErrorMessage)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(theme: .constant(Theme()), token: .constant(User().token))
    }
}
