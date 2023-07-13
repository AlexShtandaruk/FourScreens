import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var textArray: [String] = []
    
    @Injected var dataCarataker: DataCaretaker?
    
    func load() -> [String] {
        dataCarataker?.loadText() ?? []
    }
    
    func save(text: String) {
        textArray.append(text)
        dataCarataker?.saveText(data: textArray)
    }
    
    func remove() {
        textArray.removeAll()
        dataCarataker?.saveText(data: textArray)
    }
    
    func reloadStorage() {
        textArray = dataCarataker?.loadText() ?? []
    }
}
 
