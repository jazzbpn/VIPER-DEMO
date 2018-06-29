//
//  ViewController.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presentor:ViewToPresenterProtocol?
    
    @IBOutlet weak var uiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentor?.startFetchingNotice()
    }

}

extension ViewController:PresenterToViewProtocol{
    
    func showNotice(noticeArray: Array<NoticeModel>) {
        uiLabel.text = noticeArray[0].filesource
    }
    
    func showError() {

        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
