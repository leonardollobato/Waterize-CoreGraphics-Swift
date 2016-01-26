//
//  GraphView.swift
//  Waterize
//
//  Created by Leonardo Lobato on 1/26/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {
    
    var graphPoints:[Int] = [4, 2, 6, 4, 5, 8, 4]
    
    @IBInspectable var startColor:UIColor = UIColor.redColor()
    @IBInspectable var endColor:UIColor = UIColor.greenColor()
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    override func drawRect(rect: CGRect) {
        
        let width = rect.width
        let height = rect.height
        
        let path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: UIRectCorner.AllCorners,
            cornerRadii: CGSize(width: 8.0, height: 8.0))
        
        path.addClip()
        
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(
            colorSpace,
            colors,
            colorLocations)
        
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x: 0, y: self.bounds.height)
        
        CGContextDrawLinearGradient(context,
            gradient,
            startPoint,
            endPoint,
            CGGradientDrawingOptions.init(rawValue: 0))
        
        let margin:CGFloat = 20.0
        let columnXPoint = { (column:Int)->CGFloat in
            //let lineWidth = (width - (margin * 2)-4)
            //let spacer =  lineWidth/ CGFloat((self.graphPoints.count - 1))
            
            let lineWidth = (width - (margin*2) - 4 ) // 300 - (20 * 2) = 260
            // 260 / (7 - 1) = 260 / 6 = 43.33...
            let spacer =  lineWidth / CGFloat((self.graphPoints.count - 1))
            
            
            var x:CGFloat = CGFloat(column) * spacer
            //x += margin + 2
            x += margin + 2
            
            return x
        }
        
        
        
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        // 300 - 60 - 50 = 190
        let graphHeight = height - topBorder - bottomBorder
        // 8
        let maxValue = graphPoints.maxElement()!
        
        let columnYPoint = { (graphPoint:Int)->CGFloat in
            var y:CGFloat = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y
            return y
        }
        
        
        UIColor.whiteColor().setFill()
        UIColor.whiteColor().setStroke()
        
        let graphPath = UIBezierPath()
        graphPath.moveToPoint(CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
        
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            graphPath.addLineToPoint(nextPoint)
            
            // print("\(graphPoints[i]): ( \(columnXPoint(i)) , \(columnYPoint(graphPoints[i])) )")
        }
        
        //graphPath.stroke()
        
        CGContextSaveGState(context)
        let clippingPath = graphPath.copy() as! UIBezierPath
        
        clippingPath.addLineToPoint(CGPoint(x: columnXPoint(graphPoints.count - 1), y: height))
        
        print(columnXPoint(graphPoints.count - 1))
        print(height)
        
        clippingPath.addLineToPoint(CGPoint(x: columnXPoint(0), y: height))
        print(columnXPoint(0))
        print(height)
        
        clippingPath.closePath()
        clippingPath.addClip()
        
        let highestYPoint = columnYPoint(maxValue)
        startPoint = CGPoint(x:margin, y: highestYPoint)
        endPoint = CGPoint(x:margin, y:self.bounds.height)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, [])
        CGContextRestoreGState(context)
        
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        for i in 0..<graphPoints.count {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: point,
                    size: CGSize(width: 5.0, height: 5.0)))
            circle.fill()
        }
        
        //Draw horizontal graph lines on the top of everything
        let linePath = UIBezierPath()
        
        //top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,
            y:topBorder))
        
        //center line
        linePath.moveToPoint(CGPoint(x:margin,
            y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,
            y:graphHeight/2 + topBorder))
        
        //bottom line
        linePath.moveToPoint(CGPoint(x:margin,
            y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,
            y:height - bottomBorder))
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
        
    }
    
    
}


