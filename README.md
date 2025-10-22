# WayneKit

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20|%20tvOS-blue.svg)](https://developer.apple.com)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager)

WayneKit 是一个优雅的 Swift Auto Layout DSL 库，受 SnapKit 启发。它让约束的编写变得简洁、直观、类型安全。

## 特性

- ✨ 简洁的链式 API
- 🎯 类型安全的约束构建
- 📱 支持 iOS、macOS 和 tvOS
- 🚀 零依赖，轻量级
- 🔧 易于使用和集成

## 安装

### Swift Package Manager

在 `Package.swift` 文件中添加：

```swift
dependencies: [
    .package(url: "https://github.com/wayne/WayneKit.git", from: "1.0.0")
]
```

或在 Xcode 中：
1. File > Add Packages...
2. 输入仓库 URL
3. 选择版本并添加到项目

## 使用方法

### 基础用法

```swift
import WayneKit

let box = UIView()
self.view.addSubview(box)

box.makeConstraints { make in
    make.top.equalTo(view.wayne_top).offset(20)
    make.left.equalTo(view.wayne_left).offset(20)
    make.width.height.equalTo(100)
}
```

### 相对约束

```swift
let label = UILabel()
view.addSubview(label)

label.makeConstraints { make in
    make.centerX.equalTo(view)
    make.centerY.equalTo(view)
    make.width.equalTo(view.wayne_width).multipliedBy(0.8)
}
```

### 边距约束

```swift
let contentView = UIView()
view.addSubview(contentView)

contentView.makeConstraints { make in
    make.top.equalTo(view).offset(20)
    make.left.right.equalTo(view).inset(16)
    make.bottom.equalTo(view).offset(-20)
}
```

### 尺寸约束

```swift
let imageView = UIImageView()
view.addSubview(imageView)

imageView.makeConstraints { make in
    make.centerX.centerY.equalTo(view)
    make.width.height.equalTo(200)
}

// 或者使用宽高比
imageView.makeConstraints { make in
    make.center.equalTo(view)
    make.width.equalTo(view.wayne_width).multipliedBy(0.5)
    make.height.equalTo(imageView.wayne_width).multipliedBy(1.5)
}
```

### 优先级

```swift
view.makeConstraints { make in
    make.width.equalTo(200).priority(.high)
    make.height.equalTo(100).priority(750)
}
```

### 关系约束

```swift
view.makeConstraints { make in
    make.width.greaterThanOrEqualTo(100)
    make.width.lessThanOrEqualTo(300)
    make.height.equalTo(view.wayne_width).multipliedBy(0.5)
}
```

### 更新约束

```swift
// 更新现有约束
view.updateConstraints { make in
    make.top.equalTo(superview).offset(50)
}

// 重新创建所有约束
view.remakeConstraints { make in
    make.center.equalTo(superview)
    make.size.equalTo(CGSize(width: 150, height: 150))
}
```

### 移除约束

```swift
view.removeConstraints()
```

## API 参考

### 约束属性

- `left`, `right`, `top`, `bottom`
- `leading`, `trailing`
- `width`, `height`
- `centerX`, `centerY`
- `lastBaseline`, `firstBaseline`
- Margin 属性：`leftMargin`, `rightMargin`, `topMargin`, `bottomMargin`, 等

### 约束关系

- `equalTo(_:)` - 等于
- `lessThanOrEqualTo(_:)` - 小于或等于
- `greaterThanOrEqualTo(_:)` - 大于或等于

### 修饰符

- `offset(_:)` - 偏移量
- `inset(_:)` - 内边距
- `multipliedBy(_:)` - 乘数
- `dividedBy(_:)` - 除数
- `priority(_:)` - 优先级

### 优先级常量

- `.required` - 必需 (1000)
- `.high` - 高 (750)
- `.medium` - 中 (500)
- `.low` - 低 (250)

## 示例

### 简单布局

```swift
class ViewController: UIViewController {
    let headerView = UIView()
    let contentView = UIView()
    let footerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(contentView)
        view.addSubview(footerView)
        
        headerView.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(60)
        }
        
        contentView.makeConstraints { make in
            make.top.equalTo(headerView.wayne_bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(footerView.wayne_top)
        }
        
        footerView.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(50)
        }
    }
}
```

### 网格布局

```swift
let views = (0..<9).map { _ in UIView() }
let columns = 3
let spacing: CGFloat = 10

for (index, view) in views.enumerated() {
    self.view.addSubview(view)
    
    let row = index / columns
    let col = index % columns
    
    view.makeConstraints { make in
        if col == 0 {
            make.left.equalTo(self.view).offset(spacing)
        } else {
            make.left.equalTo(views[index - 1].wayne_right).offset(spacing)
        }
        
        if row == 0 {
            make.top.equalTo(self.view).offset(spacing)
        } else {
            make.top.equalTo(views[index - columns].wayne_bottom).offset(spacing)
        }
        
        make.width.height.equalTo(100)
    }
}
```

## 与 SnapKit 的差异

WayneKit 是对 SnapKit 的致敬和简化实现，主要区别：

1. 属性前缀：WayneKit 使用 `wayne_` 前缀（如 `wayne_top`, `wayne_left`）来避免与系统属性冲突
2. 简化的 API：专注于核心功能，减少复杂性
3. 轻量级实现：代码量更小，更易于理解和定制

## 系统要求

- iOS 12.0+ / macOS 10.13+ / tvOS 12.0+
- Swift 5.9+
- Xcode 15.0+

## 贡献

欢迎贡献！请随时提交 Pull Request。

## 许可证

WayneKit 采用 MIT 许可证。详见 LICENSE 文件。

## 作者

Wayne

## 致谢

- 感谢 [SnapKit](https://github.com/SnapKit/SnapKit) 提供的灵感
- 感谢所有贡献者
---
有问题联系QQ:540378725

