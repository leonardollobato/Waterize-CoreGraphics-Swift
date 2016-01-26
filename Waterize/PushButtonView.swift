//
//  PushButtonView.swift
//  Waterize
//
//  Created by Leonardo Lobato on 1/25/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {
    
    @IBInspectable var fillColor:UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton:Bool = true
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        
        /* grossura da Linha*/
        let plusLineThick:CGFloat = 3.0
        
        /* 
            PONTO B (x)
        
           - pega 60% da altura ou largura (o que for menor) - Para manter a proporção (60p)
            
            *bounds.height: altura do contexto aonde o gráfico é criado - área (100p)
            *bounds.width:  comprimento do contexto aonde o gráfico é criado - área (100p)
        */
        let plusWidth:CGFloat = min(bounds.width, bounds.height) * 0.6
        
        let plusPath = UIBezierPath()
        
        /* grossura da Linha*/
        plusPath.lineWidth = plusLineThick
        
        
        
        /* HORIZONTAL */
        
        /*
            Horizontal PONTO A (20,50)
        
            x = (bounds.width[100]- plusWidth[60])/÷ 2
            y = bounds.height ÷ 2
        
            *bounds.height: altura do contexto aonde o gráfico é criado - área (100p)
            *bounds.width:  comprimento do contexto aonde o gráfico é criado - área (100p)
        */
        plusPath.moveToPoint(
            CGPoint(x: ((bounds.width - plusWidth)/2)+0.5, y: (bounds.height/2)+0.5)
        )
        
        /*
            Horizontal PONTO B (80,50)
        
            x = (bounds.width[100]+ plusWidth[60])/÷ 2
            y = bounds.height ÷ 2
        
            *bounds.height: altura do contexto aonde o gráfico é criado - área (100p)
            *bounds.width:  comprimento do contexto aonde o gráfico é criado - área (100p)
        */
        plusPath.addLineToPoint(
            CGPoint(x: ((bounds.width + plusWidth)/2)+0.5, y: (bounds.height/2)+0.5)
        )
        
        
        
        
        
        
        /* VERTICAL */
        
        if isAddButton {
            /*
                Vertical PONTO A (20,50)
            
                x = (bounds.width[100]- plusWidth[60])/÷ 2
                y = bounds.height ÷ 2
            
                *bounds.height: altura do contexto aonde o gráfico é criado - área (100p)
                *bounds.width:  comprimento do contexto aonde o gráfico é criado - área (100p)
            */
            plusPath.moveToPoint(
                CGPoint(x: (bounds.width/2)+0.5, y: ((bounds.height - plusWidth)/2)+0.5)
            )
            
            /*
                Vertical PONTO B (80,50)
            
                x = (bounds.width[100]+ plusWidth[60])/÷ 2
                y = bounds.height ÷ 2
            
                *bounds.height: altura do contexto aonde o gráfico é criado - área (100p)
                *bounds.width:  comprimento do contexto aonde o gráfico é criado - área (100p)
            */
            plusPath.addLineToPoint(
                CGPoint(x: (bounds.width/2)+0.5, y: ((bounds.height + plusWidth)/2)+0.5)
            )
        }
        
        /*
            1.determina a cor do traço
            2.traça a linha
        */
        UIColor.whiteColor().setStroke()
        plusPath.stroke()
        
        
    }
}
