import Foundation

struct EndPoint {
    
    static func getFactUrl() -> URL {
        let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=10")!
        return url
    }
    
    static func getGoogleUrl() -> URL {
        let url = URL(string: "https://www.google.com/?client=safari")!
        return url
    }
}



