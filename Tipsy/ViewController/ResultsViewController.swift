//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yehia Khamees on 10/4/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalText = ""
    var settingsText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalText
        settingsLabel.text = settingsText
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true , completion: nil)
    }

}
