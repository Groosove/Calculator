//
//  ViewController.swift
//  Calculator
//
//  Created by Fenix Lavon on 3/24/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var result: 		Double = 0
	var leftValue: 		Double = 0
	var rightValue: 	Double = 0
	var oper: 			Int? = nil
	var index: 			Int = 0;
	
	@IBOutlet weak var resultLabel: UILabel!

	@IBOutlet var buttonLabel: [UIButton]!
	func takeValue(_ index: Int,_ value: inout Double) {
		if index == 17 && value != 0 {
			value = -value
		}
		
		if (0...9).contains(index) && resultLabel.text?.count != 12 {
			value = value * 10 + Double(index)
		}
		
	}
	
	@IBAction func Buttons(_ sender: UIButton) {
		index = sender.tag
		if (12...15).contains(index) {
			oper = index
			for i in (12...15) {
				buttonLabel[i].backgroundColor = .systemOrange
				buttonLabel[i].setTitleColor(.white, for: .normal)
			}
			buttonLabel[index].backgroundColor = .white
			buttonLabel[index].setTitleColor(.orange, for: .normal)
		}
		if ((0...9).contains(index) || index == 17) {
			(oper == nil) ? takeValue(index, &leftValue) : takeValue(index, &rightValue)
		}
		if (oper != nil && index == 11) {
			result = leftValue + rightValue
			switch oper! {
				case 12: result = leftValue + rightValue
				case 13: result = leftValue - rightValue
				case 14: result = leftValue * rightValue
				case 15: result = leftValue / rightValue
				default: oper = nil
			}
			
			oper = nil
			
		}
		if (sender.tag == 16 && result != 0) {
			buttonLabel[16].setTitle("AC", for: .normal)
			result = 0
			leftValue = 0
			rightValue = 0
			resultLabel.text? = "0"
		}
		
		if (result != 0) {
			buttonLabel[16].setTitle("C", for: .normal)
		}
		resultLabel.text = String(result.rounded())
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		resultLabel.text = "0"
		buttonLabel.forEach { $0.layer.cornerRadius = $0.bounds.size.width / 2 }
		
		buttonLabel[0].layer.cornerRadius = buttonLabel[0].bounds.size.width / 5
		buttonLabel[16].setTitle("AC", for: .normal)
	}
}

