//
//  QuoteViewController.swift
//  Founding Fathers Quote Book
//
//  Created by Misha Milovidov on 9/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit
import WebKit

class QuoteViewController : UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var webView: WKWebView!
    
    // MARK: - Properties
    
    var currentQuoteIndex = 0
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseQuoteOfTheDay()
        updateUI()
    }
    
    // MARK: - Helpers
    
    private func chooseQuoteOfTheDay() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "DDD"
        if let dayInYear = Int(formatter.string(from: Date())) {
            currentQuoteIndex = dayInYear % QuoteDeck.sharedInstance.quotes.count
        }
    }
    
    private func updateUI() {
        let currentQuote = QuoteDeck.sharedInstance.quotes[currentQuoteIndex]
        
        webView.loadHTMLString(currentQuote.htmlPage(), baseURL: nil)
    }
    
    // MARK: - Segues
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        // Nothing to do; jsut need a target for the unwind segue
    }
}
