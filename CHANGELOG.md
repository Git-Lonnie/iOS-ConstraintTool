# 更新日志

所有对 WayneKit 项目的重要更改都将记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [1.0.0] - 2025-10-22

### 新增

- ✨ 初始版本发布
- 🎯 实现核心约束 DSL API
- 📱 支持 iOS 12.0+, macOS 10.13+, tvOS 12.0+
- 🔧 基础约束属性 (left, right, top, bottom, leading, trailing, width, height, centerX, centerY)
- 🎨 链式 API 设计
- 🔄 约束关系支持 (equalTo, lessThanOrEqualTo, greaterThanOrEqualTo)
- ⚙️ 约束修饰符 (offset, inset, multipliedBy, dividedBy, priority)
- 📐 LayoutPriority 扩展 (high, medium, low)
- 🔨 makeConstraints, updateConstraints, remakeConstraints 方法
- 🗑️ removeConstraints 支持
- 📚 完整的文档和示例代码
- ✅ 单元测试覆盖

### 特性

#### 约束制作

- `makeConstraints(_:)` - 创建新约束
- `updateConstraints(_:)` - 更新现有约束
- `remakeConstraints(_:)` - 移除旧约束并创建新约束
- `removeConstraints()` - 移除所有相关约束

#### 约束属性

支持以下约束属性，使用 `wn_` 前缀：
- 边缘: left, right, top, bottom, leading, trailing
- 尺寸: width, height
- 中心: centerX, centerY
- 基线: lastBaseline, firstBaseline
- 边距: leftMargin, rightMargin, topMargin, bottomMargin, leadingMargin, trailingMargin
- 特殊: centerXWithinMargins, centerYWithinMargins

#### 约束关系

- `equalTo(_:)` - 等于关系
- `lessThanOrEqualTo(_:)` - 小于或等于关系
- `greaterThanOrEqualTo(_:)` - 大于或等于关系

#### 约束修饰符

- `offset(_:)` - 设置偏移量
- `inset(_:)` - 设置内边距
- `multipliedBy(_:)` - 设置乘数
- `dividedBy(_:)` - 设置除数
- `priority(_:)` - 设置优先级

### 技术细节

- Swift 5.9+
- 支持 Swift Package Manager
- 零依赖
- 跨平台支持 (iOS, macOS, tvOS)

### 已知问题

无

### 文档

- README.md - 完整的使用文档
- QUICKSTART.md - 快速入门指南
- Examples/ - 示例代码
- 完整的代码注释

---

## [未来计划]

### 待添加功能

- [ ] SwiftUI 支持
- [ ] 更多便捷方法（如 edges, size, center 的批量设置）
- [ ] 约束动画辅助方法
- [ ] 调试辅助工具
- [ ] 更多示例和教程
- [ ] 性能优化

### 考虑中的功能

- 约束组管理
- 约束条件支持
- 自定义约束优先级预设
- Constraint 引用管理

---

[1.0.0]: https://github.com/wayne/WayneKit/releases/tag/1.0.0

