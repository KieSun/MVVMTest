//
//  cellModel.swift
//  MMVMTest
//
//  Created by 俞诚恺 on 16/4/20.
//  Copyright © 2016年 com.edu-meta.student. All rights reserved.
//

import Foundation
import SwiftyJSON

class cellModel: NSObject {
    var newsImage: String?
    var newsTitle: String?
    var newsSource: String?
    var newsTypeName: String?
    
    init(json: JSON) {
        newsImage = json["newsImage"].string
        newsTitle = json["newsTitle"].string
        newsSource = json["newsSource"].string
        newsTypeName = json["newsTypeName"].string
    }
    
    convenience init(object: AnyObject) {
        self.init(json: JSON(object))
    }
    
    func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if newsImage != nil {
            dictionary.updateValue(newsImage!, forKey: "newsImage")
        }
        if newsTitle != nil {
            dictionary.updateValue(newsTitle!, forKey: "newsTitle")
        }
        if newsSource != nil {
            dictionary.updateValue(newsSource!, forKey: "newsSource")
        }
        if newsTypeName != nil {
            dictionary.updateValue(newsTypeName!, forKey: "newsTypeName")
        }
        
        return dictionary
    }
}
