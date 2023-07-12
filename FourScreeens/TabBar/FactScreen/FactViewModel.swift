import Foundation

 final class FactViewModel: ObservableObject {

    @Published var hasError: Bool = false
    @Published var data: [Fact]?
    @Published var filter: String = ""
    @Published var error: BackendError?
    
    @Injected var fetch: Fetching?

    init() {
        
        fetch?.fetchFacts(completion: { [weak self] in
            
            guard let self = self else { return }
            guard self.fetch != nil else { return }
            
            self.hasError = self.fetch!.isErrorFacts
            self.error = self.fetch!.errorFact
            self.data = self.fetch!.facts
        })
    }
}
 
