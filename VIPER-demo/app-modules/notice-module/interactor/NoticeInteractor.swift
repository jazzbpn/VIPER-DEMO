//
//  FetchNoticeModel.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NoticeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["notice_list"] as! NSArray
                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
                }
            }else {
                self.presenter?.noticeFetchFailed()
            }
        }
    }
    
    
    
    
}
