import Foundation

protocol Borrowable {
    var borrowDate: Date? { get set }
    var returnDate: Date? { get set }
    var isBorrowed: Bool { get set }
    
    mutating func checkIn()
}

extension Borrowable {
    func isOverdue() -> Bool {
        guard let returnDate = returnDate else { return false }
        return Date() > returnDate
    }
    
    mutating func checkIn() {
        borrowDate = nil
        returnDate = nil
        isBorrowed = false
    }
}

enum LibraryError: Error {
    case itemNotFound
    case itemNotBorrowable
    case alreadyBorrowed
}

class Item {
    let id: String
    let title: String
    let author: String
    
    init(id: String, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
}

class Book: Item, Borrowable {
    var borrowDate: Date?
    var returnDate: Date?
    var isBorrowed: Bool = false
    
    func borrow(forDays days: Int) {
        borrowDate = Date()
        returnDate = Calendar.current.date(byAdding: .day, value: days, to: Date())
        isBorrowed = true
    }
}

class Library {
    private var items: [String: Item] = [:]
    
    func addBook(_ book: Book) {
        items[book.id] = book
    }
    
    func borrowItem(by id: String) throws -> Item {
        guard let item = items[id] else {
            throw LibraryError.itemNotFound
        }
        
        guard var borrowableItem = item as? Borrowable else {
            throw LibraryError.itemNotBorrowable
        }
        
        if borrowableItem.isBorrowed {
            throw LibraryError.alreadyBorrowed
        }
        
        borrowableItem.borrowDate = Date()
        borrowableItem.returnDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
        borrowableItem.isBorrowed = true
        
        if let book = item as? Book {
            items[id] = book
        }
        
        return item
    }
    
    func returnItem(by id: String) throws {
        guard let item = items[id] else {
            throw LibraryError.itemNotFound
        }
        
        guard var borrowableItem = item as? Borrowable else {
            throw LibraryError.itemNotBorrowable
        }
        
        borrowableItem.checkIn()
        
        if let book = item as? Book {
            items[id] = book
        }
    }
}
/*
let library = Library()

let book1 = Book(id: "001", title: "Swift Programming", author: "Apple")
let book2 = Book(id: "002", title: "Clean Code", author: "Robert Martin")

library.addBook(book1)
library.addBook(book2)
    
do {
    let borrowedItem = try library.borrowItem(by: "001")
    print("Successfully borrowed: \((borrowedItem as! Book).title)")
    
    try library.borrowItem(by: "001")
    
} catch LibraryError.alreadyBorrowed {
    print("Error: Book is already borrowed")
} catch LibraryError.itemNotFound {
    print("Error: Book not found")
} catch {
    print("Unknown error occurred")
}
    
do {
    try library.borrowItem(by: "999")
} catch LibraryError.itemNotFound {
    print("Error: Book not found")
} catch {
    print("Unknown error occurred")
}
do {
    try library.returnItem(by: "001")
    print("Book returned successfully")
} catch {
    print("Error returning book")
}
*/
