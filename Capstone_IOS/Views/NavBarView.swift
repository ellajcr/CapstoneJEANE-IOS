import SwiftUI

struct SideMenuView: View {
    @Binding var showMenu: Bool
    @Binding var selectedLesson: SideMenuLessonModel?

    var body: some View {
        ZStack {
            if showMenu {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { showMenu.toggle() }

                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()

                        VStack {
                            ForEach(SideMenuLessonModel.allCases, id: \.self) { lesson in
                                Button(action: {
                                    selectedLesson = lesson
                                }, label: {
                                    SideMenuRowView(lesson: lesson, selectedLesson: $selectedLesson)
                                })
                            }
                        }

                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color(red: 1.0, green: 0.992, blue: 0.902))
                    .foregroundColor(Color("DarkBrown"))

                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: showMenu)
        .navigationBarBackButtonHidden(true) 
    }
}

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image("dragon")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)

            VStack(alignment: .leading, spacing: 6) {
                Text("How To Train Your Chatbot")
                    .font(.subheadline)
            }
        }
    }
}

struct SideMenuRowView: View {
    let lesson: SideMenuLessonModel
    @Binding var selectedLesson: SideMenuLessonModel?

    private var isSelected: Bool {
        return selectedLesson == lesson
    }

    var body: some View {
        HStack {
            Image(systemName: "star")
                .imageScale(.small)
            Text(lesson.title)
                .font(.subheadline)

            Spacer()
        }
        .padding(.leading)
        .frame(width: 216, height: 44)
        .background(isSelected ? .green.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .navigationBarBackButtonHidden(true)
    }
}

enum SideMenuLessonModel: Int, CaseIterable {
    case Lesson1
    case Lesson2
    case Lesson3

    var title: String {
        switch self {
        case .Lesson1:
            return "Lesson 1"
        case .Lesson2:
            return "Lesson 2"
        case .Lesson3:
            return "Lesson 3"
        }
    }
}



