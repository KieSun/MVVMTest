//
//  Networking.swift
//  MMVMTest
//
//  Created by 俞诚恺 on 16/4/20.
//  Copyright © 2016年 com.edu-meta.student. All rights reserved.
//

import UIKit
import Alamofire

class Networking: NSObject {

    static func get(url: String, parameters: [String: AnyObject]?, success: (json: AnyObject) -> Void, faild: (error: NSError) -> Void) -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        if let parameters = parameters {
            Alamofire.request(.GET, url, parameters: parameters, encoding: .URL, headers: nil).responseJSON(completionHandler: { (response) in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                guard response.result.error == nil else {
                    faild(error: response.result.error!)
                    return
                }
                
                if let JSON = response.result.value {
                    success(json: JSON)
                }
            })
        }else {
            Alamofire.request(.GET, url).responseJSON(completionHandler: { (response) in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                guard response.result.error == nil else {
                    faild(error: response.result.error!)
                    return
                }
                
                if let JSON = response.result.value {
                    success(json: JSON)
                }
            })
        }
    }
    
    static func post(url: String, parameters: [String: AnyObject]?, success: (json: AnyObject) -> Void, faild: (error: NSError) -> Void) -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        if let parameters = parameters {
            Alamofire.request(.POST, url, parameters: parameters, encoding: .URL, headers: nil).responseJSON(completionHandler: { (response) in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                guard response.result.error == nil else {
                    faild(error: response.result.error!)
                    return
                }
                
                if let JSON = response.result.value {
                    success(json: JSON)
                }
            })
        }else {
            Alamofire.request(.POST, url).responseJSON(completionHandler: { (response) in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                guard response.result.error == nil else {
                    faild(error: response.result.error!)
                    return
                }
                
                if let JSON = response.result.value {
                    success(json: JSON)
                }
            })
        }
    }
}
