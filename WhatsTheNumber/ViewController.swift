//
//  ViewController.swift
//  WhatsTheNumber
//
//  Created by 陳美妤 on 2019/4/8.
//  Copyright © 2019 Mico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //亂數取1~10
    var answer = Int.random(in: 1...100)
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        
        if isOver == false{
            //遊戲進行中
            print(answer)
            //印出輸入的文字
            let inputText = inputTextField.text!
            print("輸入 \(inputText)")
            //清空輸入框的字串,讓下一次猜數字時輸入框清空
            inputTextField.text = ""
            //將輸入的字串轉成整數
            let inputNumber = Int(inputText)
            
            if inputNumber == nil {
                messageLabel.text = "未輸入，猜 \(minNumber)-\(maxNumber) 的數字。"
            }else{
                if inputNumber! > maxNumber {
                    messageLabel.text = "太大了！猜 \(minNumber)-\(maxNumber) 的數字。"
                }else if inputNumber! < minNumber {
                    messageLabel.text = "太小了！猜 \(minNumber)-\(maxNumber) 的數字。"
                }else{
                    //檢查答案
                    if inputNumber! == answer{
                        //數字答對
                        messageLabel.text = "答對啦！按下猜猜按鈕再玩一次"
                        isOver = true
                    }else{
                        //數字答錯
                        if inputNumber! > answer {
                            //輸入的數字比答案大的話
                            maxNumber = inputNumber!
                        }else{
                            //輸入的數字比答案小的話
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "逼逼！猜 \(minNumber)-\(maxNumber) 的數字。"
                    }
                }
                
            }
        }else{
            //遊戲已結束（猜中數字）
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "猜一個數字介於 \(minNumber)-\(maxNumber) 之間"
            isOver = false
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //讓鍵盤跳出來
       inputTextField.becomeFirstResponder()
    }

}


