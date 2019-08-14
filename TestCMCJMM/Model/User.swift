//
//  User.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation

class User: NSObject {
    
    // MARK: - Character
    
    var cedula = 0
    var nombre = ""
    var celular =  0
    var direccion = ""
    var email = ""
    
    // MARK: - Init
    
    init(dict: NSDictionary) {
        super.init()
        self.cedula = fromJSONToInt(dic: dict, key: "cedula")
        self.nombre = fromJSONToString(dict: dict, key: "nombre")
        self.celular =  fromJSONToInt(dic: dict, key: "celular")
        self.direccion = fromJSONToString(dict: dict, key: "direccion")
        self.email = fromJSONToString(dict: dict, key: "email")
    }
    
    // MARK: - JSON
    
    func fromJSONToString(dict:NSDictionary,key:String) -> String {
        if (dict.object(forKey: key) == nil || dict.object(forKey: key) is NSNull ){
            print("El atributo \(key) no existe")
            return ""
        } else if (dict.object(forKey: key) is String){
            return dict.object(forKey: key) as! String
        } else{
            return ""
        }
    }
    
    func fromJSONToInt(dic:NSDictionary,key:String) -> Int {
        if (dic.object(forKey: key) == nil || dic.object(forKey: key) is NSNull ){
            print("El atributo \(key) no existe")
            return 0
        } else if (dic.object(forKey: key) is Int){
            return dic.object(forKey: key) as! Int
        } else{
            return 0
        }
    }
}
