//
//  MovieRouter.swift
//  VIPER-demo
//
//  Created by Bipin on 7/2/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import UIKit

class MovieRouter:PresenterToRouterMovieProtocol{
    
    static func createMovieModule() -> MovieViewController {
        
        let view = MovieRouter.mainstoryboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        
        let presenter: ViewToPresenterMovieProtocol & InteractorToPresenterMovieProtocol = MoviePresenter()
        let interactor: PresenterToInteractorMovieProtocol = MovieInteractor()
        let router:PresenterToRouterMovieProtocol = MovieRouter()
        
        view.moviePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
