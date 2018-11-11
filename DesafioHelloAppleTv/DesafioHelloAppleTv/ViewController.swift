//
//  ViewController.swift
//  DesafioHelloAppleTv
//
//  Created by Felipe perius on 04/05/16.
//  Copyright © 2016 bepid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var movies: [(title: String,description: String, relase: String,imageName: String)]!
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setupDataSource()
        collectionView.reloadData()
    }
    
    func setupDataSource() {
        
        if self.title == "Favoritos" {
            movies = Movies.favoriteMovies
        } else {
            movies = Movies.movies
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        self.collectionView = collectionView
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCell", forIndexPath: indexPath) as! MoviesItem
        item.movieItem = movies[indexPath.item]
        
        return item
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let item = sender as? MoviesItem,
            let controller = segue.destinationViewController as? DetailViewController{
            let movieItem = item.movieItem
            controller.movieItem = movieItem
            controller.title = self.title
        }
    }
}