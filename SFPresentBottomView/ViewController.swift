//
//  ViewController.swift
//  SFPresentBottomView
//
//  Created by 张东坡 on 2018/10/11.
//  Copyright © 2018年 张东坡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func presentBottomView(_ sender: Any) {
        let bottomView = BottomViewController()
        presentBottom(vc: bottomView)
    }
}

