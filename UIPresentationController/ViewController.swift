//
//  ViewController.swift
//  UIPresentationController
//
//  Created by Takeru Sato on 2018/12/19.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func showDialogButtonTapped(_ sender: UIButton) {
        let viewController = DialogViewController()
        present(viewController, animated: true, completion: nil)
    }
}

