import Foundation
import SwiftUI

struct LectureView: View {
    let content: ContentItem
    @Binding var nextSlideEnabled: Bool

    var body: some View {
        ScrollView {
            Text(content.title ?? "")
                .font(.custom("GermaniaOne-Regular", size: 30))
                .padding()
            
            Spacer()
            VStack(alignment: .leading) {
                if let imageName = content.image {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("DarkBrown"), lineWidth: 2)
                        )
                        .padding(.vertical)
                }
                
                ScrollView {
                    VStack {
                        Text(content.text ?? "No content available")
                            .font(.custom("AveriaSansLibre-Regular", size: 20))
                    }
                    .padding()
                }
                .frame(maxHeight: 300)
                .background(Color("Cream"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("DarkBrown"), lineWidth: 2)
                )
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            nextSlideEnabled = true
        }
    }
}

