## 缘起
以前实现这种效果，经常是创建一个 view，然后添加到 window 或者当前 view 上，再添加一个向上弹出动画。很是繁琐，如果弹出的 view 中包含一些 tableView 或者 collectionView，那这个类就会变得很复杂。这里利用一个 view controller 来实现，代码逻辑更好。以后会使用这种方式来添加更多的弹出效果。
## 使用说明
创建一个`UIViewController`,继承`SFPresentBottomViewController`，遵守`SFPresentBottomViewControllerProtocol`协议。实现对应的方法。
比如以下代码：
```swift
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
```
然后需要推出时的 view controller 使用以下代码：
```swift
let bottomView = BottomViewController()
presentBottom(vc: bottomView)
```
## 实现效果

<img src="http://ohg2bgicd.bkt.clouddn.com/PresentBottom.gif" width="375px" />


