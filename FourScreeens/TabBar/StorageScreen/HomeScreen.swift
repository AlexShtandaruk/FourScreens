import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: HomeViewModel = .init()
    
    @State private var showAlert: Bool = false
    @State private var addedText: String = ""
    
    var body: some View {
        
        VStack {
            
            //textfield
            TextField(Constant.textFieldPlaceholder.localized(), text: $addedText)
                .autocorrectionDisabled(true)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            //add button
            Button {
                if addedText != "" {
                    viewModel.save(text: addedText)
                    addedText = ""
                }
                else {
                    showAlert = true
                }
            } label: {
                Text(Constant.addButton.localized())
                    .font(.custom(customFont, size: 15))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.indigo)
            .cornerRadius(20)
            .padding(20)
            
            //remove button
            Button {
                viewModel.remove()
            } label: {
                Text(Constant.removeButton.localized())
                    .font(.custom(customFont, size: 15))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.indigo)
            .cornerRadius(20)
            .padding(20)
            
            //values from storage
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.load(), id: \.self) { str in
                    Text(str)
                        .font(.custom(customFont, size: 15))
                        .foregroundColor(.primary)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(Constant.alertTitle.localized()),
                    message: Text(Constant.alertMessage.localized()),
                    dismissButton: .cancel()
                )
            }
        }
        
        .onAppear {
            viewModel.reloadStorage()
        }
    }
}

// localization

extension HomeScreen {
    struct Constant {
        static let textFieldPlaceholder = "homeScreen.textFieldPlaceholder"
        static let addButton = "homeScreen.addButton"
        static let removeButton = "homeScreen.removeButton"
        static let alertTitle = "homeScreen.alertTitle"
        static let alertMessage = "homeScreen.alertMessage"
    }
}
