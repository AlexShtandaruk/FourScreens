import SwiftUI

struct MovingScreen: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        Button {
            sharedData.saveAuthStatus()
        } label: {
            Text(Constant.button.localized())
                .font(.custom(customFont, size: 15))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(20)
    }
}

// localization

extension MovingScreen {
    struct Constant {
        static let button = "movingScreen.button"
    }
}
