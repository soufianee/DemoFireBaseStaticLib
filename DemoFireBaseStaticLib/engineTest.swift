//
//  engineTest.swift
//  skyId-SDK
//
//  Created by mac pro on 10/07/2020.
//  Copyright © 2020 IDC. All rights reserved.
//

import Foundation
import UIKit

public class engineTest:NSObject
{
    public static let shared=engineTest()
    
    private var ocrEngine:skyOcrEngine?=nil
    
    override private init() {
        super.init()
        // Override point for customization after application launch.

    }
    
    public func createEngines()
    {
        ocrEngine=skyOcrEngine()
    }
    public func imageToText(image:UIImage)
    {
        ocrEngine!.recognize(image: image){ results in

                for line in results
                {
                    print(line.value)
                    
                }
            
        }
    }
 
// END CLASS
}
