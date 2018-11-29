//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by William Nguyen on 9/2/18.
//  Copyright © 2018 William Nguyen. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.title = "Now Playing"
        if let currentUser = PFUser.current() {
            //var alertController = UIAlertController(title: "Welcome Back", message: "Welcome Back \(currentUser.username!)", preferredStyle: .alert)
            self.createAlert(title: "Welcome Back!", message: "We missed you, \(currentUser.username!) 🤑😫")
        }
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.dataSource = self
        tableView.rowHeight = 200
        //tableView.estimatedRowHeight = 200
        fetchMovies()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies()
    }
    
    func fetchMovies() {
       
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.titleLabel.sizeToFit()
        
        cell.overviewLabel.text = movie.overview
        cell.overviewLabel.sizeToFit()
        
        cell.posterImageView?.af_setImage(withURL: movie.posterURL!)
        
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
            detailViewController.hidesBottomBarWhenPushed = true
        }
    }
    
    func createAlert(title : String, message : String){
        let Alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        Alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in Alert.dismiss(animated: true, completion: nil)}))
        Alert.view.tintColor = UIColor.darkGray
        self.present(Alert, animated: true, completion: nil)
    }




override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}
