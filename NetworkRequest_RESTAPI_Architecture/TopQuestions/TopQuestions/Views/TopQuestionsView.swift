import SwiftUI

// MARK: - TopQuestionsView
struct TopQuestionsView: View {
	@StateObject private var dataModel = QuestionsDataModel()
	
	var body: some View {
		List(dataModel.questions) { question in
			NavigationLink(destination: QuestionView(question: question)) {
				Details(question: question)
			}
		}
		.navigationTitle("Top Questions")
		.onAppear {
			dataModel.fetchTopQuestions()
		}
	}
}

