//
//  ViewController.swift
//  ScrollNumber
//
//  Created by Sheepy on 15/9/26.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

class GameCtrl: UIViewController {

    lazy var numWidth: CGFloat = {
        let divPerRow = self.sum * 2 + 1
        let lazyWidth = ScreenWidth / CGFloat(divPerRow)
        return lazyWidth
    }()
    
    var gameCtrlBtn: UIButton!
    var settingBtn: UIButton!
    
    var max: Int!
    var sum: Int!
    
    var numViewList = [ScrollNumView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...sum {
            let frame = CGRect(x: CGFloat(i * 2 - 1) * numWidth, y: ScreenHeight/5, width: numWidth, height: ScreenHeight/5)
            let numView = ScrollNumView(frame: frame)
            view.addSubview(numView)
            numViewList.append(numView)
        }
    
        let btnW = ScreenWidth/5
        let btnH = ScreenHeight/8
        let settingBtnX = ScreenWidth/4 - btnW/2
        let gameBtnX = ScreenWidth/2 + btnW/2
        let btnY = ScreenHeight * 3/4
        
        //游戏控制按钮，点击屏幕滚动数字
        gameCtrlBtn = UIButton(frame: CGRect(x: gameBtnX, y: btnY, width: btnW, height: btnH))
        //gameCtrlBtn.backgroundColor = UIColor.whiteColor()
        gameCtrlBtn.setTitle("开始", forState: .Normal)
        gameCtrlBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        gameCtrlBtn.addTarget(self, action: "ctrlGame:", forControlEvents: .TouchUpInside)
        view.addSubview(gameCtrlBtn)
        
        //设置按钮
        settingBtn = UIButton(frame: CGRect(x: settingBtnX, y: btnY, width: btnW, height: btnH))
        settingBtn.setTitle("设置", forState: .Normal)
        settingBtn.addTarget(self, action: "turnToSetting", forControlEvents: .TouchUpInside)
        view.addSubview(settingBtn)
        
    }
    
    func turnToSetting() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var shouldStop = false
    func ctrlGame(Btn: UIButton) {
        numViewList.map {
            $0.shouldStop = self.shouldStop
            $0.max = self.max
            $0.autoScroll()
        }
        shouldStop = !shouldStop
        if shouldStop {
            gameCtrlBtn.setTitle("结束", forState: .Normal)
        } else {
            gameCtrlBtn.setTitle("开始", forState: .Normal)
        }
    }

}

