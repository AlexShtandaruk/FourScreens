import SwiftUI

struct WebScreen: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        VStack {
            // web view
            WebView(url: EndPoint.getGoogleUrl())
                .swipe(right: { sharedData.saveAuthStatus() } )
        }
    }
}
