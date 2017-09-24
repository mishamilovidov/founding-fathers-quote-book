//
//  Quotes.swift
//  Founding Fathers Quote Book
//
//  Created by Misha Milovidov on 9/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class Quote {
    
    // MARK: - Properties
    
    var text: String
    var speaker: String
    var tags: [String]
    
    // MARK: - Initialization
    
    init(text: String, speaker: String, tags: [String]) {
        self.text = text
        self.speaker = speaker
        self.tags = tags
    }
}
