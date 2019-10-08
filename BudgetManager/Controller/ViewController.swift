//
//  ViewController.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var createBudgetButton: UIButton!
    @IBOutlet weak var incomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addLayerShadow(toLayer: welcomeView.layer)
        addLayerShadow(toLayer: createBudgetButton.layer)
//        welcomeView.layer.cornerRadius = CGFloat(5.0)
//        welcomeView.layer.shadowOffset = CGSize(width: 2, height: 1)
//        welcomeView.layer.shadowRadius = CGFloat(2.0)
//        welcomeView.layer.shadowOpacity = 0.2
//
//        createBudgetButton.layer.cornerRadius = CGFloat(2.0)
//        createBudgetButton.layer.shadowOffset
    }

    
    @IBAction func createBudgetButtonPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! RecurringListController
        if let income = Double(incomeTextField.text!){
            let budgetManager = BudgetManagerModel(monthlyIncome: income)
            destinationVC.budgetManager = budgetManager
        }
    }
    
    func addLayerShadow(toLayer layer: CALayer){
        layer.cornerRadius = CGFloat(5.0)
        layer.shadowOffset = CGSize(width: 2, height: 1)
        layer.shadowRadius = CGFloat(2.0)
        layer.shadowOpacity = 0.2
    }

}

