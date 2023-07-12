import SwiftUI

struct FactScreen: View {
    
    @ObservedObject var viewModel: FactViewModel = .init()
    
    var body: some View {
        
        //scroll view
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 10) {
                (
                    Text(Constant.titlePartOne.localized())
                        .font(.custom(customFont, size: 22).bold())
                        .foregroundColor(.primary)
                    +
                    Text(Constant.titlePartTwo.localized())
                        .font(.custom(customFont, size: 22).bold())
                        .foregroundColor(.gray)
                )
                
                ForEach(viewModel.data ?? []) { fact in
                    Text(fact.fact ?? String())
                        .font(.custom(customFont, size: 15))
                        .foregroundColor(.indigo)
                        .padding(.horizontal)
                }
                
            }
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(
                title: Text(Constant.alertTitle.localized()),
                message: Text(viewModel.error?.localizedDescription ?? String()),
                dismissButton: .cancel()
            )
        }
    }
}

// localization

extension FactScreen {
    struct Constant {
        static let titlePartOne = "factScreen.titlePartOne"
        static let titlePartTwo = "factScreen.titlePartTwo"
        static let alertTitle = "factScreen.alertTitle"
    }
}



