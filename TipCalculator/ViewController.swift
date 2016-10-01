//
//  ViewController.swift
//  TipCalculator
//
//  Created by Harshit Mapara on 9/30/16.
//  Copyright © 2016 Harshit Mapara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSagment: UISegmentedControl!
    
    private let TAG : String = "ViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(TAG + "viewDidLoad")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(TAG + "viewWillDisappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defSegTitle : String = String(Utility.getDefaultTip()) +  "%"
    tipSagment?.setTitle(defSegTitle, forSegmentAt: 0)
        print(TAG + "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTapListener(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentageArray = [0.15, 0.20, 0.25]
        
        let selectedPercentag = tipSagment.selectedSegmentIndex == 0 ? Double(Utility.getDefaultTip())/100 : tipPercentageArray[tipSagment.selectedSegmentIndex - 1]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * selectedPercentag
        let total =  bill + tip
        
        let animation: CATransition = CATransition()
        animation.duration = 1.0
        animation.type = kCATransitionFade
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        tipLabel.layer.add(animation, forKey: "changeTextTransition")
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.layer.add(animation, forKey: "changeTextTransition")
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

