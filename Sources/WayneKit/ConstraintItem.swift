//
//  ConstraintItem.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 约束项，表示一个视图的特定属性
public class ConstraintItem {
    
    internal weak var target: AnyObject?
    internal let attribute: ConstraintAttribute
    
    internal init(target: AnyObject?, attribute: ConstraintAttribute) {
        self.target = target
        self.attribute = attribute
    }
}

