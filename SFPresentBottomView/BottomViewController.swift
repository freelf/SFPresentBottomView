//
//  BottomViewController.swift
//  SFPresentBottomView
//
//  Created by 张东坡 on 2018/10/11.
//  Copyright © 2018年 张东坡. All rights reserved.
//

import UIKit

public class BottomViewController: SFPresentBottomViewController, SFPresentBottomViewControllerProtocol {
    // MARK: - Properties
    var controllerHeight: CGFloat  = 300
    lazy var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 130, width: UIScreen.main.bounds.size.width, height: 40)
        label.textAlignment = .center
        label.text = "Hello Bottom"
        return label
    }()
    // MARK: - Instance Method
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
    }
}

