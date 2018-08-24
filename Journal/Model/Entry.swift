

import Foundation

class Entry: Equatable, Codable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.timestamp == rhs.timestamp && lhs.bodyText == rhs.bodyText
    }
    
    let timestamp: Date
    var title: String
    var bodyText: String
    
    init(title: String,timestamp: Date = Date(), bodyText: String) {
        self.title = title
        self.timestamp = timestamp
        self.bodyText = bodyText
    }
}


