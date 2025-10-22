//
//  ConstraintDescription.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 约束描述类，用于构建和配置约束
public class ConstraintDescription: ConstraintMakerEditable {
    
    internal var item: ConstraintItem
    internal var toItem: ConstraintItem?
    internal var relation: ConstraintRelation = .equal
    internal var constant: CGFloat = 0
    internal var multiplier: CGFloat = 1
    internal var priorityValue: Float = 1000
    internal var constraint: NSLayoutConstraint?
    
    internal init(item: ConstraintItem) {
        self.item = item
    }
    
    // MARK: - Relation
    
    @discardableResult
    public func equalTo(_ other: ConstraintItem) -> ConstraintMakerEditable {
        self.relation = .equal
        self.toItem = other
        return self
    }
    
    @discardableResult
    public func equalTo(_ other: ConstraintView) -> ConstraintMakerEditable {
        return equalTo(ConstraintItem(target: other, attribute: self.item.attribute))
    }
    
    @discardableResult
    public func equalTo(_ constant: CGFloat) -> ConstraintMakerEditable {
        self.relation = .equal
        self.constant = constant
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ other: ConstraintItem) -> ConstraintMakerEditable {
        self.relation = .lessThanOrEqual
        self.toItem = other
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ other: ConstraintView) -> ConstraintMakerEditable {
        return lessThanOrEqualTo(ConstraintItem(target: other, attribute: self.item.attribute))
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ constant: CGFloat) -> ConstraintMakerEditable {
        self.relation = .lessThanOrEqual
        self.constant = constant
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ other: ConstraintItem) -> ConstraintMakerEditable {
        self.relation = .greaterThanOrEqual
        self.toItem = other
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ other: ConstraintView) -> ConstraintMakerEditable {
        return greaterThanOrEqualTo(ConstraintItem(target: other, attribute: self.item.attribute))
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ constant: CGFloat) -> ConstraintMakerEditable {
        self.relation = .greaterThanOrEqual
        self.constant = constant
        return self
    }
    
    // MARK: - Modifier
    
    @discardableResult
    public func offset(_ amount: CGFloat) -> ConstraintMakerEditable {
        self.constant = amount
        return self
    }
    
    @discardableResult
    public func inset(_ amount: CGFloat) -> ConstraintMakerEditable {
        self.constant = amount
        return self
    }
    
    @discardableResult
    public func multipliedBy(_ amount: CGFloat) -> ConstraintMakerEditable {
        self.multiplier = amount
        return self
    }
    
    @discardableResult
    public func dividedBy(_ amount: CGFloat) -> ConstraintMakerEditable {
        self.multiplier = 1.0 / amount
        return self
    }
    
    @discardableResult
    public func priority(_ priority: Float) -> ConstraintMakerEditable {
        self.priorityValue = priority
        return self
    }
    
    @discardableResult
    public func priority(_ priority: LayoutPriority) -> ConstraintMakerEditable {
        self.priorityValue = priority.rawValue
        return self
    }
    
    // MARK: - Internal
    
    internal func makeConstraint() -> NSLayoutConstraint? {
        guard let fromView = self.item.target as? ConstraintView else {
            return nil
        }
        
        let toView = self.toItem?.target as? ConstraintView
        let toAttribute = self.toItem?.attribute.layoutAttribute ?? .notAnAttribute
        
        let constraint = NSLayoutConstraint(
            item: fromView,
            attribute: self.item.attribute.layoutAttribute,
            relatedBy: self.relation.layoutRelation,
            toItem: toView,
            attribute: toAttribute,
            multiplier: self.multiplier,
            constant: self.constant
        )
        
        constraint.priority = LayoutPriority(rawValue: self.priorityValue)
        
        self.constraint = constraint
        return constraint
    }
}

