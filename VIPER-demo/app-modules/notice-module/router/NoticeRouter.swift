//
//  NoticeRouter.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter:PresenterToRouterProtocol{
    
    static func createModule() -> NoticeViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! NoticeViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
        
        let movieModue = MovieRouter.createMovieModule()
        navigationController.pushViewController(movieModue,animated: true)
        
    }
    
}
