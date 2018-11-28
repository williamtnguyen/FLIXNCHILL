//
//  FandangoViewController.swift
//  Flix
//
//  Created by William Nguyen on 11/22/18.
//  Copyright © 2018 William Nguyen. All rights reserved.
//

import UIKit
import WebKit

class FandangoViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    
    var movieTitle = ""
    var navTitle = "More Info"
    var movieIMDBid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.tabBar.isHidden = true
        self.navBar.title = navTitle
        
        var url = "\(movieTitle) + fandango".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if navTitle == "Watch Trailer" {
            url = "\(movieTitle) + IMDB trailer title".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        url = "https://www.google.com/search?q="+url+"&btnI" //Utilizing Google's I'm Feeling Lucky function
        
        let movieURL = URL(string: url)!
        let urlRequest = URLRequest(url: movieURL)
        myWebView.load(urlRequest)
        
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
