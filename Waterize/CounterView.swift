//
//  CounterView.swift
//  Waterize
//
//  Created by Leonardo Lobato on 1/26/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import UIKit

let noOfGlasses = 8
let π:CGFloat = CGFloat(M_PI)

@IBDesignable
class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {
        didSet{
            if self.counter <= noOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius:CGFloat = max(bounds.width, bounds.height)/2
        let arcWidth:CGFloat = 76
        let startAngle:CGFloat = 3 * π / 4
        let endAngle:CGFloat = π / 4
        
        //print(radius)
        
        let path = UIBezierPath(arcCenter: center,
            radius: radius - (arcWidth/2),
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        path.lineWidth = arcWidth
        
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference:CGFloat = 2 * π - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(noOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center,
            radius: radius - 2.5,
            startAngle: startAngle,
            endAngle: outlineEndAngle,
            clockwise: true)
        
        
        outlinePath.addArcWithCenter(center,
            radius: radius - arcWidth + 2.5,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false)
        
        
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
        
        
    }
    
    
}
