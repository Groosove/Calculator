//
//  ViewController.swift
//  Calculator
//
//  Created by Fenix Lavon on 3/24/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var result: 		Int = 0
	var leftValue: 		Int = 0
	var rightValue: 	Int = 0
	var chooseValue: 	Bool = true
	var index: 			Int = 0;
	
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var clearOutlet: UIButton!
	
	func takeValue(_ index: Int,_ value: inout Int) {
		if (index == 17 && resultLabel.text != "0") {
			value = -value
		}
		if (index >= 0 && index <= 9 && resultLabel.text?.count != 12) {
			value = value * 10 + index
		}
	}
	
	@IBAction func Buttons(_ sender: UIButton) {
		index = sender.tag
		if (index >= 12 && index <= 15 || index == 18) {
			chooseValue = !chooseValue
		}
		if ((index >= 0 && index <= 9) || index == 17) {
			(chooseValue) ? takeValue(index, &leftValue) : takeValue(index, &rightValue)
		}
		
		result = leftValue + rightValue
		if (sender.tag == 16 && result != 0) {
			clearOutlet.setTitle("AC", for: .normal)
			result = 0
			leftValue = 0
			rightValue = 0
			resultLabel.text? = "0"
		}
		

		
		if (result != 0) {
			clearOutlet.setTitle("C", for: .normal)
		}
		resultLabel.text = String(result)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		resultLabel.text = "0"
		clearOutlet.setTitle("AC", for: .normal)
	}
}

