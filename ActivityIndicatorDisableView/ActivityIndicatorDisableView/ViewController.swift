//
//  ViewController.swift
//  ActivityIndicatorDisableView
//
//  Created by Kyle Wilson on 2020-02-29.
//  Copyright © 2020 Xcode Tips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 20
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let ai = self.startAnActivityIndicator()
        
        UIView.animate(withDuration: 1.0) {
            self.button.alpha = 0.3
            self.button.isEnabled = false
            self.button.setTitle("Confirming...", for: .normal)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            ai.stopAnimating()
            UIView.animate(withDuration: 1.0) {
                self.button.alpha = 1.0
                self.button.backgroundColor = UIColor.init(red: 34/255, green: 150/255, blue: 34/255, alpha: 1)
                self.button.setTitle("Purchased ✔️", for: .normal)
            }
        }
        
    }
}

extension ViewController {
    
    func startAnActivityIndicator() -> UIActivityIndicatorView {
        let ai = UIActivityIndicatorView(style: .large)
        self.view.addSubview(ai)
        self.view.bringSubviewToFront(ai)
        ai.center = CGPoint(x: view.frame.width / 2, y: 180)
        ai.hidesWhenStopped = true
        ai.startAnimating()
        return ai
    }
    
}

