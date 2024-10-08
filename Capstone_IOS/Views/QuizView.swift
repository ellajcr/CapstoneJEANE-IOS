import SwiftUI

struct QuizView: View {
    @State private var selectedAnswerIndex: Int? = nil
    @State private var showResults: Bool = false
    @State private var isCorrectAnswer: Bool = false
    @Binding var nextSlideEnabled: Bool
    
    let content: ContentItem
    
    var body: some View {
        VStack {
            if !showResults {
                QuizQuestionView(
                    content: content,
                    selectedAnswerIndex: $selectedAnswerIndex,
                    showResults: $showResults,
                    isCorrectAnswer: $isCorrectAnswer,
                    nextSlideEnabled: $nextSlideEnabled
                )
            } else if let selectedAnswerIndex = selectedAnswerIndex {
                let explanation = content.quiz!.choices[selectedAnswerIndex].explanation
                
                QuizAnsView(
                    explanation: explanation,
                    isCorrectAnswer: isCorrectAnswer,
                    showResults: $showResults,
                    selectedAnswerIndex: $selectedAnswerIndex
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

struct QuizQuestionView: View {
    let content: ContentItem
    @Binding var selectedAnswerIndex: Int?
    @Binding var showResults: Bool
    @Binding var isCorrectAnswer: Bool
    @Binding var nextSlideEnabled: Bool
    
    var body: some View {
        VStack {
            Text(content.quiz!.question)
                .font(.custom("GermaniaOne-Regular", size: 28))
                .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(content.quiz!.choices.indices, id: \.self) { index in
                    Button(action: {
                        selectedAnswerIndex = index
                        isCorrectAnswer = index == content.quiz!.answerIndex
                        nextSlideEnabled = isCorrectAnswer
                        showResults = true
                    }) {
                        Text(content.quiz!.choices[index].name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("DarkBrown"))
                            .cornerRadius(8)
                            .font(.custom("AveriaSansLibre-Regular", size: 18))
                            .background(Color("Cream"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("DarkBrown"), lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
}

struct QuizAnsView: View {
    let explanation: String
    let isCorrectAnswer: Bool
    @Binding var showResults: Bool
    @Binding var selectedAnswerIndex: Int?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text(explanation)
                        .font(.custom("AveriaSansLibre-Regular", size: 20))
                        .padding()
                }
                .padding()
            }
            .background(Color("Cream"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("DarkBrown"), lineWidth: 2)
            )
            .fixedSize(horizontal: false, vertical: true)
            Spacer()
            if !isCorrectAnswer {
                Button(action: {
                    showResults = false
                    selectedAnswerIndex = nil
                }) {
                    
                    Text("Try Again")
                        .font(.custom("AveriaSansLibre-Regular", size: 25))
                        .padding(8)
                        .foregroundColor(Color("DarkBrown"))
                        .background(Color("LightGreen"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("DarkBrown"), lineWidth: 2)
                        )
                }
            }
            Spacer()
        }
    }
}
