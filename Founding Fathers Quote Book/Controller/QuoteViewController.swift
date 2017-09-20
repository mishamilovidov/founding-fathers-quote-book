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
    var quotes: [Quote]!
    var topic: String?
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        quotes = QuoteDeck.sharedInstance.quotes
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
    
    private func configure() {
        if let currentTopic = topic {
            quotes = QuoteDeck.sharedInstance.quotesForTag(currentTopic)
            currentQuoteIndex = 0
        } else {
            quotes = QuoteDeck.sharedInstance.quotes
            chooseQuoteOfTheDay()
        }
        
        updateUI()
    }
    
    private func updateUI() {
        let currentQuote = quotes[currentQuoteIndex]
        
        webView.loadHTMLString(currentQuote.htmlPage(), baseURL: nil)
    }
    
    // MARK: - Segues
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        topic = nil
        configure()
    }
    
    @IBAction func showTopicQuotes(_ segue: UIStoryboardSegue) {
        configure()
    }
}
