//
//  Requester.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation
import Alamofire

class Requester: NSObject {
    
    func doLoginAndToken(OK:@escaping((String) -> Void),ErrorService:@escaping((String) ->Void),endpoint:String){
        let headersService = [Constant.contentTypeKey: Constant.contentTypeValue]
        Alamofire.request(endpoint, method: .post, headers: headersService).responseData{
            response in
            
            if  (response.response?.statusCode == Constant.status201){
                if let dataResponse = response.response?.allHeaderFields{
                    UserDefaults.standard.set(dataResponse[Constant.authorization] as! String, forKey: "token")
                    OK(dataResponse[Constant.authorization] as! String)
                }
            } else {
                print("Error \(String(describing: response.response?.statusCode))")
                if let mensajeError = response.result.error {
                    ErrorService(mensajeError.localizedDescription)
                    
                }else{
                    ErrorService("Error de servidor")
                }
            }
        }
    }
    
    func doSummary(OK:@escaping((NSArray)->Void),ErrorService:@escaping((String)->Void),endpoint:String){
        let token = UserDefaults.standard.value(forKey: Constant.token) as! String
        let headerS = [Constant.authorization:token]
        Alamofire.request(endpoint, method: .get, headers: headerS).responseData{
            response in
            
            if response.response?.statusCode == Constant.status200 {
                if let responseData = response.data {
                    var json : NSArray?
                    do {
                        json = try JSONSerialization.jsonObject(with: responseData, options: []) as! NSArray
                    }catch{
                        print("Error \(error)")
                    }
                    
                    DispatchQueue.global(qos: .userInitiated).async {
                        DispatchQueue.main.sync {
                            OK(json!)
                        }
                    }
                }
            } else {
                print("ErrorCode \(String(describing: response.response?.statusCode))")
                if let mensajeError = response.result.error{
                    ErrorService(mensajeError.localizedDescription)
                }else{
                    ErrorService("Error de servidor")
                }
            }
        }
    }
}
