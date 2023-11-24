//
//  Statistics.swift
//  Focust
//
//  Created by Ethan Chow on 14/11/23.
//

import SwiftUI

struct StatisticsView: View {
    @Binding var theme: Theme;
    @State var clear = false
    var stats = [1, 2, 3, 4, 5, 6, 7]
    var body: some View {
        NavigationView {
            TabView {
                ForEach(stats, id: \.self) { stat in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            Rectangle()
                                .foregroundColor(theme.gray.background)
                                .frame(height: 30)
                            VStack {
                                VStack {
                                    Text("Recent days")
                                        .opacity(0.5)
                                        .font(.system(size: 20))
                                        .offset(x: -120, y: 30)
                                    Image("vector")
                                    HStack {
                                        Spacer()
                                        Text("Mon")
                                            .opacity(0.5)
                                            .font(.system(size: 13))
                                            .padding(.trailing, 30)
                                        Spacer()
                                        Text("Tue")
                                            .opacity(0.5)
                                            .font(.system(size: 13))
                                            .padding(.trailing, 30)
                                        Spacer()
                                        Text("Wed")
                                            .opacity(0.5)
                                            .font(.system(size: 13))
                                            .padding(.trailing, 30)
                                        Spacer()
                                        Text("Thu")
                                            .opacity(0.5)
                                            .font(.system(size: 13))
                                            .padding(.trailing, 30)
                                        Spacer()
                                        Text("Today")
                                            .font(.system(size: 13))
                                        Spacer()
                                    }
                                    Rectangle()
                                        .foregroundColor(theme.gray.background)
                                        .frame(maxWidth: .infinity, maxHeight: 50)
                                }
                                .background(theme.gray.background)
                                VStack(spacing: 20) {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 390, height: 200)
                                            .foregroundColor(theme.gray.surface1)
                                            .cornerRadius(20)
                                        VStack {
                                            HStack {
                                                Image(systemName: "clock.arrow.2.circlepath")
                                                Text("HOURS FOCUSED")
                                                    .font(.system(size: 15))
                                                    .foregroundColor(theme.gray.foreground)
                                            }
                                            .padding(.trailing, 200)
                                            HStack {
                                                VStack {
                                                    Text("**1**")
                                                        .font(.system(size: 70))
                                                        .foregroundColor(theme.gray.foreground)
                                                    Text("Keep up the good work!")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(theme.gray.surface4)
                                                        .padding(.bottom, 10)
                                                }
                                                Image(systemName: "clock")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .font(Font.title.weight(.thin))
                                                    .padding(.bottom, 20)
                                                    .padding(.leading, 20)
                                            }
                                        }
                                    }
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 390, height: 200)
                                            .foregroundColor(theme.gray.surface1)
                                            .cornerRadius(20)
                                        HStack {
                                            VStack {
                                                HStack {
                                                    Image(systemName: "clock.arrow.circlepath")
                                                        .padding(.leading, 40)
                                                    Text("TOTAL TIME")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(theme.gray.foreground)
                                                    Spacer()
                                                }
                                                VStack {
                                                    Text("**90**")
                                                        .font(.system(size: 70))
                                                        .foregroundColor(theme.gray.foreground)
                                                        .padding(.top, 10)
                                                    Text("mins")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(theme.gray.surface4)
                                                }
                                                .padding(.leading, 20)
                                            }
                                            Rectangle()
                                                .frame(width: 2, height: 200)
                                                .padding(.trailing, 3)
                                                .foregroundColor(theme.gray.surface4)
                                            VStack {
                                                HStack {
                                                    Image(systemName: "wind")
                                                    Text("BREAKS")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(theme.gray.foreground)
                                                }
                                                .padding(.leading, 10)
                                                VStack {
                                                    Text("**0**")
                                                        .font(.system(size: 70))
                                                        .foregroundColor(theme.gray.foreground)
                                                        .padding(.top, 10)
                                                    Text("mins")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(theme.gray.surface4)
                                                }
                                                .padding(.leading, 40)
                                            }
                                            .padding(.trailing, 87)
                                        }
                                    }
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 390, height: 200)
                                            .foregroundColor(theme.gray.surface1)
                                            .cornerRadius(20)
                                        HStack {
                                            VStack {
                                                HStack {
                                                    Image(systemName: "gearshape")
                                                        .padding(.leading, 40)
                                                    Text("FOCUS MODE")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(theme.gray.foreground)
                                                    Spacer()
                                                }
                                                .padding(.top, 25)
                                                Spacer()
                                                VStack {
                                                    Text("**Flexible**")
                                                        .font(.system(size: 45))
                                                        .foregroundColor(theme.gray.foreground)
                                                        .padding(.bottom, 20)
                                                }
                                                .padding(.leading, 20)
                                                Spacer()
                                            }
                                            Rectangle()
                                                .frame(width: 2, height: 200)
                                                .padding(.trailing, 5)
                                                .foregroundColor(theme.gray.surface4)
                                            VStack {
                                                HStack {
                                                    Image(systemName: "message")
                                                    Text("SUGGESTIONS")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(theme.gray.foreground)
                                                }
                                                .padding(.leading, 10)
                                                .padding(.bottom, 15)
                                                VStack {
                                                    Image(systemName: "text.bubble")
                                                        .resizable()
                                                        .frame(width: 70, height: 70)
                                                        .font(Font.title.weight(.thin))
                                                }
                                            }
                                            .padding(.trailing, 37)
                                        }
                                    }
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 390, height: 180)
                                            .foregroundColor(theme.gray.surface1)
                                            .cornerRadius(20)
                                        VStack {
                                            HStack {
                                                Image(systemName: "exclamationmark.triangle")
                                                Text("DANGER")
                                                    .font(.system(size: 15))
                                                    .foregroundColor(theme.gray.foreground)
                                            }
                                            .padding(.trailing, 260)
                                            HStack {
                                                VStack(spacing: 5) {
                                                    Text("**Made a mistake?**")
                                                        .font(.system(size: 25))
                                                        .foregroundColor(theme.gray.foreground)
                                                        .padding(.trailing, 50)
                                                    Text("Perhaps it was an accident.")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(theme.gray.surface4)
                                                }
                                                Button {
                                                    clear = true
                                                } label: {
                                                    ZStack {
                                                        Circle()
                                                            .frame(width: 100, height: 100)
                                                            .foregroundColor(RGBtoColor(254, 211, 211))
                                                        Image(systemName: "trash")
                                                            .resizable()
                                                            .frame(width: 50, height: 60)
                                                            .foregroundColor(theme.gray.foreground)
                                                            .font(Font.title.weight(.thin))
                                                    }
                                                    .padding(.leading, 10)
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
            .tabViewStyle(.page)
            .navigationTitle("Statistics")
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(theme: .constant(Theme()))
    }
}
