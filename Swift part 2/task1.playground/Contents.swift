import UIKit
import CryptoKit
struct User {
    let username : String
    let email : String
    let passwordHash : String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.passwordHash = User.hashPassword(password: password)
    }
    
    static func hashPassword(password: String) -> String {
        let data = Data(password.utf8)
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap{ String(format: "%02x", $0)}.joined()
    }
    
    func verifyPassword(password: String) -> Bool {
        return User.hashPassword(password: password) == self.passwordHash
    }
}

class UserManager {
    var users: [String: User] = [:]
    
    func registerUser(username: String, email: String, password: String) -> Bool {
        if users[username] != nil {
            return false
        }
        
        let user = User(username: username, email: email, password: password)
        
        users[username] = user
        return true
    }
    func login(username: String, password: String) -> Bool {
        guard let user = users[username] else {
            return false
        }
        return user.verifyPassword(password: password)
    }
    func removeUser(username: String) -> Bool {
        if users.removeValue(forKey: username) != nil {
            return true
        } else {
            return false
        }
    }
    
    var userCount: Int {
        return users.count
    }
}

class AdminUser: UserManager {
    override init() {
        super.init()
        print("Admin initialized")
    }
    func listAll() -> [String] {
        return Array(users.keys)
    }
    
    deinit {
        print("Admin deinitialized")
    }
    
}
/*
 let user = User(username: "john", email: "john@outlook.com", password: "password")
 
 print(user.passwordHash)
 
 print(user.verifyPassword(password: "password"))
 print(user.verifyPassword(password: "drowssap"))
 
 let admin = AdminUser()
 
 admin.registerUser(username: "adam", email: "adam@gmail.com", password: "apassowrd")
 admin.registerUser(username: "mada", email: "mada@gmail.com", password: "_apassowrd")
 print("User count: \(admin.userCount)")
 print("All user count: \(admin.listAll())")
 *ß/
