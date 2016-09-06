//
//  JianBianLab.swift
//  simplechangetime
//
//  Created by lotawei on 16/9/6.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class JianBianLab: UILabel {

    
    override func drawRect(rect: CGRect) {
        let currentContext = UIGraphicsGetCurrentContext()
        
        // 2
        CGContextSaveGState(currentContext);
        
        // 3
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4
        let startColor = UIColor.grayColor();
        let startColorComponents = CGColorGetComponents(startColor.CGColor)
        let endColor = UIColor.blueColor();
        let endColorComponents = CGColorGetComponents(endColor.CGColor)
        
        // 5
        var colorComponents
            = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        // 6
        var locations:[CGFloat] = [0.0, 1.0]
        
        // 7
        let gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,2)
        
        let startPoint = CGPointMake(0, self.bounds.height)
        let endPoint = CGPointMake(self.bounds.width, self.bounds.height)
        
        // 8
        CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, .DrawsAfterEndLocation)
        
        // 9
     
      
        
        CGContextRestoreGState(currentContext);
          drawTextInRect(bounds)
        
    }
 

}
