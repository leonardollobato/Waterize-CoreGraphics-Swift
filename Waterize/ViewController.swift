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
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var containerView: UIView!
    
    var isGraphViewShowing = false
    
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
        
        if isGraphViewShowing {
            counterViewTap(nil)
        }
        
    }
    @IBAction func counterViewTap(gesture: UITapGestureRecognizer?) {
        
        if isGraphViewShowing {
            UIView.transitionFromView(graphView,
                toView: counterView,
                duration: 1.0,
                options: [UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.ShowHideTransitionViews],
                
                completion: nil)
        }else{
            UIView.transitionFromView(counterView,
                toView: graphView,
                duration: 1.0,
                options: [UIViewAnimationOptions.TransitionFlipFromRight, UIViewAnimationOptions.ShowHideTransitionViews],
                completion: nil)
        }
        
        isGraphViewShowing = !isGraphViewShowing
        
    }
    
}

