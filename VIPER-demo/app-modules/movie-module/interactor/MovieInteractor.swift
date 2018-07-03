//
//  MovieInteractor.swift
//  VIPER-demo
//
//  Created by Bipin on 7/2/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieInteractor:PresenterToInteractorMovieProtocol{    
    
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie() {
        
        Alamofire.request(API_MOVIE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["movie_list"] as! NSArray
                    let arrayObject = Mapper<MovieModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.movieFetchSuccess(movieList: arrayObject)
                }
            }else {
                self.presenter?.movieFetchFailed()
            }
        }
        
    }
    
    
    
    
}
