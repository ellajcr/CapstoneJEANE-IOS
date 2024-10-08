import SwiftUI

struct IntroView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Image("dragon")
                    .padding(.top, 50)
                    .padding(.trailing, 20)
                Text("How To Train Your Chatbot")
                    .font(.custom("GermaniaOne-Regular", size: 46))
                
                Spacer()
                
                Text("Learn all about AI in three short lessons. You will learn how to ask questions, evaluate responses, and understand limitations.")
                    .font(.custom("AveriaSansLibre-Regular", size: 20))
                    .padding(.horizontal, 20)
                Spacer()
                NavigationLink(destination: ContentView(showMenu: $showMenu)) {
                    Text("Get Started")
                        .font(.custom("AveriaSansLibre-Regular", size:30))
                        .padding()
                        .foregroundColor(Color("DarkBrown"))
                        .background(Color("Orange")).clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("DarkBrown"), lineWidth: 2)
                        )
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

