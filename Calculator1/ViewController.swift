//
//  ViewController.swift
//  Calculator1
//
//  Created by Uulgelsin Usubalieva on 16/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UITextField!
    
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operation: String = ""
    var result2: Int = 0
    var isResultFound: Bool = false
    
    // UIButtons
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b0: UIButton!
    
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var mp: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var mul: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var eq: UIButton!
    @IBOutlet weak var dot: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        b1.layer.cornerRadius = b1.frame.width / 2
               b1.layer.masksToBounds = true
        b2.layer.cornerRadius = b2.frame.width / 2
               b2.layer.masksToBounds = true
        b3.layer.cornerRadius = b3.frame.width / 2
               b3.layer.masksToBounds = true
        b4.layer.cornerRadius = b4.frame.width / 2
               b4.layer.masksToBounds = true
        b5.layer.cornerRadius = b5.frame.width / 2
               b5.layer.masksToBounds = true
        b6.layer.cornerRadius = b6.frame.width / 2
               b6.layer.masksToBounds = true
        b7.layer.cornerRadius = b7.frame.width / 2
               b7.layer.masksToBounds = true
        b8.layer.cornerRadius = b8.frame.width / 2
               b8.layer.masksToBounds = true
        b9.layer.cornerRadius = b9.frame.width / 2
               b9.layer.masksToBounds = true
    
        ac.layer.cornerRadius = ac.frame.width / 2
               ac.layer.masksToBounds = true
        mp.layer.cornerRadius = mp.frame.width / 2
               mp.layer.masksToBounds = true
        p.layer.cornerRadius = p.frame.width / 2
               p.layer.masksToBounds = true
        d.layer.cornerRadius = d.frame.width / 2
               d.layer.masksToBounds = true
        mul.layer.cornerRadius = mul.frame.width / 2
               mul.layer.masksToBounds = true
        plus.layer.cornerRadius = plus.frame.width / 2
               plus.layer.masksToBounds = true
        minus.layer.cornerRadius = minus.frame.width / 2
               minus.layer.masksToBounds = true
        eq.layer.cornerRadius = eq.frame.width / 2
               eq.layer.masksToBounds = true
        dot.layer.cornerRadius = dot.frame.width / 2
               dot.layer.masksToBounds = true
        b0.layer.cornerRadius = 40
               b0.layer.masksToBounds = true
    
        buttonsUIsetup()
    }
    fileprivate func getNumber(_ number: String) {
            if operation.isEmpty{
                firstNumber += number
                result.text = firstNumber
            }else{
                secondNumber += number
                result.text = secondNumber
            }
    }
    @IBAction func numberTapped(_ sender: UIButton) {
        if isResultFound{
                    reset()
        }
        
        switch sender.tag{
        case 0:
            getNumber("0")
        case 1:
            getNumber("1")
        case 2:
            getNumber("2")
        case 3:
            getNumber("3")
        case 4:
            getNumber("4")
        case 5:
            getNumber("5")
        case 6:
            getNumber("6")
        case 7:
            getNumber("7")
        case 8:
            getNumber("8")
        case 9:
            getNumber("9")
        default:
            print("no number")
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        switch sender.tag{
        case 10:
            print("+")
            operation = "+"
        case 11:
            print("-")
            operation = "-"
        case 12:
            print("*")
            operation = "*"
        case 13:
            print("/")
            operation = "/"
        case 14:
            if operation.isEmpty{
            operation = "%"
            }
        default:
            print("no operation")
        }
    }
    @IBAction func findTheResult(_ sender: UIButton) {
        guard let first = Int(firstNumber), let second = Int(secondNumber)
        else { print("no number")
            return}
        
        switch operation{
        case "+":
            result2 = first + second
            firstNumber = "\(result2)"
        case "-":
            result2 = first - second
            firstNumber = "\(result2)"
        case "*":
            result2 = first * second
            firstNumber = "\(result2)"
        case "/":
                    if second == 0{
                        result.text = "Division by 0"
                    } else{
                        result2 = first / second
                        firstNumber = "\(result2)"
                    }
                case "%":
                    result2 = first * second / 100
                    firstNumber = "\(result2)"
                default:
                    print("Go home! You are tired")
                }
                isResultFound = true
                result.text = "\(result2)"
            }
    
    @IBAction func findPercent(_ sender: Any) {
        if operation != "%"{
                  guard let first = Int(firstNumber), let second = Int(secondNumber) else {
                      print("There is no number")
                      return}
                  
                  switch operation{
                  case "+":
                      result2 = first + (first / 100 * second)
                  case "-":
                      result2 = first - (first / 100 * second)
                  case "*":
                      result2 = first * (first / 100 * second)
                  case "/":
                      result2 = first / (first / 100 * second)
                  default:
                      print("Go home! You are tired")
                  }
                  
                  isResultFound = true
                  
                  result.text = "\(result2)"
    }
}
    @IBAction func clear(_ sender: UIButton) {
        reset()
        result.text = "0"
    }
    @IBAction func reverseSign(_ sender: UIButton) {
        if isResultFound{
                    if result2 > 0{
                        result2 = -result2
                    } else{
                        result2 = abs(result2)
    }
            result.text = "\(result2)"
                    } else if !isResultFound && !operation.isEmpty{
                        if var second = Int(secondNumber){
                            if second > 0 {
                                second = -second
                                secondNumber = "\(second)"
                            } else{
                                second = abs(second)
                                secondNumber = "\(second)"
                            }
                            result.text = secondNumber
                        }
                    } else{
                        if var first = Int(firstNumber){
                            if first > 0 {
                                first = -first
                                firstNumber = "\(first)"
                            } else{
                                first = abs(first)
                                firstNumber = "\(first)"
                            }
                            result.text = firstNumber
}
    }
}
func reset(){
        firstNumber = ""
        secondNumber = ""
        result2 = 0
        operation = ""
        isResultFound = false
}
fileprivate func buttonsUIsetup() {
}
}
