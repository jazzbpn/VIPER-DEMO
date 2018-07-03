//
//  MovieProtocol.swift
//  VIPER-demo
//
//  Created by Bipin on 7/2/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation

protocol ViewToPresenterMovieProtocol:class{
    
    var view: PresenterToViewMovieProtocol? {get set}
    var interactor: PresenterToInteractorMovieProtocol? {get set}
    var router: PresenterToRouterMovieProtocol? {get set}
    func startFetchingMovie()

}

protocol PresenterToViewMovieProtocol:class {
    
    func onMovieResponseSuccess(movieModelArrayList:Array<MovieModel>)
    func onMovieResponseFailed(error:String)
    
}

protocol PresenterToRouterMovieProtocol:class {
    
    static func createMovieModule()->MovieViewController

}

protocol PresenterToInteractorMovieProtocol:class {
    
    var presenter:InteractorToPresenterMovieProtocol? {get set}
    func fetchMovie()
    
}

protocol InteractorToPresenterMovieProtocol:class {
    
    func movieFetchSuccess(movieList:Array<MovieModel>)
    func movieFetchFailed()
    
}
