//
//  ClockView.swift
//  simplechangetime
//
//  Created by lotawei on 16/9/6.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ClockView: UIView {
    var   resetbtn:UIButton!
    var   timevalue:Double!
    var   dis:UILabel!
    var   starbtn:UIButton!
    var   stopbtn:UIButton!
    var   atime:NSTimer!
    override init(frame: CGRect) {
        super.init(frame: frame);
        atime = NSTimer(timeInterval: 0.1, target: self, selector: #selector(updatetime), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(atime, forMode:NSDefaultRunLoopMode )
        timevalue = 0.0
        resetbtn = UIButton()
        resetbtn.setTitle("reset", forState: .Normal)
        starbtn = UIButton()
        starbtn.setTitle("start", forState: .Normal)
        dis = UILabel()
        dis.text = "\(timevalue)"
        stopbtn = UIButton()
        stopbtn.setTitle("stop", forState: .Normal)
        
        resetbtn.addTarget(self, action: #selector(reset), forControlEvents: .TouchUpInside)
        starbtn.addTarget(self, action: #selector(start), forControlEvents: .TouchUpInside)
           stopbtn.addTarget(self, action: #selector(stop), forControlEvents: .TouchUpInside)
        
        backgroundColor = UIColor.grayColor()
        addSubview(resetbtn)
         addSubview(dis)
         addSubview(starbtn)
         addSubview(stopbtn)
    }
    func updatetime()  {
        timevalue = timevalue + 0.1
        
        dis.text = String.init(format: "%.1f", timevalue)
    }
    func reset()  {
        if atime.valid {
            atime.invalidate()
        }
        timevalue = 0.0
        dis.text = String.init(format: "%.1f", timevalue)
    }
    func start()  {
        
        if atime.valid {
            return
        }
        else
        {
            atime = NSTimer(timeInterval: 0.1, target: self, selector: #selector(updatetime), userInfo: nil, repeats: true)
            NSRunLoop.mainRunLoop().addTimer(atime, forMode:NSDefaultRunLoopMode )
        }
        
    }
    func stop()  {
       atime.invalidate()
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override  func layoutSubviews() {
        let   w = self.bounds.size.width
        let   h =  self.bounds.size.height
        resetbtn.frame = CGRectMake(w-60, 30, 60, 30)
        dis.textAlignment = .Center
        dis.frame = CGRectMake(0,h/2-15 , w, 30)
        starbtn.frame = CGRectMake(10, CGRectGetMaxY(dis.frame)+50, 80, 30)
        stopbtn.frame = CGRectMake(w-90, CGRectGetMaxY(dis.frame)+50, 80, 30)
        
        
        
    }
    
    

}
