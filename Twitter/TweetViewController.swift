//
//  TweetViewController.swift
//  Twitter
//
//  Created by Vidur Gupta on 2/10/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var txtFieldTweetBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtFieldTweetBox.becomeFirstResponder()
    }
    
    @IBAction func btnTweet(_ sender: Any) {
        if (!txtFieldTweetBox.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: txtFieldTweetBox.text, success: {
                self.dismiss(animated: true, completion: nil)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RELOAD_TWEETS"), object: nil);
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
