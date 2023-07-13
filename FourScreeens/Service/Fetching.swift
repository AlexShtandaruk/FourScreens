import Foundation

final class Fetching {
    
    //facts
    @Published var isErrorFacts: Bool = false
    @Published var facts: [Fact]?
    @Published var errorFact: BackendError?
    
    //property wrapped
    @Injected var network: Networking!
    @Injected var storage: DataCaretaker!
    
    //method categories
    func fetchFacts(completion: @escaping () -> Void) {
        
        network.getFactData { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let model):
                self.facts = model
                
            case .failure(let error):
                self.isErrorFacts = true
                self.errorFact = error
            }
            completion()
        }
    }
}
