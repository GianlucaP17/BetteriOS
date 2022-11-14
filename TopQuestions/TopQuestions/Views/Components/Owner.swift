import SwiftUI

// MARK: - Owner
struct Owner: View {
    let user: User
    
    private var image: Image {
        guard let profileImage = user.profileImage else {
            return Image(systemName: "questionmark.circle")
        }
        return Image(uiImage: profileImage)
    }
    
    var body: some View {
        HStack(spacing: 16.0) {
            image
                .resizable()
                .frame(width: 48.0, height: 48.0)
                .cornerRadius(8.0)
                .foregroundColor(.secondary)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(user.name ?? "")
                    .font(.headline)
                Text(user.reputation?.thousandsFormatting ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8.0)
    }
}
