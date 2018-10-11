//
//  SFPresentationBottom.swift
//  BottomAlertDemo
//
//  Created by Beyond on 2018/6/26.
//  Copyright © 2018年 张东坡. All rights reserved.
//

import UIKit

// 底部 view 的高度协议，必须遵守这个协议，提供弹出的高度
protocol SFPresentBottomViewControllerProtocol {
    var controllerHeight: CGFloat {set get}
}

class SFPresentationBottom: UIPresentationController {
    // MARK: - Properties
    lazy var backgroundBlackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapBg))
        view.addGestureRecognizer(tap)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect.init(x: 0, y: UIScreen.main.bounds.height - controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0))
    }
    
    /// 底部弹出 view 的高度
    public var controllerHeight:CGFloat
    
    // MARK: - Instance Method
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if case let vc as  SFPresentBottomViewControllerProtocol = presentedViewController {
            controllerHeight = vc.controllerHeight 
        }else {
            controllerHeight = UIScreen.main.bounds.height
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        backgroundBlackView.alpha = 0
        containerView?.addSubview(backgroundBlackView)
        UIView.animate(withDuration: 0.5) {
            self.backgroundBlackView.alpha = 1
        }
    }

    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) {
            self.backgroundBlackView.alpha = 0
        }
    }
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.backgroundBlackView.removeFromSuperview()
        }
    }
    
    // MARK: - Action Event
    @objc func tapBg() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}

// Bottom VC Base Class,Must inherit this class
public class SFPresentBottomViewController: UIViewController,UIViewControllerTransitioningDelegate {
    // MARK: - Instance Method
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        if !(self is SFPresentBottomViewControllerProtocol) {
            fatalError("子类必须遵守SFPresentBottomViewControllerProtocol")
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if !(self is SFPresentBottomViewControllerProtocol) {
            fatalError("子类必须遵守SFPresentBottomViewControllerProtocol")
        }
    }
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentation = SFPresentationBottom.init(presentedViewController: presented, presenting: presenting)
        return presentation
    }
}

// MARK: - UIViewController extension
extension UIViewController {

    public func presentBottom(vc: SFPresentBottomViewController) {
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = vc
        self.present(vc, animated: true, completion: nil)
    }
   
}
