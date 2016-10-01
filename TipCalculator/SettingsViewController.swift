//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Harshit Mapara on 9/30/16.
//  Copyright © 2016 Harshit Mapara. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : ViewController {
    
    @IBOutlet weak var uiSliderView: UISlider!
    @IBOutlet weak var expressionImageView: UIImageView!
    var userSelectionPercentage : Int = 0
    
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let initialProgress : Int = Utility.getDefaultTip()
        userSelectionPercentage = initialProgress
        uiSliderView.value = Float(initialProgress)
        progressLabel.text = String(initialProgress)
        setExpression(initialProgress)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onValueChanged(_ sender: UISlider ) {
        progressLabel.text = String(Int(sender.value))
        userSelectionPercentage = Int(sender.value)
        setExpression(userSelectionPercentage)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tata bye bye cya");
        let defaults = UserDefaults.standard
        defaults.set(userSelectionPercentage, forKey: KEY_CONSTANT.default_tip)
        defaults.synchronize()
    }
    
    func setExpression(_ progress : Int) {
        if (progress > 15) {
            expressionImageView.image = UIImage(named: "happy.jpg");
        } else {
            expressionImageView.image = UIImage(named: "sad.png");
        }
    }
}
