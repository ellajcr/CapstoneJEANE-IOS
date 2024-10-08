import SwiftUI

struct ContentView: View {
    @State private var currentSlideIndex = 0
    @State private var nextSlideEnabled: Bool = true
    @State private var isCorrectAnswer: Bool = false
    @Binding var showMenu: Bool
    @State private var selectedLesson: SideMenuLessonModel? = .Lesson1
    @State private var lessonLength = 0
    
    var contentItems: [ContentItem] {
        if let lesson = selectedLesson {
            return loadContentItems(from: lesson.title)
        } else {
            return []
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ProgressBar(progress: CGFloat(currentSlideIndex * 350) / CGFloat(lessonLength), finishedProgress: currentSlideIndex == (lessonLength - 1))

                    if contentItems.indices.contains(currentSlideIndex) {
                        let currentItem = contentItems[currentSlideIndex]
                        destinationView(for: currentItem)
                            .transition(.slide)
                            .padding()
                    }

                    Spacer()
                    NavButtons(currentSlideIndex: $currentSlideIndex, nextSlideEnabled: $nextSlideEnabled, lessonLength: $lessonLength, selectedLesson: $selectedLesson)
                }

                SideMenuView(showMenu: $showMenu, selectedLesson: $selectedLesson)
            }
            .onChange(of: selectedLesson) { _ in
                currentSlideIndex = 0
                lessonLength = contentItems.count
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .background(Color("Background"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .foregroundColor(Color("DarkBrown"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            lessonLength = contentItems.count
        }
    }
    
    @ViewBuilder
    func destinationView(for item: ContentItem) -> some View {
        switch item.type {
        case .lecture:
            LectureView(content: item, nextSlideEnabled: $nextSlideEnabled)
                .onAppear {
                    nextSlideEnabled = true
                }
        case .quiz:
            QuizView(nextSlideEnabled: $nextSlideEnabled, content: item)
            .onAppear {
                nextSlideEnabled = false
                }
        }
    }
}







