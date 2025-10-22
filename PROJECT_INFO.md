# WayneKit - 项目信息

## 📋 项目概述

**WayneKit** 是一个优雅的 Swift Auto Layout DSL（领域特定语言）库，灵感来源于著名的 SnapKit。它旨在简化 iOS、macOS 和 tvOS 应用中的约束编写，让开发者能够用更少的代码创建复杂的布局。

## 🎯 设计目标

1. **简洁性**: 提供简洁、易读的 API
2. **类型安全**: 利用 Swift 的类型系统避免运行时错误
3. **链式调用**: 支持流畅的链式 API 调用
4. **跨平台**: 支持 iOS、macOS 和 tvOS
5. **零依赖**: 不依赖任何第三方库
6. **易于学习**: 提供完整的文档和示例

## 🏗️ 项目结构

```
iOS-ConstraintTool/
├── Package.swift                      # Swift Package 清单文件
├── README.md                          # 项目说明文档
├── QUICKSTART.md                      # 快速入门指南
├── CHANGELOG.md                       # 更新日志
├── CONTRIBUTING.md                    # 贡献指南
├── LICENSE                            # MIT 许可证
├── .gitignore                         # Git 忽略文件
│
├── Sources/
│   └── WayneKit/
│       ├── WayneKit.swift            # 主入口文件
│       ├── ConstraintAttribute.swift  # 约束属性枚举
│       ├── ConstraintRelation.swift   # 约束关系枚举
│       ├── ConstraintItem.swift       # 约束项类
│       ├── ConstraintDescription.swift # 约束描述类
│       ├── ConstraintMaker.swift      # 约束制造器
│       ├── ConstraintMakerEditable.swift # 可编辑约束协议
│       ├── ConstraintView+Extensions.swift # UIView/NSView 扩展
│       ├── ConstraintInsets.swift     # 边距类型别名
│       └── LayoutPriority.swift       # 优先级扩展
│
├── Tests/
│   └── WayneKitTests/
│       └── WayneKitTests.swift       # 单元测试
│
└── Examples/
    └── ExampleViewController.swift    # 使用示例
```

## 🔧 核心组件

### 1. ConstraintAttribute (约束属性)

定义了所有可用的约束属性，如 left, right, top, bottom, width, height 等。

### 2. ConstraintRelation (约束关系)

定义了约束的关系类型：
- equal (等于)
- lessThanOrEqual (小于或等于)
- greaterThanOrEqual (大于或等于)

### 3. ConstraintItem (约束项)

表示一个视图的特定属性，由目标视图和属性类型组成。

### 4. ConstraintDescription (约束描述)

封装了约束的所有信息，包括关系、常量、乘数和优先级。提供链式 API 用于配置约束。

### 5. ConstraintMaker (约束制造器)

DSL 的核心，提供流畅的接口来创建约束。通过计算属性（如 top, left）返回 ConstraintDescription。

### 6. ConstraintView+Extensions (视图扩展)

为 UIView/NSView 添加 DSL 入口方法：
- `makeConstraints(_:)` - 创建约束
- `updateConstraints(_:)` - 更新约束
- `remakeConstraints(_:)` - 重做约束
- `removeConstraints()` - 移除约束

## 💡 设计模式

### Builder 模式

使用 Builder 模式构建约束，通过 `ConstraintMaker` 提供流畅的接口。

### 链式调用

所有约束配置方法返回 `self`，支持链式调用：

```swift
make.top.equalTo(view).offset(10).priority(.high)
```

### 类型安全

使用 Swift 的类型系统确保 API 的正确使用，在编译时捕获错误。

### 协议导向

通过 `ConstraintMakerEditable` 协议定义可编辑约束的接口。

## 🎨 API 设计理念

### 1. 自然语言风格

```swift
make.width.equalTo(200)          // 宽度等于 200
make.top.lessThanOrEqualTo(100)  // 顶部小于或等于 100
```

### 2. 属性前缀

使用 `wn_` 前缀避免与系统属性冲突：

```swift
make.left.equalTo(view.wn_right)
```

### 3. 简洁的修饰符

```swift
.offset(10)          // 偏移
.inset(20)           // 内边距
.multipliedBy(0.5)   // 乘数
.priority(.high)     // 优先级
```

## 🔍 与 SnapKit 的对比

| 特性 | WayneKit | SnapKit |
|------|----------|---------|
| 基础约束 | ✅ | ✅ |
| 链式 API | ✅ | ✅ |
| 属性前缀 | `wn_` | `snp_` |
| 代码量 | 较少 | 较多 |
| 功能完整性 | 核心功能 | 更丰富 |
| 学习曲线 | 平缓 | 中等 |
| 依赖 | 无 | 无 |

## 📊 技术指标

- **代码行数**: ~600 行核心代码
- **支持平台**: iOS 12.0+, macOS 10.13+, tvOS 12.0+
- **Swift 版本**: 5.9+
- **依赖**: 0
- **测试覆盖**: 包含基础单元测试

## 🚀 使用场景

### 适用场景

✅ 新项目需要约束库  
✅ 希望代码更简洁易读  
✅ 需要跨平台支持  
✅ 学习约束 DSL 的实现  
✅ 需要轻量级的约束解决方案  

### 不适用场景

❌ 需要极其复杂的约束管理  
❌ 项目已使用其他约束库  
❌ 需要 Interface Builder 集成  

## 🧪 测试策略

### 单元测试

- 基础约束创建
- 约束关系
- 约束修饰符
- 优先级设置
- 约束移除

### 集成测试

在实际项目中验证：
- 性能表现
- 内存管理
- 约束冲突处理

## 📈 未来规划

### 短期目标 (v1.x)

- [ ] 完善文档和示例
- [ ] 优化性能
- [ ] 添加更多单元测试
- [ ] 社区反馈收集

### 中期目标 (v2.x)

- [ ] SwiftUI 支持
- [ ] 约束动画辅助
- [ ] 调试工具
- [ ] 更多便捷方法

### 长期目标 (v3.x)

- [ ] 可视化约束编辑器
- [ ] AI 辅助布局建议
- [ ] 性能分析工具

## 🤝 贡献

欢迎贡献！请查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解详情。

## 📝 许可证

WayneKit 使用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 👥 作者

**Wayne**

## 🙏 致谢

- 感谢 [SnapKit](https://github.com/SnapKit/SnapKit) 团队的灵感
- 感谢 Swift 社区的支持

## 📞 联系方式

- GitHub Issues: 用于 bug 报告和功能请求
- Pull Requests: 欢迎代码贡献

---

**WayneKit** - 让约束更简单 ⚡️

