import Foundation

final class SharedDataModel: ObservableObject {
 
    //laucher for moving between flow's
    @Published var launcher: Bool = false
    
    //for saving authStatus
    @Injected var dataCarataker: DataCaretaker?
    
    func saveAuthStatus() {
        launcher.toggle()
        dataCarataker?.saveAuth(launcher)
    }
    
    func getAuthStatus() -> Bool {
        dataCarataker?.loadAuth() ?? false
    }
}
