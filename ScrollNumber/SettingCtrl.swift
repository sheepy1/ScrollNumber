//
//  SettingCtrl.swift
//  ScrollNumber
//
//  Created by Sheepy on 15/9/27.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

class SettingCtrl: UIViewController {

    let rangeLabel = UILabel()
    let sumLabel = UILabel()
    
    let rangeTextField = UITextField()
    let sumTextField = UITextField()
    
    let cancelBtn = UIButton()
    let confirmBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        let labelX = ScreenWidth/4
        let labelW = ScreenWidth/5
        
        let textFieldX = labelX + labelW + ScreenWidth/20
        let textFieldW = ScreenWidth/4
        
        let rangeY = ScreenHeight/15
        let sumY = ScreenHeight/3
        
        let elementH = ScreenHeight/7
        
        rangeLabel.frame = CGRect(x: labelX, y: rangeY, width: labelW, height: elementH)
        rangeLabel.text = "最大号码:"
        rangeLabel.font = UIFont.systemFontOfSize(20)
        view.addSubview(rangeLabel)
        
        sumLabel.frame = CGRect(x: labelX, y: sumY, width: labelW, height: elementH)
        sumLabel.text = "获奖人数:"
        sumLabel.font = UIFont.systemFontOfSize(20)
        view.addSubview(sumLabel)
        
        rangeTextField.frame = CGRect(x: textFieldX, y: rangeY, width: textFieldW, height: elementH)
        rangeTextField.setBorder()
        view.addSubview(rangeTextField)
        rangeTextField.delegate = self
        
        sumTextField.frame = CGRect(x: textFieldX, y: sumY, width: textFieldW, height: elementH)
        sumTextField.setBorder()
        view.addSubview(sumTextField)
        sumTextField.delegate = self
        
        let btnW = ScreenWidth/5
        let btnH = ScreenHeight/8
        let cancelBtnX = ScreenWidth/4 - btnW/2
        let confirmBtnX = ScreenWidth/2 + btnW/2
        let btnY = ScreenHeight * 3/4
        
        cancelBtn.frame = CGRect(x: cancelBtnX, y: btnY, width: btnW, height: btnH)
        cancelBtn.setTitle("取消", forState: .Normal)
        cancelBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cancelBtn.addTarget(self, action: "cancel", forControlEvents: .TouchUpInside)
        view.addSubview(cancelBtn)
        
        confirmBtn.frame = CGRect(x: confirmBtnX, y: btnY, width: btnW, height: btnH)
        confirmBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        confirmBtn.addTarget(self, action: "confirm", forControlEvents: .TouchUpInside)
        confirmBtn.setTitle("确定", forState: .Normal)
        view.addSubview(confirmBtn)
    }
    
    var gameCtrl: GameCtrl!
    
    func cancel() {
        //默认在0-100号中抽取4个获奖者
        gameCtrl = GameCtrl()
        gameCtrl.max = 100
        gameCtrl.sum = 4
        
        turnToGameCtrl()
    }
    
    func confirm() {

        guard let max = Int(rangeTextField.text!), let sum = Int(sumTextField.text!) else {
            print("请输入数字")
            return
        }
        gameCtrl = GameCtrl()
        gameCtrl.max = max
        gameCtrl.sum = sum
        turnToGameCtrl()
    }
    
    
    func turnToGameCtrl() {
        gameCtrl.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        gameCtrl.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
        self.presentViewController(gameCtrl, animated: true, completion: nil)
    }

}

extension SettingCtrl: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        rangeTextField.resignFirstResponder()
        sumTextField.resignFirstResponder()
    }
}
 