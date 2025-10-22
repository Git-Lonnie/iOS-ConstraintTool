//
//  ExampleViewController.swift
//  WayneKit Examples
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
import WayneKit

class ExampleViewController: UIViewController {
    
    // MARK: - UI Components
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WayneKit Demo"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let redBox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    let greenBox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    let blueBox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "这是使用 WayneKit 创建的约束示例"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        view.addSubview(containerView)
        containerView.addSubview(redBox)
        containerView.addSubview(greenBox)
        containerView.addSubview(blueBox)
        view.addSubview(infoLabel)
    }
    
    private func setupConstraints() {
        // Header View - 固定高度，顶部对齐
        headerView.makeConstraints { make in
            make.top.equalTo(view.wn_top)
            make.left.right.equalTo(view)
            make.height.equalTo(100)
        }
        
        // Title Label - 居中在 header 中
        titleLabel.makeConstraints { make in
            make.centerX.equalTo(headerView)
            make.centerY.equalTo(headerView)
            make.left.greaterThanOrEqualTo(headerView).offset(20)
            make.right.lessThanOrEqualTo(headerView).offset(-20)
        }
        
        // Container View - 填充剩余空间
        containerView.makeConstraints { make in
            make.top.equalTo(headerView.wn_bottom).offset(20)
            make.left.right.equalTo(view).inset(20)
            make.bottom.equalTo(infoLabel.wn_top).offset(-20)
        }
        
        // Red Box - 左上角
        redBox.makeConstraints { make in
            make.top.left.equalTo(containerView).offset(10)
            make.width.height.equalTo(80)
        }
        
        // Green Box - 右上角
        greenBox.makeConstraints { make in
            make.top.equalTo(containerView).offset(10)
            make.right.equalTo(containerView).offset(-10)
            make.width.height.equalTo(80)
        }
        
        // Blue Box - 居中，宽度为容器的一半
        blueBox.makeConstraints { make in
            make.centerX.centerY.equalTo(containerView)
            make.width.equalTo(containerView.wn_width).multipliedBy(0.5)
            make.height.equalTo(100)
        }
        
        // Info Label - 底部
        infoLabel.makeConstraints { make in
            make.left.right.equalTo(view).inset(20)
            make.bottom.equalTo(view.wn_bottom).offset(-50)
        }
    }
}

// MARK: - Example 2: Table-like Layout

class GridExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createGridLayout()
    }
    
    private func createGridLayout() {
        let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow,
                                  .systemGreen, .systemBlue, .systemIndigo,
                                  .systemPurple, .systemPink, .systemGray]
        
        let columns = 3
        let spacing: CGFloat = 10
        var views: [UIView] = []
        
        for color in colors {
            let view = UIView()
            view.backgroundColor = color
            self.view.addSubview(view)
            views.append(view)
        }
        
        for (index, currentView) in views.enumerated() {
            let row = index / columns
            let col = index % columns
            
            currentView.makeConstraints { make in
                // 水平位置
                if col == 0 {
                    make.left.equalTo(view).offset(spacing)
                } else {
                    make.left.equalTo(views[index - 1].wn_right).offset(spacing)
                }
                
                // 如果是每行最后一个，设置右边距
                if col == columns - 1 {
                    make.right.equalTo(view).offset(-spacing)
                }
                
                // 垂直位置
                if row == 0 {
                    make.top.equalTo(view.wn_top).offset(100)
                } else {
                    make.top.equalTo(views[index - columns].wn_bottom).offset(spacing)
                }
                
                // 宽度相等（对于同一行的视图）
                if col > 0 {
                    make.width.equalTo(views[index - 1].wn_width)
                }
                
                // 高度
                make.height.equalTo(100)
            }
        }
    }
}

// MARK: - Example 3: Dynamic Layout

class DynamicExampleViewController: UIViewController {
    
    let box = UIView()
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        box.backgroundColor = .systemBlue
        view.addSubview(box)
        
        setupConstraints()
        
        // 添加点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleSize))
        view.addGestureRecognizer(tap)
    }
    
    private func setupConstraints() {
        box.makeConstraints { make in
            make.center.equalTo(view)
            make.width.height.equalTo(100)
        }
    }
    
    @objc private func toggleSize() {
        isExpanded.toggle()
        
        // 移除旧约束并创建新约束
        box.remakeConstraints { make in
            make.center.equalTo(view)
            let size: CGFloat = isExpanded ? 200 : 100
            make.width.height.equalTo(size)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

#endif

