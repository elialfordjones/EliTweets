//
//  ViewController.swift
//  EliTweets
//
//  Created by Eli Alford-Jones on 6/20/15.
//  Copyright (c) 2015 Eli Alford-Jones. All rights reserved.
//  test change?

import UIKit
import Social

public class ViewController: UIViewController {

    @IBOutlet public weak var twitterWebView: UIWebView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        reloadTweets()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleShowMyTweetsTapped(sender: UIButton) {
        reloadTweets()
    }
    
    func reloadTweets(){
        let url = NSURL (string:"http://www.twitter.com/elialfordj")
        let urlRequest = NSURLRequest (URL: url!)
        twitterWebView.loadRequest(urlRequest)
    }
    
    @IBAction func handleTweetButtonTapped(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let tweetVC = SLComposeViewController (forServiceType: SLServiceTypeTwitter)
            let message = NSLocalizedString("test tweet copy #1",comment:" ")
            tweetVC.setInitialText(message)
            presentViewController(tweetVC, animated: true, completion: nil)
        } else {
            println("handle tweet button failure log")
        }
    }

}

