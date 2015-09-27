//
//  ScrollNumView.swift
//  ScrollNumber
//
//  Created by Sheepy on 15/9/27.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

class ScrollNumView: UIView {
   
    let digit = 3
    
    var numContainerList = [ScrollNumContainer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = frame.width / CGFloat(digit)
        
        for i in 0 ..< digit {
            let rect = CGRect(x: CGFloat(i) * width, y: 0, width: width, height: frame.height)
            
            if let type = ScrollNumContainerType(rawValue: i) {
                let numContainer = ScrollNumContainer(frame: rect, type: type)
                self.addSubview(numContainer)
                numContainerList.append(numContainer)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var shouldStop = false
    var max: Int!
    var numList: [Int] {
        let random = getRandomNum(self.max)
        let lazyList = [random / 100, (random % 100) / 10, random % 10]
        return lazyList
    }
    func autoScroll() {
        for i in 0 ..< numContainerList.count {
            let numContainer = numContainerList[i]
            numContainer.shouldStop = self.shouldStop
            numContainer.stopNum = numList[i]
            numContainer.scrollByType()
        }
    }
}
