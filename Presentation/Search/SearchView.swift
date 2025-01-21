import SwiftUI

struct SearchView: View {
    @State var searchQuery: String
    @State private var debounceTask: Task<Void, Never>?
    
    let performSearch: (String) -> Void
    
    var body: some View {
        SearchBar(searchText: $searchQuery) { _ in }
            .onChange(of: searchQuery) { _, newValue in
                debounceTask?.cancel()
                
                debounceTask = Task {
                    try? await Task.sleep(nanoseconds: 500_000_000)
                    
                    if Task.isCancelled == false {
                        performSearch(newValue)
                    }
                }
            }
    }
}

#Preview {
    SearchView(searchQuery: "", performSearch: { _ in })
}
