import SwiftUI

struct Friends: View {
    var body: some View {
        VStack{
            Text("Friends")
                .bold()
                .font(.system(size: 45))
                .offset(x: -95, y: -280)
            
            Button(action:{
                //Button Action for adding a friend
            }) {
                Text("**Add a Friend**")
                    .frame(width: 350, height: 15)
                    .padding()
                    .background(Color(red: 64/255, green: 224/255, blue: 208/255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .offset(x: 0, y: 320)
            
            Button(action: {
                //Button action
            }) {
                Text("Show QR code")
                    .frame(width: 350, height: 15)
                    .padding()
                    .background(Color(red: 235/255, green: 235/255, blue: 235/255))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .offset(x: 0, y: 200)
            
            HStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(red: 64/255, green: 224/255, blue: 208/255))
                    .offset(x: 150, y: -350)
                    .zIndex(1.0)
                    .offset(x: 0, y: -30)
                
                Rectangle()
                    .frame(width: 330, height: 51)
                    .foregroundColor(Color(red: 235/255, green: 235/255, blue: 235/255))
                    .cornerRadius(10)
                    .offset(x: -20, y: -380)
            }
        }
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}
