//
//  GlobalSymbol.swift
//  ScrollNumber
//
//  Created by Sheepy on 15/9/26.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

let MainBounds = UIScreen.mainScreen().bounds
let ScreenWidth = MainBounds.width
let ScreenHeight = MainBounds.height

func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

func getRandomNum(max: Int) -> Int {
    return Int(arc4random() % UInt32(max))
}

extension UITextField {
    func setBorder() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.cornerRadius = 5
    }
}