//
//  ResponseDataModel.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "title"
private let BRIEF = "brief"
private let FILESOURCE = "filesource"

class NoticeModel: Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var filesource:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        filesource <- map[FILESOURCE]
    }
}

