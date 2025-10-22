# 贡献指南

感谢你考虑为 WayneKit 做出贡献！

## 行为准则

- 尊重所有贡献者
- 保持专业和友好的交流
- 接受建设性的批评

## 如何贡献

### 报告 Bug

在创建 issue 之前，请确保：

1. 检查是否已存在类似的 issue
2. 使用最新版本的 WayneKit
3. 提供详细的复现步骤

创建 bug 报告时，请包含：

- **标题**: 简短、描述性的标题
- **描述**: 清晰的问题描述
- **复现步骤**: 详细的复现步骤
- **期望行为**: 你期望发生什么
- **实际行为**: 实际发生了什么
- **环境信息**: 
  - WayneKit 版本
  - iOS/macOS/tvOS 版本
  - Xcode 版本
  - Swift 版本
- **代码示例**: 最小可复现代码
- **截图**: 如果适用

### 功能请求

我们欢迎功能建议！请：

1. 检查是否已有类似的功能请求
2. 清楚地描述你想要的功能
3. 解释为什么这个功能有用
4. 提供使用示例（如果可能）

### Pull Requests

#### 开发流程

1. **Fork 仓库**
   ```bash
   git clone https://github.com/your-username/WayneKit.git
   cd WayneKit
   ```

2. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   # 或
   git checkout -b fix/your-bug-fix
   ```

3. **进行更改**
   - 遵循现有的代码风格
   - 添加必要的注释
   - 更新相关文档

4. **编写测试**
   ```bash
   # 确保所有测试通过
   swift test
   ```

5. **提交更改**
   ```bash
   git add .
   git commit -m "Add feature: your feature description"
   ```

6. **推送到 GitHub**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **创建 Pull Request**
   - 填写 PR 模板
   - 引用相关的 issues
   - 等待代码审查

#### Pull Request 指南

- **一个 PR 一个功能**: 每个 PR 应该只关注一个功能或修复
- **清晰的描述**: 解释你的更改和原因
- **测试**: 包含适当的测试
- **文档**: 更新相关文档
- **代码风格**: 遵循项目的编码规范
- **Commit 信息**: 使用清晰的 commit 信息

#### Commit 信息格式

使用以下格式：

```
<type>: <subject>

<body>

<footer>
```

类型 (type):
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式（不影响代码运行）
- `refactor`: 重构
- `test`: 添加测试
- `chore`: 构建过程或辅助工具的变动

示例：
```
feat: Add support for safe area constraints

- Add safeArea property to ConstraintView
- Update documentation with safe area examples

Closes #123
```

## 代码规范

### Swift 风格指南

遵循 [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)

主要要点：

1. **命名**
   - 使用清晰、描述性的名称
   - 避免缩写
   - 方法名应该是动词短语
   - 属性名应该是名词短语

2. **格式**
   - 使用 4 个空格缩进
   - 行宽不超过 120 个字符
   - 在文件末尾添加空行

3. **注释**
   - 为公共 API 添加文档注释
   - 使用 `///` 或 `/** */` 格式
   - 解释"为什么"而不是"是什么"

4. **组织**
   - 使用 `// MARK: -` 分隔代码段
   - 按功能分组相关代码
   - 保持文件简洁

### 示例代码风格

```swift
/// 创建约束的描述
///
/// - Parameter item: 约束项
/// - Returns: 约束描述实例
internal func makeConstraintDescription(for item: ConstraintItem) -> ConstraintDescription {
    let description = ConstraintDescription(item: item)
    descriptions.append(description)
    return description
}
```

## 测试

### 运行测试

```bash
# 运行所有测试
swift test

# 运行特定测试
swift test --filter WayneKitTests.testMakeConstraints
```

### 编写测试

- 为新功能添加测试
- 确保测试覆盖边界情况
- 使用描述性的测试名称
- 每个测试应该测试一个特定的行为

示例：

```swift
func testConstraintWithOffset() {
    view.makeConstraints { make in
        make.top.equalTo(superview).offset(10)
    }
    
    let constraint = view.constraints.first!
    XCTAssertEqual(constraint.constant, 10)
}
```

## 文档

### 更新文档

当你添加新功能时，请更新：

1. **代码注释**: 添加内联文档
2. **README.md**: 如果是主要功能
3. **CHANGELOG.md**: 记录更改
4. **示例代码**: 在 Examples/ 中添加使用示例

### 文档风格

- 使用清晰、简洁的语言
- 提供代码示例
- 包含使用场景
- 解释参数和返回值

## 发布流程

（仅限维护者）

1. 更新版本号
2. 更新 CHANGELOG.md
3. 创建 Git tag
4. 推送到 GitHub
5. 创建 Release

## 需要帮助？

- 查看现有的 issues 和 PRs
- 阅读源代码和测试
- 在 issue 中提问

## 许可证

通过贡献，你同意你的贡献将在 MIT 许可证下授权。

---

再次感谢你的贡献！🎉

