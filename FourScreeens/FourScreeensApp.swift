import SwiftUI

@main
struct FourScreeensApp: App {
    
    private var configurator: Configurator? = nil
    
    init() { configurate() }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    mutating func configurate() {
        self.configurator = Configurator()
        self.configurator?.register()
    }
}
