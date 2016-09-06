//
//  ViewController.swift
//  simplechangetime
//
//  Created by lotawei on 16/9/6.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let    co = ClockView()
            co.frame = CGRectMake(0, 0,UIScreen.mainScreen().bounds.width, 250)
       view.addSubview(co)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

