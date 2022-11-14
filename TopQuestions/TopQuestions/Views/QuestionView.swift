import SwiftUI

// MARK: - QuestionView
struct QuestionView: View {
	@StateObject private var dataModel: QuestionDataModel
	
	init(question: Question) {
		let dataModel = QuestionDataModel(question: question)
		_dataModel = StateObject(wrappedValue: dataModel)
	}
	
	var body: some View {
		ScrollView(.vertical) {
			LazyVStack(alignment: .leading) {
				Details(question: dataModel.question)
				if dataModel.isLoading {
					ProgressView()
						.frame(maxWidth: .infinity, alignment: .center)
				} else {
					if let body = dataModel.question.body {
						Text(body)
					}
					if let owner = dataModel.question.owner {
						Owner(user: owner)
							.frame(maxWidth: .infinity, alignment: .trailing)
					}
				}
			}
			.padding(.horizontal, 20.0)
		}
		.navigationTitle("Detail")
		.onAppear {
			dataModel.loadQuestion()
		}
	}
}
