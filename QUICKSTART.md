# WayneKit 快速入门指南

## 安装

### 通过 Swift Package Manager

1. 在 Xcode 中打开你的项目
2. 选择 `File` > `Add Packages...`
3. 输入仓库 URL 或本地路径
4. 点击 `Add Package`

### 手动集成

将 WayneKit 文件夹拖入你的项目中。

## 5分钟快速上手

### 1. 导入框架

```swift
import WayneKit
```

### 2. 基础约束

最简单的约束 - 设置视图大小和位置：

```swift
let box = UIView()
box.backgroundColor = .blue
view.addSubview(box)

box.makeConstraints { make in
    make.width.equalTo(100)
    make.height.equalTo(100)
    make.centerX.equalTo(view)
    make.centerY.equalTo(view)
}
```

### 3. 相对于其他视图

```swift
let topBox = UIView()
let bottomBox = UIView()
view.addSubview(topBox)
view.addSubview(bottomBox)

topBox.makeConstraints { make in
    make.top.equalTo(view).offset(20)
    make.left.right.equalTo(view).inset(20)
    make.height.equalTo(100)
}

bottomBox.makeConstraints { make in
    make.top.equalTo(topBox.wayne_bottom).offset(10)
    make.left.right.equalTo(topBox)
    make.height.equalTo(topBox)
}
```

### 4. 使用比例

```swift
let imageView = UIImageView()
view.addSubview(imageView)

imageView.makeConstraints { make in
    make.centerX.centerY.equalTo(view)
    make.width.equalTo(view.wayne_width).multipliedBy(0.8)
    make.height.equalTo(imageView.wayne_width).multipliedBy(0.75) // 4:3 宽高比
}
```

### 5. 优先级

```swift
let flexibleView = UIView()
view.addSubview(flexibleView)

flexibleView.makeConstraints { make in
    make.width.equalTo(200).priority(.high)  // 高优先级
    make.width.lessThanOrEqualTo(view.wayne_width).priority(.required)  // 必需
    make.height.equalTo(100)
}
```

### 6. 更新约束

```swift
// 动态更新
UIView.animate(withDuration: 0.3) {
    myView.remakeConstraints { make in
        make.width.height.equalTo(200)  // 从 100 改为 200
        make.center.equalTo(self.view)
    }
    self.view.layoutIfNeeded()
}
```

## 常用属性

| 属性 | 说明 |
|------|------|
| `left`, `right`, `top`, `bottom` | 边缘 |
| `leading`, `trailing` | 前导/尾随（支持 RTL） |
| `width`, `height` | 尺寸 |
| `centerX`, `centerY` | 中心点 |

## 常用方法

| 方法 | 说明 |
|------|------|
| `equalTo()` | 等于 |
| `lessThanOrEqualTo()` | 小于或等于 |
| `greaterThanOrEqualTo()` | 大于或等于 |
| `offset()` | 偏移 |
| `inset()` | 内边距 |
| `multipliedBy()` | 乘以 |
| `dividedBy()` | 除以 |
| `priority()` | 优先级 |

## 实用模式

### 填充父视图（带边距）

```swift
childView.makeConstraints { make in
    make.top.equalTo(parentView).offset(10)
    make.left.equalTo(parentView).offset(10)
    make.bottom.equalTo(parentView).offset(-10)
    make.right.equalTo(parentView).offset(-10)
}
```

### 等宽/等高的多个视图

```swift
let views = [view1, view2, view3]
views.forEach { view.addSubview($0) }

for (index, currentView) in views.enumerated() {
    currentView.makeConstraints { make in
        make.height.equalTo(50)
        
        if index == 0 {
            make.top.equalTo(view).offset(20)
            make.left.right.equalTo(view).inset(20)
        } else {
            make.top.equalTo(views[index - 1].wayne_bottom).offset(10)
            make.left.right.equalTo(views[index - 1])
        }
    }
}
```

### 水平/垂直居中

```swift
// 居中
label.makeConstraints { make in
    make.center.equalTo(view)
}

// 或分别设置
label.makeConstraints { make in
    make.centerX.equalTo(view)
    make.centerY.equalTo(view)
}
```

### 宽高比

```swift
// 保持 16:9 宽高比
videoView.makeConstraints { make in
    make.left.right.equalTo(view)
    make.centerY.equalTo(view)
    make.height.equalTo(videoView.wayne_width).multipliedBy(9.0/16.0)
}
```

## 调试技巧

### 1. 查看约束冲突

在 Xcode 控制台中，如果有约束冲突，会显示详细信息。

### 2. 临时禁用约束

```swift
// 设置较低的优先级
make.width.equalTo(100).priority(.low)
```

### 3. 可视化调试

在 Xcode 中使用 `Debug View Hierarchy` 可以查看所有约束。

## 常见问题

### Q: 约束没有生效？

**A:** 确保视图已添加到父视图：
```swift
parentView.addSubview(childView)  // 必须先添加
childView.makeConstraints { make in
    // ...
}
```

### Q: 如何移除所有约束？

**A:** 使用 `removeConstraints()` 或 `remakeConstraints()`：
```swift
myView.removeConstraints()
// 或
myView.remakeConstraints { make in
    // 新的约束
}
```

### Q: 动画约束变化？

**A:** 在动画块中调用 `layoutIfNeeded()`：
```swift
myView.remakeConstraints { make in
    make.width.equalTo(200)
}

UIView.animate(withDuration: 0.3) {
    self.view.layoutIfNeeded()
}
```

## 下一步

- 查看 `Examples/ExampleViewController.swift` 获取更多示例
- 阅读完整的 `README.md` 文档
- 探索源代码了解实现细节

---

Happy Coding with WayneKit! 🎉

