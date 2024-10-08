import SwiftUI

struct NavButtons: View {
    @Binding var currentSlideIndex: Int
    @Binding var nextSlideEnabled: Bool
    @Binding var lessonLength: Int
    @Binding var selectedLesson: SideMenuLessonModel?

    var body: some View {
        HStack {
            Spacer()
            
            // Back Button
            Button(action: {
                if currentSlideIndex > 0 {
                    currentSlideIndex -= 1
                }
            }) {
                Text("Back")
                    .padding(7)
                    .foregroundColor(Color("DarkBrown"))
                    .font(.custom("AveriaSansLibre-Regular", size: 25))
                    .background(currentSlideIndex > 0 ? Color("Orange") : Color(.gray))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("DarkBrown"), lineWidth: 2)
                    )
            }
            .disabled(currentSlideIndex == 0)
            
            Spacer()
            
            if currentSlideIndex >= lessonLength - 1 {
                let (nextLesson, newText) = nextLessonInfo()

                // Next Lesson or Finished Button
                Button(action: {
                    selectedLesson = nextLesson
                }) {
                    Text(newText)
                        .padding(7)
                        .foregroundColor(Color("DarkBrown"))
                        .font(.custom("AveriaSansLibre-Regular", size: 25))
                        .background(newText == "Finished" ? Color(.gray) : Color("Orange"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("DarkBrown"), lineWidth: 2)
                        )
                }
                .disabled(newText == "Finished!")
            } else {
                // Next Button for regular slides
                Button(action: {
                    if currentSlideIndex < lessonLength - 1 {
                        currentSlideIndex += 1
                    }
                }) {
                    Text("Next")
                        .padding(7)
                        .foregroundColor(Color("DarkBrown"))
                        .font(.custom("AveriaSansLibre-Regular", size: 25))
                        .background(nextSlideEnabled ? Color("Orange") : Color(.gray))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("DarkBrown"), lineWidth: 2)
                        )
                }
                .disabled(!nextSlideEnabled || currentSlideIndex >= lessonLength - 1)
            }
            
            Spacer()
        }
    }

    func nextLessonInfo() -> (SideMenuLessonModel?, String) {
        var nextLesson: SideMenuLessonModel?
        var newText: String = ""

        switch selectedLesson {
        case .Lesson1:
            nextLesson = .Lesson2
            newText = "Lesson 2"
        case .Lesson2:
            nextLesson = .Lesson3
            newText = "Lesson 3"
        default:
            newText = "Finished!"
        }

        return (nextLesson, newText)
    }
}
