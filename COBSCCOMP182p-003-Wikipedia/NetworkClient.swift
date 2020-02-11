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
    enum NetworkError: Error {
        case failure
        case success
    }
    func  execute(_ searchContent:String)  -> [dog] {
        let searchText=searchContent
      
        let a1=dog("a1***dname","ccc@@@")
        let a2=dog("a2***dname","ddd@@@")
        let c=[a1,a2];
        var jsoner=[dog]()
        let a=dog("aaa","bbbsuccess")
        
        jsoner.append(a)
        
        print("log point network client")
        let b=dog("ccc","dddsuccess")
        jsoner.append(b)
        AF.request("https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=\(searchText)&gpslimit=10").response { response in
            //print(response)
            // debugPrint(response)
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
 print("Break----------------------------------------------------------------------------------")
                print("Break----------------------------------------------------------------------------------")
                print("Break----------------------------------------------------------------------------------")
                
                
                //print("JSON: \(json)")
                
            case .failure(let error):
                print("EEEEEEEEEEEEEEEEEEEEEEEEEEE")
                print(error)
              
            }
          
        }
          return jsoner
        
        
    }
    func retArray() -> [dog] {
        let a1=dog("a1dname","ccc")
        let a2=dog("a2dname","ddd")
        let c=[a1,a2]
        return c
    }
    func search(_ searchText: String, completionHandler: @escaping ([JSON]?, NetworkError) -> ()) {
        let urlToSearch = "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=\(searchText)&gpslimit=10"
        
        AF.request(urlToSearch).responseJSON { response in
            guard let data = response.data else {
                completionHandler(nil, .failure)
                return
            }
            
            let json = try? JSON(data: data)
            //print("JSON: \(json)")
            let results = json?["query"]["pages"].arrayValue
            guard let empty = results?.isEmpty, !empty else {
                completionHandler(nil, .failure)
                return
            }
            
            completionHandler(results, .success)
        }
    }
    
    func fetchImage(url: String, completionHandler: @escaping (UIImage?, NetworkError) -> ()) {
       AF.request(url).responseData { responseData in
            
            guard let imageData = responseData.data else {
                completionHandler(nil, .failure)
                return
            }
            
            guard let image = UIImage(data: imageData) else {
                completionHandler(nil, .failure)
                return
            }
            
            completionHandler(image, .success)
        }
    }
    
    
}
