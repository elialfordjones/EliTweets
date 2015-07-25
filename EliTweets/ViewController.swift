//
//  ViewController.swift
//  EliTweets
//
//  Created by Eli Alford-Jones on 6/20/15.
//  Copyright (c) 2015 Eli Alford-Jones. All rights reserved.
//  test commit comment for tanner

import UIKit
import Social

let defaultAvatarURL = NSURL(string: "https://abs.twimg.com/sticky/default_profile_images/default_profile_1_200x200.png")

public class ViewController: UITableViewController {
    
    var parsedTweets : Array <ParsedTweet> = [
        ParsedTweet(
            tweetText: "IOS 8 SDK now in print",
            userName: "@elialfordj",
            createdAt: "2015-07-14 15:08:00 PDT",
            userAvatarURL: defaultAvatarURL ),
    
        ParsedTweet(
            tweetText: "math is cool",
            userName: "@elialfordj",
            createdAt: "2015-07-14 15:08:12 PDT",
            userAvatarURL: defaultAvatarURL ),
     
        ParsedTweet(
            tweetText: "art is cool",
            userName: "@elialfordj",
            createdAt: "2015-07-14 15:08:40 PDT",
            userAvatarURL: defaultAvatarURL )
        
    ]
    
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    override public func tableView(_tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override public func tableView(_tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }
    
    override public func tableView(_tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = "Row \(indexPath.row)"
        return cell
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        reloadTweets()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadTweets(){

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



