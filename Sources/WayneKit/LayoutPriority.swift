//
//  LayoutPriority.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias LayoutPriority = UILayoutPriority

extension LayoutPriority {
    public static var high: LayoutPriority {
        return .defaultHigh
    }
    
    public static var medium: LayoutPriority {
        return LayoutPriority(rawValue: 500)
    }
    
    public static var low: LayoutPriority {
        return .defaultLow
    }
}

#else
import AppKit

public typealias LayoutPriority = NSLayoutConstraint.Priority

extension LayoutPriority {
    public static var high: LayoutPriority {
        return .defaultHigh
    }
    
    public static var medium: LayoutPriority {
        return LayoutPriority(rawValue: 500)
    }
    
    public static var low: LayoutPriority {
        return .defaultLow
    }
}

#endif

