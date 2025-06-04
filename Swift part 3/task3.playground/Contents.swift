let books = [
["title": "Swift Fundamentals", "author": "John Doe", "year": 2015, "price": 40, "genre": ["Programming", "Education"]],
["title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925, "price": 15, "genre": ["Classic", "Drama"]],
["title": "Game of Thrones", "author": "George R. R. Martin", "year": 1996, "price": 30, "genre": ["Fantasy", "Epic"]],
["title": "Big Data, Big Dupe", "author": "Stephen Few", "year": 2018, "price": 25, "genre": ["Technology", "Non-Fiction"]],
["title": "To Kill a Mockingbird", "author": "Harper Lee", "year": 1960, "price": 20, "genre": ["Classic", "Drama"]]
]

let discountedPrices = books.compactMap { book -> Double? in
    if let price = book["price"] as? Double {
        return price * 0.9
    } else if let price = book["price"] as? Int {
        return Double(price) * 0.9
    }
    return nil
}

let booksPostedAfter2000 = books.compactMap { book -> String? in
    guard let year = book["year"] as? Int, year > 2000 else { return nil }
    return book["title"] as? String
}

let allGenres = Set(books.flatMap { book -> [String] in
    return book["genre"] as? [String] ?? []
})

let totalCost = books.reduce(0.0) { (result, book) -> Double in
    if let price = book["price"] as? Double {
        return result + price
    } else if let price = book["price"] as? Int {
        return result + Double(price)
    }
    return result
}

/*
 print("Discounted Prices: \(discountedPrices)")
 print("Books after 2000: \(booksPostedAfter2000)")
 print("All Genres: \(allGenres)")
 print("Total Cost: \(totalCost)")
 */
