//
//  ParsedTweet.swift
//  EliTweets
//
//  Created by Eli Alford-Jones on 7/14/15.
//  Copyright (c) 2015 Eli Alford-Jones. All rights reserved.
//

import UIKit

class ParsedTweet: NSObject {
    var tweetText : String?
    var userName : String?
    var createdAt : String?
    var userAvatarURL : NSURL?
    
    init (tweetText: String?, userName: String?, createdAt: String?, userAvatarURl: NSURL?){
        super.init()
        self.tweetText = tweetText;
        self.userName  = userName;
        self.createdAt = createdAt;
        self.userAvatarURL = userAvatarURL;
    }
    
    override init () {
        super.init()
    }
    
}
