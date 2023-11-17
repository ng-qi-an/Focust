//
//  Statistics.swift
//  Focust
//
//  Created by Ethan Chow on 14/11/23.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Past week")
                    .opacity(0.3)
                    .offset(x: -140, y: 30)
                Image("vector")
                HStack {
                    Text("Monday")
                        .opacity(0.3)
                        .font(.system(size: 10))
                        .padding(.trailing, 30)
                    Text("Tuesday")
                        .opacity(0.3)
                        .font(.system(size: 10))
                        .padding(.trailing, 30)
                    Text("Wednesday")
                        .opacity(0.3)
                        .font(.system(size: 10))
                        .padding(.trailing, 30)
                    Text("Yesterday")
                        .opacity(0.3)
                        .font(.system(size: 10))
                        .padding(.trailing, 30)
                    Text("Today")
                        .font(.system(size: 10))
                }
                ZStack {
                    Image("statsBg")
                        .resizable()
                        .frame(width: 394, height: 520)
                        .scaledToFit()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            VStack {
                                Text("**1**")
                                    .font(.system(size: 70))
                                    .foregroundColor(.white)
                                Text("hours clocked")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                            }.offset(y: -15)
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                    .padding(.leading, 20)
                                Text("Total time: 1hr 20 mins")
                                Spacer()
                            }
                            .frame(width: 315, height: 40)
                            .background(.white)
                            .cornerRadius(15)
                            HStack {
                                Image(systemName: "wind")
                                    .padding(.leading, 20)
                                Text("Breaks: 0")
                                Spacer()
                            }
                            .frame(width: 315, height: 40)
                            .background(.white)
                            .cornerRadius(15)
                            HStack {
                                Image(systemName: "gearshape")
                                    .padding(.leading, 20)
                                Text("Focus mode: Flexible")
                                Spacer()
                            }
                            .frame(width: 315, height: 40)
                            .background(.white)
                            .cornerRadius(15)
                            HStack {
                                Text("Suggestions")
                                    .padding(.leading, 20)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                            }
                            .frame(width: 315, height: 50)
                            .background(.white)
                            .cornerRadius(15)
                            .offset(y: 20)
                            HStack {
                                Text("Made a mistake? Remove it!")
                                    .padding(.leading, 20)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "trash")
                                    .padding(.trailing, 20)
                            }
                            .frame(width: 315, height: 50)
                            .background(Color(red: 239/255, green: 68/255, blue: 86/255))
                            .cornerRadius(15)
                            .offset(y: 30)
                        }
                    }.offset(y: 30)
                    Rectangle()
                        .frame(width: 393, height: 100)
                        .foregroundColor(.white)
                        .offset(y: 230)
                }
            }
            .navigationTitle("Statistics")
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
