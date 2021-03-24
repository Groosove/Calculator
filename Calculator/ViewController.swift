//
//  ViewController.swift
//  Calculator
//
//  Created by Fenix Lavon on 3/24/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var result: Int = 0
	
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var clearOutlet: UIButton!
	@IBAction func Buttons(_ sender: UIButton) {
	
		let index = sender.tag
		
		if (index == 0 && resultLabel.text == "0" || resultLabel.text?.count == 12) {
			return
		}
		if (result == 0 && index > 0 && index <= 9) {
			resultLabel.text = ""
		}
		if (sender.tag == 16 && result != 0) {
			clearOutlet.setTitle("AC", for: .normal)
			result = 0
		}
		if (index == 17 && resultLabel.text != "0") {
			result = -result
		}
		if (index >= 0 && index <= 9) {
			result = result * 10 + index
		}
		
		if (result != 0) {
			clearOutlet.setTitle("C", for: .normal)
		}
		resultLabel.text = String(result)
		print(result)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		resultLabel.text = "0"
		clearOutlet.setTitle("AC", for: .normal)
	}
}

