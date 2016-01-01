//
//  ViewController.swift
//  TipCalc
//
//  Created by Peyt Spencer Dewar on 12/30/15.
//  Copyright © 2015 PSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlets
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var tipPercLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipPercLabel.text = "Gratuity: 10%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipPercentage = NSString(string: tipPercLabel.text!).intValue
        let tip = billAmount * Double(tipPercentage) / 100
        let total = billAmount + tip

        //formats values to two decimal places
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipPercLabel.text = String(format: "Gratuity: \(tipPercentage)%%")
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onValueChanged(sender: UISlider) {
        let currentValue = sender.value
        tipPercLabel.text = "\(currentValue)%"
        onEditingChanged(sender)
    }
    
}

