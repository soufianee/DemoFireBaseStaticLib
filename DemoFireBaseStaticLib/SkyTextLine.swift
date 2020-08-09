//
//  SkyTextLine.swift
//  SkyIdLib
//
//  Created by mac pro on 27/01/2020.
//  Copyright © 2020 IDC. All rights reserved.
//

import Foundation
import UIKit

class SkyTextLine
{
    var value:String = ""
    var bounds:CGRect
    
    init(){
          value=""
          bounds=CGRect()
      }
    
    deinit {
        print("SkyTextLine deallocaate ************************")
    }
    
    init(withText str:String,andBox rect:CGRect){
        value=str
        bounds=rect
    }
    
    
}
