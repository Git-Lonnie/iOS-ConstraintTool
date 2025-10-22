//
//  ConstraintAttribute.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 约束属性枚举
public enum ConstraintAttribute {
    case left
    case top
    case right
    case bottom
    case leading
    case trailing
    case width
    case height
    case centerX
    case centerY
    case lastBaseline
    case firstBaseline
    
    case leftMargin
    case rightMargin
    case topMargin
    case bottomMargin
    case leadingMargin
    case trailingMargin
    case centerXWithinMargins
    case centerYWithinMargins
    
    case none
    
    internal var layoutAttribute: NSLayoutConstraint.Attribute {
        switch self {
        case .left:
            return .left
        case .top:
            return .top
        case .right:
            return .right
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .width:
            return .width
        case .height:
            return .height
        case .centerX:
            return .centerX
        case .centerY:
            return .centerY
        case .lastBaseline:
            return .lastBaseline
        case .firstBaseline:
            return .firstBaseline
        case .leftMargin:
            #if os(iOS) || os(tvOS)
            return .leftMargin
            #else
            return .left
            #endif
        case .rightMargin:
            #if os(iOS) || os(tvOS)
            return .rightMargin
            #else
            return .right
            #endif
        case .topMargin:
            #if os(iOS) || os(tvOS)
            return .topMargin
            #else
            return .top
            #endif
        case .bottomMargin:
            #if os(iOS) || os(tvOS)
            return .bottomMargin
            #else
            return .bottom
            #endif
        case .leadingMargin:
            #if os(iOS) || os(tvOS)
            return .leadingMargin
            #else
            return .leading
            #endif
        case .trailingMargin:
            #if os(iOS) || os(tvOS)
            return .trailingMargin
            #else
            return .trailing
            #endif
        case .centerXWithinMargins:
            #if os(iOS) || os(tvOS)
            return .centerXWithinMargins
            #else
            return .centerX
            #endif
        case .centerYWithinMargins:
            #if os(iOS) || os(tvOS)
            return .centerYWithinMargins
            #else
            return .centerY
            #endif
        case .none:
            return .notAnAttribute
        }
    }
}

