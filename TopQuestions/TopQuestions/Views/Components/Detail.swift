import SwiftUI

// MARK: - Details
struct Details: View {
    let question: Question
    
    private var tags: String {
        question.tags[0] + question.tags.dropFirst().reduce("") { $0 + ", " + $1 }
        ///[ciao,prova,we] > ciao,prova,we
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(question.title)
                .font(.headline)
            Text(tags)
                .font(.footnote)
                .bold()
                .foregroundColor(.accentColor)
            Text(question.date.formatted)
                .font(.caption)
                .foregroundColor(.secondary)
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Label("\(question.score.thousandsFormatting)", systemImage: "arrowtriangle.up.circle")
                Label("\(question.answerCount.thousandsFormatting)", systemImage: "ellipses.bubble")
                    .padding(.leading, 108.0)
                Label("\(question.answerCount.thousandsFormatting)", systemImage: "eye")
                    .padding(.leading, 204.0)
            }
            .foregroundColor(.teal)
        }
        .padding(.top, 24.0)
        .padding(.bottom, 16.0)
    }
}
