//
//  WebViewTests.swift
//  EliTweets
//
//  Created by Eli Alford-Jones on 7/5/15.
//  Copyright (c) 2015 Eli Alford-Jones. All rights reserved.
//

import UIKit
import XCTest
import EliTweets

class WebViewTests: XCTestCase, UIWebViewDelegate {
    
    var loadedWebViewExpectation : XCTestExpectation?

    func testAutomaticWebLoad(){
        if let viewController = UIApplication.sharedApplication().windows[0].rootViewController
            as? ViewController {
                viewController.twitterWebView.delegate = self
                loadedWebViewExpectation =
                    expectationWithDescription("web view auto-load test")
                waitForExpectationsWithTimeout(5.0, handler: nil)
        } else {
            XCTFail("couln't get root view controller")
        }
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        XCTFail("web view load failed")
        loadedWebViewExpectation!.fulfill()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        if let webViewContents =
            webView.stringByEvaluatingJavaScriptFromString("document.documentElement.textContent") {
                if webViewContents != "" {
                    loadedWebViewExpectation!.fulfill()
                }
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


}
