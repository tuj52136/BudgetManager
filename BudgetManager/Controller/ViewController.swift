//
//  ViewController.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var createBudgetButton: UIButton!
    @IBOutlet weak var incomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func createBudgetButtonPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! RecurringViewController
        if let income = Double(incomeTextField.text!){
            let budgetManager = BudgetManagerModel(monthlyIncome: income)
            destinationVC.budgetManager = budgetManager
        }
    }

}

