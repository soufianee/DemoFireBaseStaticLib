//
//  FRBConfig.swift
//  SkyIdSDK
//
//  Created by mac pro on 04/08/2020.
//  Copyright © 2020 IDC. All rights reserved.
//

import Foundation
import FirebaseCore

public class FRBConfig:NSObject {
    public static let shared = FRBConfig()
    private override init(){
        super.init()
    }
    
    public func FRBSetup(){
       FirebaseConfiguration.shared.setLoggerLevel(.error)
       FirebaseApp.configure()
       
    }

}
