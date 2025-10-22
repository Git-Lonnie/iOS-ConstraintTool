//
//  ConstraintInsets.swift
//  WayneKit
//
//  Created by WayneKit
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias ConstraintInsets = UIEdgeInsets

#else
import AppKit

public typealias ConstraintInsets = NSEdgeInsets

#endif

extension ConstraintInsets {
    
    public init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}

