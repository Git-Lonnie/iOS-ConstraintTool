//
//  ConstraintMaker.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 约束制造器，提供 DSL 接口
public class ConstraintMaker {
    
    internal var descriptions: [ConstraintDescription] = []
    internal weak var view: ConstraintView?
    
    internal init(view: ConstraintView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Public Properties
    
    public var left: ConstraintDescription {
        return addConstraint(for: .left)
    }
    
    public var top: ConstraintDescription {
        return addConstraint(for: .top)
    }
    
    public var right: ConstraintDescription {
        return addConstraint(for: .right)
    }
    
    public var bottom: ConstraintDescription {
        return addConstraint(for: .bottom)
    }
    
    public var leading: ConstraintDescription {
        return addConstraint(for: .leading)
    }
    
    public var trailing: ConstraintDescription {
        return addConstraint(for: .trailing)
    }
    
    public var width: ConstraintDescription {
        return addConstraint(for: .width)
    }
    
    public var height: ConstraintDescription {
        return addConstraint(for: .height)
    }
    
    public var centerX: ConstraintDescription {
        return addConstraint(for: .centerX)
    }
    
    public var centerY: ConstraintDescription {
        return addConstraint(for: .centerY)
    }
    
    public var lastBaseline: ConstraintDescription {
        return addConstraint(for: .lastBaseline)
    }
    
    public var firstBaseline: ConstraintDescription {
        return addConstraint(for: .firstBaseline)
    }
    
    public var leftMargin: ConstraintDescription {
        return addConstraint(for: .leftMargin)
    }
    
    public var rightMargin: ConstraintDescription {
        return addConstraint(for: .rightMargin)
    }
    
    public var topMargin: ConstraintDescription {
        return addConstraint(for: .topMargin)
    }
    
    public var bottomMargin: ConstraintDescription {
        return addConstraint(for: .bottomMargin)
    }
    
    public var leadingMargin: ConstraintDescription {
        return addConstraint(for: .leadingMargin)
    }
    
    public var trailingMargin: ConstraintDescription {
        return addConstraint(for: .trailingMargin)
    }
    
    public var centerXWithinMargins: ConstraintDescription {
        return addConstraint(for: .centerXWithinMargins)
    }
    
    public var centerYWithinMargins: ConstraintDescription {
        return addConstraint(for: .centerYWithinMargins)
    }
    
    public var edges: ConstraintDescription {
        let description = ConstraintDescription(item: ConstraintItem(target: view, attribute: .none))
        // 创建复合约束
        _ = addConstraint(for: .top)
        _ = addConstraint(for: .left)
        _ = addConstraint(for: .bottom)
        _ = addConstraint(for: .right)
        return description
    }
    
    public var size: ConstraintDescription {
        let description = ConstraintDescription(item: ConstraintItem(target: view, attribute: .none))
        _ = addConstraint(for: .width)
        _ = addConstraint(for: .height)
        return description
    }
    
    public var center: ConstraintDescription {
        let description = ConstraintDescription(item: ConstraintItem(target: view, attribute: .none))
        _ = addConstraint(for: .centerX)
        _ = addConstraint(for: .centerY)
        return description
    }
    
    // MARK: - Internal Methods
    
    internal func addConstraint(for attribute: ConstraintAttribute) -> ConstraintDescription {
        let item = ConstraintItem(target: view, attribute: attribute)
        let description = ConstraintDescription(item: item)
        descriptions.append(description)
        return description
    }
    
    internal func install() {
        guard let view = view else { return }
        
        let constraints = descriptions.compactMap { $0.makeConstraint() }
        
        for constraint in constraints {
            // 找到合适的视图来添加约束
            if let toView = constraint.secondItem as? ConstraintView {
                if let commonSuperview = view.commonSuperview(with: toView) {
                    commonSuperview.addConstraint(constraint)
                }
            } else {
                view.addConstraint(constraint)
            }
        }
    }
}

