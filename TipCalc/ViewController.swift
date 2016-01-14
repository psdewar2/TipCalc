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
    @IBOutlet var peopleSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.attributedPlaceholder = NSAttributedString(string: "$0.00", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])

        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewDidAppear(animated: Bool) {
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var numPeople = [1,2,3,4]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipPercentage = Int(slider.value)
        let tip = billAmount * Double(tipPercentage) / 100
        let total = (billAmount + tip) / Double(numPeople[peopleSegment.selectedSegmentIndex])

        //formats values to two decimal places

        tipLabel.text = tip.asLocaleCurrency()
        totalLabel.text = total.asLocaleCurrency()
        tipPercLabel.text = String(format: "Gratuity: \(tipPercentage)%%")
    }

    @IBAction func onTap(sender: AnyObject) {
        //let billAmount = NSString(string: billField.text!).doubleValue
        //billField.text = "\(billAmount.asLocaleCurrency())"
        view.endEditing(true)
    }
    
    @IBAction func onValueChanged(sender: UISlider) {
        let currentValue = sender.value
        print(currentValue)
        tipPercLabel.text = "\(currentValue)%"
        onEditingChanged(sender)
    }
    @IBAction func onIndexChanged(sender: UISegmentedControl) {
        onEditingChanged(sender)
    }
}

extension Double {
    func asLocaleCurrency() -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}


