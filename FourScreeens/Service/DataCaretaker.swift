import Foundation

final class DataCaretaker {
    
    // MARK: - PROPERTIES
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    // MARK: - data caretaker method's
    
    private func save<T: Codable>(_ data: [T], key: String) {
        do {
            let encodedData = try self.encoder.encode(data)
            UserDefaults.standard.set(encodedData, forKey: key)
        } catch {
            debugPrint(String(describing: error))
        }
    }
    
    private func load<T: Codable>(key: String) -> [T]? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        
        do {
            let data = try self.decoder.decode([T].self, from: data)
            return data
        } catch {
            debugPrint(String(describing: error))
            return nil
        }
    }
    
    // MARK: - Authorization caretaker method's
    
    func saveAuth(_ auth: Bool) {
       UserDefaults.standard.set(auth, forKey: Constant.authKey)
   }
    
    func loadAuth() -> Bool? {
        UserDefaults.standard.bool(forKey: Constant.authKey)
    }
}

extension DataCaretaker {
    
    func saveText(data: [String]) {
        save(data, key: Constant.textFieldKey)
    }
    
    func loadText() -> [String]? {
        load(key: Constant.textFieldKey)
    }
}

// MARK: - Constant's

extension DataCaretaker {
    enum Constant {
        static let textFieldKey = "textField"
        static let authKey = "auth"
    }
}
