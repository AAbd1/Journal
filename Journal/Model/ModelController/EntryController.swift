

import Foundation

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    func createEntry(title: String,bodyText: String) {
        
        let addEntry = Entry(title: title, bodyText: bodyText)
        entries.append(addEntry)
        saveToPersistence()
    }
    
    func delete(entry: Entry) {
        guard let index = entries.index(of: entry) else {return}
        EntryController.shared.entries.remove(at: index)
        saveToPersistence()
    }
    
    
    func update(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        saveToPersistence()
    }
    
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistence() {
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    func loadToPersistence() -> [Entry] {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            return entries
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    
}
