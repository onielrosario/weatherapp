import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    private let placeholder = "Search Location"
    
    let onSearch: (String) -> Void
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $searchText)
                .foregroundColor(.gray)
                .padding(.leading, 16)
            
                .onChange(of: searchText) { _, newValue in
                    onSearch(newValue)
                }
        
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing, 16)
        }
        .frame(height: 50)
        .background(
            Color(.secondarySystemBackground)
        )
        .cornerRadius(16)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchBar(searchText: .constant(""), onSearch: { _ in })
}
