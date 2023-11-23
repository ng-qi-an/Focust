import SwiftUI

struct FriendsView: View {
    @Binding var theme: Theme;
    
    var body: some View {
        VStack {
            //            Text("Friends")
            //                .bold()
            //                .font(.system(size: 45))
            //                .offset(x: -95, y: -280)
            //
            //            Button(action:{
            //                //Button Action for adding a friend
            //            }) {
            //                Text("**Add a Friend**")
            //                    .frame(width: 350, height: 15)
            //                    .padding()
            //                    .background(Color(red: 64/255, green: 224/255, blue: 208/255))
            //                    .foregroundColor(.white)
            //                    .cornerRadius(10)
            //            }
            //            .offset(x: 0, y: 320)
            //
            //            Button(action: {
            //                //Button action
            //            }) {
            //                Text("Show QR code")
            //                    .frame(width: 350, height: 15)
            //                    .padding()
            //                    .background(Color(red: 235/255, green: 235/255, blue: 235/255))
            //                    .foregroundColor(.black)
            //                    .cornerRadius(10)
            //            }
            //            .offset(x: 0, y: 200)
            //
            //            HStack{
            //                Circle()
            //                    .frame(width: 30, height: 30)
            //                    .foregroundColor(Color(red: 64/255, green: 224/255, blue: 208/255))
            //                    .offset(x: 150, y: -350)
            //                    .zIndex(1.0)
            //                    .offset(x: 0, y: -30)
            //
            //                Rectangle()
            //                    .frame(width: 330, height: 51)
            //                    .foregroundColor(Color(red: 235/255, green: 235/255, blue: 235/255))
            //                    .cornerRadius(10)
            //                    .offset(x: -20, y: -380)
            Text("**Your activity**")
                .opacity(0.5)
                .offset(x: -120, y: 90) //your activity
                .foregroundColor(theme.gray.foreground)
            ZStack {
                Rectangle()
                    .frame(width: 350, height: 300)
                    .foregroundColor(theme.gray.surface1) //streak bg
                    .cornerRadius(15)
                Image("flame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                    .offset(y: -65) //fire
                Text("**5**")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .offset(y: -50) //streak number
                Text("**Day Streak**")
                    .font(.system(size: 20))
                    .opacity(0.6)
                    .offset(y: 10)
                    .foregroundColor(theme.gray.foreground)
                VStack {
                    HStack {
                        LinearGradient(
                            gradient: Gradient(
                                colors: theme.mode == .Dark ? [
                                    theme.yellow.foreground,
                                    theme.yellow.foreground,
                                ] : [
                                    theme.yellow.button,
                                    theme.orange.button,
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask(Image(systemName: "trophy.fill"))
                        .frame(width: 26, height: 28)
                        .padding(.trailing, 210)
                        LinearGradient(
                            gradient: Gradient(
                                colors: theme.mode == .Dark ? [
                                    theme.yellow.foreground,
                                    theme.yellow.foreground,
                                ] : [
                                    theme.yellow.button,
                                    theme.orange.button,
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask(Image(systemName: "flag.checkered"))
                        .frame(width: 26, height: 28)
                    }
                    .padding(.top, 70)
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 250, height: 3)
                                .foregroundColor(theme.gray.surface3)
                                .offset(y: 2)
                            
                            HStack(spacing: 25) {
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                                ZStack {
                                    //                                if value == 0 {
                                    Circle()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(theme.gray.surface4)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(theme.gray.background)
                                        .opacity(1)
                                    //                                } else {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: theme.mode == .Dark ? [
                                                theme.yellow.foreground,
                                                theme.yellow.foreground,
                                            ] : [
                                                theme.yellow.button,
                                                theme.orange.button,
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }
                            }
                        }
                    }.offset(y: 20) //timeline
                }
                HStack {
                    Text("M")
                        .font(.system(size: 15))
                        .offset(x: -65, y: 90)
                        .opacity(0.5)
                        .foregroundColor(theme.gray.foreground)
                    Text("T")
                        .font(.system(size: 15))
                        .offset(x: -45, y: 90)
                        .opacity(0.5)
                        .foregroundColor(theme.gray.foreground)
                    Text("W")
                        .font(.system(size: 15))
                        .offset(x: -25, y: 90)
                        .opacity(0.5)
                        .foregroundColor(theme.gray.foreground)
                    Text("T")
                        .font(.system(size: 15))
                        .offset(x: -5, y: 90)
                        .opacity(0.5)
                        .foregroundColor(theme.gray.foreground)
                    Text("F")
                        .font(.system(size: 15))
                        .offset(x: 17, y: 90)
                        .opacity(1)
                        .foregroundColor(theme.gray.foreground)
                    Text("S")
                        .font(.system(size: 15))
                        .offset(x: 42, y: 90)
                        .opacity(0.5)
                        .foregroundColor(theme.gray.foreground)
                    Text("S")
                        .font(.system(size: 15))
                        .offset(x: 65, y: 90)
                        .opacity(0.5)
                        .foregroundColor(theme.gray.foreground)
                }//days of the week
                .offset(y: -40)
                .foregroundColor(.black)
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(theme: .constant(Theme()))
    }
}
