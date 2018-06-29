//
//  login-protocols.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    
}

protocol PresenterToViewProtocol: class{
    func showNotice(noticeArray:Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> ViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(noticeModelArray:Array<NoticeModel>)
    func noticeFetchFailed()
}
