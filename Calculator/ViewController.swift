//
//  ViewController.swift
//  Calculator
//
//  Created by Fenix Lavon on 3/24/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var resultText:		String = ""
	var result: 		Double = 0
	var rightValue: 	Double = 0
	var oper: 			Int? = nil
	var second_oper:	Int? = nil
	var index: 			Int = 0;
	
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet var buttonLabel: [UIButton]!


	func operation(oper: Int, left: Double, right: Double)-> String {
		var result: String
		switch oper {
				case 12: result = String(left + right)
		case 13: result = String(left - right)
				case 14: result = String(left * right)
		case 15: result = (right != 0) ? String(left / right) : "Ошибка"
			default: result = ""
		}
		if (result.count > 12) {
			let str = result as NSString
			result = str.substring(with: NSRange(location: 0, length: 12))
		}
		return result
	}
	
	@IBAction func Buttons(_ sender: UIButton) {
		index = sender.tag
		if (0...10).contains(index) && (resultText.count != 1 || index != 0) {
			let count = resultText.filter { $0 == "," }.count;
			resultText += (0...9).contains(index) ? String(index) : (count == 0) ? "," : ""
			                                                                                                                                                              
			if (rightValue != 0 && oper != nil) {
				buttonLabel[oper!].backgroundColor = .systemOrange
				buttonLabel[oper!].setTitleColor(.white, for: .normal)
			}
		}
		if (12...15).contains(index) {
			if oper != nil && resultText != "" && oper != index {
				resultText = operation(oper: oper!, left: Double(resultText)!, right: rightValue)
			} else if resultText != "" {
				rightValue = Double(resultText)!
				resultText = ""
			}
			oper = index
			for i in (12...15) {
				buttonLabel[i].backgroundColor = .systemOrange
				buttonLabel[i].setTitleColor(.white, for: .normal)
			}
			buttonLabel[index].backgroundColor = .white
			buttonLabel[index].setTitleColor(.orange, for: .normal)
			
		}
		
		if (resultText != "") {
			resultLabel.text = resultText
		}
		
		if (sender.tag == 16 && resultText.count > 0) {
			buttonLabel[16].setTitle("AC", for: .normal)
			resultText = ""
			resultLabel.text? = "0"
		}
		
		if (resultLabel.text != "0") {
			buttonLabel[16].setTitle("C", for: .normal)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		resultLabel.text = "0"
		buttonLabel.forEach { $0.layer.cornerRadius = $0.bounds.size.width / 2 }
		buttonLabel[0].layer.cornerRadius = buttonLabel[0].bounds.size.width / 5
	}
}

