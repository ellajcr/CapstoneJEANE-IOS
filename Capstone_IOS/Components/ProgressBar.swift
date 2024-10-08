import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var finishedProgress: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 6)
                .foregroundColor(finishedProgress ? Color("DarkBrown") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 6)
                .foregroundColor(Color("DarkBrown"))
                .cornerRadius(10)
        }
    }
}
