//
//  ViewController.swift
//  Waterize
//
//  Created by Leonardo Lobato on 1/25/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPushButton(sender: PushButtonView) {
        if sender.isAddButton {
            self.counterView.counter++
        }else{
            if counterView.counter > 0 {
                self.counterView.counter--
            }
        }
        
        self.counterLabel.text = String(self.counterView.counter)
        
    }

}

