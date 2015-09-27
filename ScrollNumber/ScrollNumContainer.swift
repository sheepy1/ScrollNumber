//
//  SliderLabelContainer.swift
//  CardsAnimation
//
//  Created by Sheepy on 15/9/2.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

enum ScrollNumContainerType: Int {
    case SingleType = 2, TensType = 1, HundredsType = 0
}

class ScrollNumContainer: UIScrollView {
    var width: CGFloat!
    var height: CGFloat!
    //应编译器要求必须初始化一个先,实际上并不需要在这里初始化
    private var scrollType: ScrollNumContainerType = ScrollNumContainerType.SingleType
    
    init(frame: CGRect, type: ScrollNumContainerType) {
        super.init(frame: frame)
        //初始化Type
        scrollType = type
        width = bounds.width
        height = bounds.height
        self.contentSize = CGSize(width: width, height: height * 10)
        for i in 0..<10 {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: height * CGFloat(i), width: width, height: height)
            label.text = "\(i)"
            label.textAlignment = .Center
            label.font = UIFont.boldSystemFontOfSize(40)
            label.textColor = UIColor.whiteColor()
            self.addSubview(label)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var increaseNum = 0
    var shouldStop = false
    var stopNum = 0
    func autoScroll() {
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.contentOffset.y = self.height * CGFloat(self.num++)
//            }) { _ in
//                if ++self.num >= 10 {
//                    self.num = 0
//                }
//                if self.shoudStop {
//                    self.scrollToRandomNum()
//                } else {
//                    self.autoScroll()
//                }
//
//        }
        
        if increaseNum >= 10 {
            increaseNum = 0
        }
        self.contentOffset.y = self.height * CGFloat(increaseNum++)
        
        if !self.shouldStop {
            scrollByType()
        } else {
            scrollToNum(stopNum)
        }
        
    }
    
    func scrollToNum(num: Int) {
        switch scrollType {
//        case .ThousandsType:
//            stopWithDuration(2.5, num)
        case .HundredsType:
            stopWithDuration(1.5, toNum: num)
        case .TensType:
            stopWithDuration(1, toNum: num)
        case .SingleType:
            stopWithDuration(0.5, toNum: num)
        }
    }
    
    func scrollByType() {
        switch scrollType {
//        case .ThousandsType:
//            delay(seconds: 0.01) {
//                self.autoScroll()
//            }
        case .HundredsType:
            delay(seconds: 0.03) {
                self.autoScroll()
            }
        case .TensType:
            delay(seconds: 0.05) {
                self.autoScroll()
            }
        case .SingleType:
            delay(seconds: 0.1) {
                self.autoScroll()
            }
        }
    }
    
    func stopWithDuration(duration: NSTimeInterval, toNum num: Int) {
        //let randomNum = random(max)
        UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.contentOffset.y = self.height * CGFloat(num)
print(self.contentOffset.y)
            }, completion: nil)
    }
    
}
