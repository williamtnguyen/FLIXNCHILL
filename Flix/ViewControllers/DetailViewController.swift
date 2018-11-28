//
//  DetailViewController.swift
//  Flix
//
//  Created by William Nguyen on 9/10/18.
//  Copyright © 2018 William Nguyen. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
   
    
    var movie: Movie!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.tabBar.isHidden = true
        if let movie = movie {
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            
            posterImageView?.af_setImage(withURL: movie.posterURL)
            backDropImageView?.af_setImage(withURL: movie.backdropURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.hidesBottomBarWhenPushed = true
        if segue.identifier == "toFandango" {
            let FandangoViewController = segue.destination as! FandangoViewController
            FandangoViewController.navTitle = "Showtimes & Tickets"
            
            let movieTitle = movie.title
            let movie_imdbID = movie.imdbID
            FandangoViewController.movieTitle = movieTitle ?? "No title"
            FandangoViewController.movieIMDBid = movie_imdbID! //?? "No IMDB ID"
        }
        else if segue.identifier == "toTrailer" {
            let FandangoViewController = segue.destination as! FandangoViewController
            FandangoViewController.navTitle = "Watch Trailer"
            
            let movieTitle = movie.title
            let movie_imdbID = movie.imdbID
            FandangoViewController.movieTitle = movieTitle ?? "No title"
            FandangoViewController.movieIMDBid = movie_imdbID! //?? "No IMDB ID"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
