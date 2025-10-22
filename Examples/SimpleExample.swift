//
//  SimpleExample.swift
//  WayneKit Examples
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
import WayneKit

/// 简单示例 - 展示 WayneKit 的基本用法
class SimpleExample {
    
    // MARK: - Example 1: 基础约束
    
    /// 创建一个居中的正方形视图
    static func createCenteredSquare(in parentView: UIView) -> UIView {
        let box = UIView()
        box.backgroundColor = .systemBlue
        parentView.addSubview(box)
        
        box.makeConstraints { make in
            make.centerX.equalTo(parentView)
            make.centerY.equalTo(parentView)
            make.width.height.equalTo(100)
        }
        
        return box
    }
    
    // MARK: - Example 2: 相对布局
    
    /// 创建两个垂直排列的视图
    static func createVerticalStack(in parentView: UIView) -> (UIView, UIView) {
        let topBox = UIView()
        topBox.backgroundColor = .systemRed
        
        let bottomBox = UIView()
        bottomBox.backgroundColor = .systemGreen
        
        parentView.addSubview(topBox)
        parentView.addSubview(bottomBox)
        
        // 顶部视图
        topBox.makeConstraints { make in
            make.top.equalTo(parentView).offset(50)
            make.left.right.equalTo(parentView).inset(20)
            make.height.equalTo(100)
        }
        
        // 底部视图
        bottomBox.makeConstraints { make in
            make.top.equalTo(topBox.wayne_bottom).offset(20)
            make.left.right.equalTo(topBox)
            make.height.equalTo(topBox)
        }
        
        return (topBox, bottomBox)
    }
    
    // MARK: - Example 3: 比例布局
    
    /// 创建占据父视图 80% 宽度的视图
    static func createProportionalView(in parentView: UIView) -> UIView {
        let box = UIView()
        box.backgroundColor = .systemPurple
        parentView.addSubview(box)
        
        box.makeConstraints { make in
            make.center.equalTo(parentView)
            make.width.equalTo(parentView.wayne_width).multipliedBy(0.8)
            make.height.equalTo(box.wayne_width).multipliedBy(0.5) // 宽高比 2:1
        }
        
        return box
    }
    
    // MARK: - Example 4: 优先级
    
    /// 创建一个带有优先级的可变宽度视图
    static func createFlexibleView(in parentView: UIView) -> UIView {
        let box = UIView()
        box.backgroundColor = .systemOrange
        parentView.addSubview(box)
        
        box.makeConstraints { make in
            make.centerY.equalTo(parentView)
            make.left.equalTo(parentView).offset(20)
            make.right.lessThanOrEqualTo(parentView).offset(-20)
            
            // 期望宽度 300，但可以更小
            make.width.equalTo(300).priority(.high)
            make.height.equalTo(80)
        }
        
        return box
    }
    
    // MARK: - Example 5: 填充父视图
    
    /// 创建一个填充父视图的视图（带边距）
    static func createFullScreenView(in parentView: UIView, inset: CGFloat = 20) -> UIView {
        let box = UIView()
        box.backgroundColor = .systemTeal
        parentView.addSubview(box)
        
        box.makeConstraints { make in
            make.top.equalTo(parentView).offset(inset)
            make.left.equalTo(parentView).offset(inset)
            make.bottom.equalTo(parentView).offset(-inset)
            make.right.equalTo(parentView).offset(-inset)
        }
        
        return box
    }
    
    // MARK: - Example 6: 更新约束
    
    /// 演示如何动态更新约束
    static func animateConstraintChange(for view: UIView, in parentView: UIView) {
        // 重新创建约束
        view.remakeConstraints { make in
            make.center.equalTo(parentView)
            make.width.height.equalTo(200) // 从 100 变为 200
        }
        
        // 动画更新
        UIView.animate(withDuration: 0.3) {
            parentView.layoutIfNeeded()
        }
    }
    
    // MARK: - Example 7: 多个视图等宽
    
    /// 创建三个等宽的视图
    static func createEqualWidthViews(in parentView: UIView) -> [UIView] {
        let colors: [UIColor] = [.systemRed, .systemGreen, .systemBlue]
        var views: [UIView] = []
        
        for color in colors {
            let box = UIView()
            box.backgroundColor = color
            parentView.addSubview(box)
            views.append(box)
        }
        
        let spacing: CGFloat = 10
        
        for (index, box) in views.enumerated() {
            box.makeConstraints { make in
                make.top.equalTo(parentView).offset(100)
                make.height.equalTo(100)
                
                if index == 0 {
                    // 第一个视图
                    make.left.equalTo(parentView).offset(spacing)
                } else {
                    // 后续视图
                    make.left.equalTo(views[index - 1].wayne_right).offset(spacing)
                    make.width.equalTo(views[0].wayne_width) // 与第一个等宽
                }
                
                if index == views.count - 1 {
                    // 最后一个视图
                    make.right.equalTo(parentView).offset(-spacing)
                }
            }
        }
        
        return views
    }
    
    // MARK: - Example 8: 复杂布局
    
    /// 创建一个带标题和内容的卡片视图
    static func createCardView(in parentView: UIView) -> UIView {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = 12
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.1
        card.layer.shadowRadius = 8
        
        let titleLabel = UILabel()
        titleLabel.text = "Card Title"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        let contentLabel = UILabel()
        contentLabel.text = "This is the card content created with WayneKit"
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.numberOfLines = 0
        
        parentView.addSubview(card)
        card.addSubview(titleLabel)
        card.addSubview(contentLabel)
        
        // 卡片布局
        card.makeConstraints { make in
            make.center.equalTo(parentView)
            make.width.equalTo(parentView.wayne_width).multipliedBy(0.9)
        }
        
        // 标题布局
        titleLabel.makeConstraints { make in
            make.top.equalTo(card).offset(20)
            make.left.right.equalTo(card).inset(20)
        }
        
        // 内容布局
        contentLabel.makeConstraints { make in
            make.top.equalTo(titleLabel.wayne_bottom).offset(12)
            make.left.right.equalTo(titleLabel)
            make.bottom.equalTo(card).offset(-20)
        }
        
        return card
    }
}

// MARK: - 完整的视图控制器示例

class CompleteExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // 使用上面的任何示例
        _ = SimpleExample.createCenteredSquare(in: view)
        
        // 或者创建你自己的布局
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        let container = UIView()
        container.backgroundColor = .systemGray6
        view.addSubview(container)
        
        container.makeConstraints { make in
            make.center.equalTo(view)
            make.width.height.equalTo(300)
        }
        
        let innerBox = UIView()
        innerBox.backgroundColor = .systemIndigo
        container.addSubview(innerBox)
        
        innerBox.makeConstraints { make in
            make.center.equalTo(container)
            make.width.height.equalTo(container.wayne_width).dividedBy(2)
        }
    }
}

#endif

