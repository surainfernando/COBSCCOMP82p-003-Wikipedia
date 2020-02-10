//
//  NetworkClient.swift
//  COBSCCOMP182p-003-Wikipedia
//
//  Created by user161121 on 2/9/20.
//  Copyright © 2020 surainfdo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient
{
    func  execute(_ searchContent:String)
    { let searchText=searchContent
        AF.request("https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=\(searchText)&gpslimit=10").response { response in
            //print(response)
            // debugPrint(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("Break----------------------------------------------------------------------------------")
                print("Break----------------------------------------------------------------------------------")
                print("Break----------------------------------------------------------------------------------")
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        
        
        
    }
    
}
