//
//  MovieViewController.swift
//  VIPER-demo
//
//  Created by Bipin on 7/2/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieViewController: UIViewController {

    var moviePresenter:ViewToPresenterMovieProtocol?
    
    @IBOutlet weak var myTableView: UITableView!
    var arrayList:Array<MovieModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movie-Module"
        moviePresenter?.startFetchingMovie()
        showProgressIndicator(view: self.view)
        
        myTableView.delegate = self
        myTableView.dataSource = self

    }

}

extension MovieViewController:PresenterToViewMovieProtocol{
    
    func onMovieResponseSuccess(movieModelArrayList: Array<MovieModel>) {
        
        self.arrayList = movieModelArrayList
        self.myTableView.reloadData()
        hideProgressIndicator(view: self.view)
        
    }
    
    func onMovieResponseFailed(error: String) {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension MovieViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.mTitle.text = arrayList[indexPath.row].title
        cell.mDescription.text = arrayList[indexPath.row].brief

        // this things should be done in interactor where the business logid is done and should be send back to viewController
        Alamofire.request(self.arrayList[indexPath.row].imagesource!).responseData { (response) in
            if response.error == nil {
                print(response.result)
                                if let data = response.data {
                    cell.mImageView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
    
}

class MovieCell:UITableViewCell{
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    
}

