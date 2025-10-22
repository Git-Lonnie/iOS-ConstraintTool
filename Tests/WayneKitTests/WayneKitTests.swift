//
//  WayneKitTests.swift
//  WayneKit
//
//  Created by WayneKit
//

import XCTest
@testable import WayneKit

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

final class WayneKitTests: XCTestCase {
    
    var containerView: ConstraintView!
    var testView: ConstraintView!
    
    override func setUp() {
        super.setUp()
        containerView = ConstraintView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        testView = ConstraintView(frame: .zero)
        containerView.addSubview(testView)
    }
    
    override func tearDown() {
        testView.removeFromSuperview()
        testView = nil
        containerView = nil
        super.tearDown()
    }
    
    func testMakeConstraints() {
        testView.makeConstraints { make in
            make.top.equalTo(containerView.wn_top).offset(10)
            make.left.equalTo(containerView.wn_left).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        XCTAssertFalse(testView.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(containerView.constraints.count > 0)
    }
    
    func testConstraintAttributes() {
        testView.makeConstraints { make in
            make.top.equalTo(containerView)
            make.leading.equalTo(containerView)
            make.trailing.equalTo(containerView)
            make.bottom.equalTo(containerView)
        }
        
        XCTAssertTrue(containerView.constraints.count >= 4)
    }
    
    func testConstraintPriority() {
        testView.makeConstraints { make in
            make.width.equalTo(100).priority(.high)
            make.height.equalTo(100).priority(750)
        }
        
        let constraints = testView.constraints
        XCTAssertTrue(constraints.count > 0)
        
        for constraint in constraints {
            if constraint.firstAttribute == .width {
                XCTAssertEqual(constraint.priority.rawValue, LayoutPriority.high.rawValue)
            }
        }
    }
    
    func testConstraintMultiplier() {
        testView.makeConstraints { make in
            make.width.equalTo(containerView.wn_width).multipliedBy(0.5)
            make.height.equalTo(containerView.wn_height).dividedBy(2)
        }
        
        let constraints = containerView.constraints
        XCTAssertTrue(constraints.count >= 2)
        
        for constraint in constraints {
            if constraint.firstAttribute == .width || constraint.firstAttribute == .height {
                XCTAssertEqual(constraint.multiplier, 0.5, accuracy: 0.001)
            }
        }
    }
    
    func testConstraintRelations() {
        testView.makeConstraints { make in
            make.width.greaterThanOrEqualTo(50)
            make.height.lessThanOrEqualTo(200)
        }
        
        let constraints = testView.constraints
        XCTAssertTrue(constraints.count >= 2)
    }
    
    func testConstraintCenter() {
        testView.makeConstraints { make in
            make.centerX.equalTo(containerView)
            make.centerY.equalTo(containerView)
            make.width.height.equalTo(50)
        }
        
        XCTAssertTrue(containerView.constraints.count > 0)
    }
    
    func testRemoveConstraints() {
        testView.makeConstraints { make in
            make.top.left.equalTo(containerView)
            make.width.height.equalTo(100)
        }
        
        let initialCount = containerView.constraints.count + testView.constraints.count
        XCTAssertTrue(initialCount > 0)
        
        testView.removeConstraints()
        
        let finalCount = containerView.constraints.filter { constraint in
            return constraint.firstItem as? ConstraintView == testView ||
                   constraint.secondItem as? ConstraintView == testView
        }.count + testView.constraints.count
        
        XCTAssertEqual(finalCount, 0)
    }
    
    func testVersionInfo() {
        XCTAssertEqual(WayneKit.version, "1.0.0")
        XCTAssertEqual(WayneKit.author, "Wayne")
    }
}

