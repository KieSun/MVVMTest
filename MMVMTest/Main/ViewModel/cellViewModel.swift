//
//  cellViewModel.swift
//  MMVMTest
//
//  Created by 俞诚恺 on 16/4/20.
//  Copyright © 2016年 com.edu-meta.student. All rights reserved.
//

import UIKit
import SwiftyJSON

class cellViewModel: NSObject {

    typealias cellViewModelSuccessCallBack = (dataSoure: Array<cellModel>) -> Void
    typealias cellViewModelFaildCallBack = (error: NSError) -> Void
    
    static func loadCellData(success: cellViewModelSuccessCallBack?, faild: cellViewModelFaildCallBack?) {
        
        let parameters = ["limit": 20,
                          "skip": 0]
    
        
        Networking.get(mainUrl, parameters: parameters, success: { (json) in
            var others: [cellModel]?
            others = []
            
            if let items = JSON(json)["data"]["results"].array {
                for item in items {
                    others?.append(cellModel(json: item))
                }
                
                if success != nil {
                    success!(dataSoure: others!)
                }
            }
            }) { (error) in
                
        }
    }
}
