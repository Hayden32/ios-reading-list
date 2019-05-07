//
//  BookController.swift
//  Reading List
//
//  Created by Hayden Hastings on 5/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    func createBook(titled title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        
        books.append(book)
        saveToPersistantStore()
    }
    
    func delete(of book: Book) {
        guard let index = books.firstIndex(of: book) else { return }
        books.remove(at: index)
        
        saveToPersistantStore()
    }
    
//    func updateHasBeenRead(for book: Book) {
//        book.hasBeenRead = !book.hasBeenRead
//
//        saveToPersistantStore()
//    }
    
    func update(book: Book, reasonToRead: String, hasBeenRead: Bool) {
        guard let index = books.index(of: book) else { return }
        
        books[index].reasonToRead = reasonToRead
        books[index].hasBeenRead = hasBeenRead
        
        saveToPersistantStore()
    }
    
    func loadFromPersistantStore() {
        // make sure file exists
        let fileManager = FileManager.default
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedBooks = PropertyListDecoder()
            books = try decodedBooks.decode([Book].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    func saveToPersistantStore() {
        guard let url = readingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print("Error saving to persistant store. \(error)")
        }
    }
    
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        print("Documents: \(documents.path)")
        
        return documents.appendingPathComponent("readingList.plist")
    }
    
    var books: [Book] = []
}
