//
//  skyOcrEngine.swift
//  SkyIdLib
//
//  Created by mac pro on 27/01/2020.
//  Copyright © 2020 IDC. All rights reserved.
//

import Foundation
import UIKit
import FirebaseMLVision

class skyOcrEngine:NSObject
{
    let vision = Vision.vision()
    let textRecognizer:VisionTextRecognizer!
    var canI:Bool=true
    override init(){
        
        textRecognizer = vision.onDeviceTextRecognizer()
        super.init()
    }
    
    deinit {
        print("skyOcrEngine deallocaate ************************")
    }
    // Recognize lines
    func recognize(image:UIImage,completion: @escaping ([SkyTextLine]) -> Void)
    {
        //if canI {
           //canI=false
                    var list_results:[SkyTextLine]=[SkyTextLine]()
                    // *******************************************
                    let vimage = VisionImage(image: image)
                    textRecognizer.process(vimage){ features, error in
                        guard error == nil, let features = features else {
                          //print("Text recognizer failed with error:")
                          //self.canI=true
                          completion(list_results)
                          return
                        }
                        for block in features.blocks{
                            for line in block.lines
                            {
                                let corrected = line.text.folding(options: .diacriticInsensitive, locale: .current)
                                list_results.append(SkyTextLine(withText: corrected, andBox: line.frame))
                            }
                        }
                        self.canI=true
                        completion(list_results)
                    }
               ///}
        
    }
    // recognizeBlocks
    func recognizeBlocks(image:UIImage,completion: @escaping ([SkyTextLine]) -> Void)
    {
        //if canI {
           //canI=false
                    var list_results:[SkyTextLine]=[SkyTextLine]()
                    // *******************************************
                    let vimage = VisionImage(image: image)
                    textRecognizer.process(vimage){ features, error in
                        guard error == nil, let features = features else {
                          //print("Text recognizer failed with error:")
                          //self.canI=true
                          completion(list_results)
                          return
                        }
                        for block in features.blocks{
                                let corrected = block.text.folding(options: .diacriticInsensitive, locale: .current).replacingOccurrences(of: "\n", with: " ")
                                //print(corrected)
                                list_results.append(SkyTextLine(withText: corrected, andBox: block.frame))
                        }
                        //self.canI=true
                        completion(list_results)
                    }
                //}
    }
    
}
