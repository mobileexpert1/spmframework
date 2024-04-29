//
//  UserlocalStoreClass.swift
//  IpassFrameWork1
//
//  Created by Mobile on 11/04/24.
//

import Foundation


public class UserLocalStore{
    
    static let shared = UserLocalStore()
  
    var token :String {
        get {
            return UserDefaults.standard.value(forKey: "token") as? String ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    var sessionId :String {
        get {
            return UserDefaults.standard.value(forKey: "sessionId") as? String ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "sessionId")
        }
    }
    
    
}
 
