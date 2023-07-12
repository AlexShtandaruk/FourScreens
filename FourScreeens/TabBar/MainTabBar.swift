import SwiftUI

// to use custom font on all pages
let customFont = "Montserrat-Regular"

struct MainTabBar: View {
    
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().isHidden = true
    }
    
    //current tab
    @State var currentTab: Tab = .storage
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            //tab view
            
            TabView(selection: $currentTab) {
                
                HomeScreen()
                    .tag(Tab.storage)
                
                FactScreen()
                    .tag(Tab.fact)
                
                MovingScreen()
                    .environmentObject(sharedData)
                    .tag(Tab.web)
            }
            
            //custom tab bar
            VStack(spacing: 4) {
                
                Rectangle()
                    .fill(Color("separator"))
                    .frame(height: 0.5)
                    .offset(y: -8)
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button(action: {
                            
                            //updating tab
                            currentTab = tab
                        }) {
                            VStack {
                                Image(systemName: tab.image)
                                    .frame(width: 27, height: 27)
                                Text(tab.title)
                                    .font(.custom(customFont, size: 10))
                            }
                            //appling little shadow at background
                            .background(
                                Color("selectedTab")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                //bluring
                                    .blur(radius: 5)
                                //making little big
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("selectedTab") : Color("unselectedTab"))
                        }
                    }
                }
            }
        }
        .background(Color("background").ignoresSafeArea())
    }
}

// tab cases, #2 make case iterable
enum Tab: CaseIterable {
    
    //raw value must be image name in asset
    case storage
    case fact
    case web
    
    var title: String {
        switch self {
        case .storage:
            return Constant.storage.localized()
        case .fact:
            return Constant.fact.localized()
        case .web:
            return Constant.web.localized()
        }
    }
    
    var image: String {
        switch self {
        case .storage:
            return "externaldrive.fill.badge.checkmark"
        case .fact:
            return "folder.fill.badge.questionmark"
        case .web:
            return "cloud.fill"
        }
    }
}

// localization

extension Tab {
    struct Constant {
        static let storage = "tab.storage"
        static let fact = "tab.fact"
        static let web = "tab.web"
    }
}

