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
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadHTMLString("""
                                <!DOCTYPE html>
                                <html>
                                <head>
                                    <title>Quote of the Day</title>
                                    <meta name="viewport" content="initial-scale=1.0">
                                    <style>
                                        body { position: relative; padding: 2em; }

                                        .quote { font-size: 24pt; font-style: italic; }
                                        .speaker { text-align: right; font-size: 18pt; padding-top: 1.5em; }
                                        .speaker::before { content: "— "; }
                                        .container {
                                        position: absolute; left: 0; top: 0;
                                        padding: 2em;
                                        transition: opacity 1s ease-in-out;
                                        }

                                        #quote1 { opacity: 1; }
                                        #quote2 { opacity: 0; }
                                    </style>
                                    <script type="text/javascript">
                                        function toggleQuote(quote, speaker) {
                                        var q1 = document.getElementById('quote1');
                                        var q2 = document.getElementById('quote2');
                                        var style = window.getComputedStyle(q1);
                                        var t1 = q1, t2 = q2;

                                        if (style.opacity <= 0) {
                                        t1 = q2;
                                        t2 = q1;
                                        }

                                        t2.getElementsByClassName('quote')[0].innerHTML = quote;
                                        t2.getElementsByClassName('speaker')[0].innerHTML = speaker;
                                        t1.style.opacity = 0;
                                        t2.style.opacity = 1;
                                        }
                                    </script>
                                    </head>
                                <body>
                                    <div id="quote1" class="container">
                                        <div class="quote">Test</div>
                                        <div class="speaker">testing.</div>
                                    </div>
                                    <div id="quote2" class="container">
                                        <div class="quote"></div>
                                        <div class="speaker"></div>
                                    </div>
                                    </body>
                                </html>
                               """, baseURL: nil)
    }
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        // Nothing to do; jsut need a target for the unwind segue
    }
}
