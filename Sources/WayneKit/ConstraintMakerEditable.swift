//
//  ConstraintMakerEditable.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 可编辑的约束接口
public protocol ConstraintMakerEditable {
    @discardableResult
    func offset(_ amount: CGFloat) -> ConstraintMakerEditable
    
    @discardableResult
    func inset(_ amount: CGFloat) -> ConstraintMakerEditable
    
    @discardableResult
    func multipliedBy(_ amount: CGFloat) -> ConstraintMakerEditable
    
    @discardableResult
    func dividedBy(_ amount: CGFloat) -> ConstraintMakerEditable
    
    @discardableResult
    func priority(_ priority: Float) -> ConstraintMakerEditable
    
    @discardableResult
    func priority(_ priority: LayoutPriority) -> ConstraintMakerEditable
}

