import SwiftUI

struct ContentView: View {
    
    @StateObject var sharedData: SharedDataModel = .init()
    
    var body: some View {
        if sharedData.getAuthStatus() == false {
            MainTabBar()
                .environmentObject(sharedData)
        } else {
            WebScreen()
                .environmentObject(sharedData)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
