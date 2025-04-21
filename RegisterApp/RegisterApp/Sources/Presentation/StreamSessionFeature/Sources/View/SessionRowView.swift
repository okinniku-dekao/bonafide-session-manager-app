struct SessionRowView: View {
    let session: Session
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(session.name)
                    .font(.headline)
                    .foregroundStyle(Color.black)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 1, y: 1)
    }
}