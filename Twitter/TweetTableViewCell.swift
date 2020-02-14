//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Vidur Gupta on 2/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var btnRetweet: UIButton!
    @IBOutlet weak var btnFavorite: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func tweetFavorited(_ sender: Any) {
        if (!favorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFav(true)
            }, failure: { (error) in
                print("Favorite did not succeed \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFav(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed \(error)")
            })
        }
    }
    
    @IBAction func tweetRetweeted(_ sender: Any) {
        TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Retweet did not succeed \(error)")
        })
    }
    
    
    func setFav(_ isFavorited:Bool) {
        favorited = isFavorited
        
        if (isFavorited) {
            btnFavorite.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            btnFavorite.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if (isRetweeted) {
            btnRetweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        } else {
            btnRetweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
}
