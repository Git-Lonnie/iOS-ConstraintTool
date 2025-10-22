//
//  ConstraintRelation.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 约束关系枚举
public enum ConstraintRelation {
    case equal
    case lessThanOrEqual
    case greaterThanOrEqual
    
    internal var layoutRelation: NSLayoutConstraint.Relation {
        switch self {
        case .equal:
            return .equal
        case .lessThanOrEqual:
            return .lessThanOrEqual
        case .greaterThanOrEqual:
            return .greaterThanOrEqual
        }
    }
}

