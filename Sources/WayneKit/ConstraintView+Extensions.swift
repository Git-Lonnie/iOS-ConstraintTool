//
//  ConstraintView+Extensions.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias ConstraintView = UIView

#else
import AppKit

public typealias ConstraintView = NSView

#endif

extension ConstraintView {
    
    // MARK: - Public DSL Methods
    
    /// 创建约束
    @discardableResult
    public func makeConstraints(_ closure: (ConstraintMaker) -> Void) -> [NSLayoutConstraint] {
        let maker = ConstraintMaker(view: self)
        closure(maker)
        maker.install()
        return maker.descriptions.compactMap { $0.constraint }
    }
    
    /// 更新约束
    @discardableResult
    public func updateConstraints(_ closure: (ConstraintMaker) -> Void) -> [NSLayoutConstraint] {
        return makeConstraints(closure)
    }
    
    /// 重新制作约束（移除旧约束）
    @discardableResult
    public func remakeConstraints(_ closure: (ConstraintMaker) -> Void) -> [NSLayoutConstraint] {
        removeConstraints()
        return makeConstraints(closure)
    }
    
    /// 移除所有约束
    public func removeConstraints() {
        let allConstraints = self.constraints.filter { constraint in
            return constraint.firstItem as? ConstraintView == self ||
                   constraint.secondItem as? ConstraintView == self
        }
        
        self.removeConstraints(allConstraints)
        
        if let superview = self.superview {
            let superviewConstraints = superview.constraints.filter { constraint in
                return constraint.firstItem as? ConstraintView == self ||
                       constraint.secondItem as? ConstraintView == self
            }
            superview.removeConstraints(superviewConstraints)
        }
    }
    
    // MARK: - Constraint Attributes
    
    public var wayne_left: ConstraintItem {
        return ConstraintItem(target: self, attribute: .left)
    }
    
    public var wayne_top: ConstraintItem {
        return ConstraintItem(target: self, attribute: .top)
    }
    
    public var wayne_right: ConstraintItem {
        return ConstraintItem(target: self, attribute: .right)
    }
    
    public var wayne_bottom: ConstraintItem {
        return ConstraintItem(target: self, attribute: .bottom)
    }
    
    public var wayne_leading: ConstraintItem {
        return ConstraintItem(target: self, attribute: .leading)
    }
    
    public var wayne_trailing: ConstraintItem {
        return ConstraintItem(target: self, attribute: .trailing)
    }
    
    public var wayne_width: ConstraintItem {
        return ConstraintItem(target: self, attribute: .width)
    }
    
    public var wayne_height: ConstraintItem {
        return ConstraintItem(target: self, attribute: .height)
    }
    
    public var wayne_centerX: ConstraintItem {
        return ConstraintItem(target: self, attribute: .centerX)
    }
    
    public var wayne_centerY: ConstraintItem {
        return ConstraintItem(target: self, attribute: .centerY)
    }
    
    public var wayne_lastBaseline: ConstraintItem {
        return ConstraintItem(target: self, attribute: .lastBaseline)
    }
    
    public var wayne_firstBaseline: ConstraintItem {
        return ConstraintItem(target: self, attribute: .firstBaseline)
    }
    
    // MARK: - Internal Helper
    
    internal func commonSuperview(with other: ConstraintView) -> ConstraintView? {
        var current: ConstraintView? = self
        while current != nil {
            if other.isDescendant(of: current!) {
                return current
            }
            current = current?.superview
        }
        return nil
    }
}

