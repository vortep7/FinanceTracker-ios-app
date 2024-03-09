//
//  GeneralViewController.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 09.03.2024.
//

import UIKit

class GeneralViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
