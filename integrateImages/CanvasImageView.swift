//
//  canvasImage.swift
//  integrateImages
//
//  Created by 高橋幹 on 2017/05/27.
//  Copyright © 2017年 高橋幹. All rights reserved.
//

import UIKit

class CanvasImageView: UIView {
    var pathes: [(start: CGPoint,fin: CGPoint)] = []
    var startPoint: CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("start")
        let touch = touches.first
        startPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        let touch = touches.first
        pathes.append((start: startPoint,fin: (touch?.location(in: self))!))
        startPoint = touch?.location(in: self)
        
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
            let context = UIGraphicsGetCurrentContext()
            context!.beginPath()
            
            for path in pathes {
                context?.move(to: path.start)
                context?.addLine(to: path.fin)
            }
            
        context!.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        context!.setLineWidth(1)
        context!.setLineCap(.round)
        context!.strokePath()
    }
    
    
}

