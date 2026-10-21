# 提词器（Teleprompter）

iOS 口播提词器：录视频时通过系统画中画悬浮窗口滚动显示稿子。

- 需求与技术方案见：[`docs/需求与方案.md`](docs/需求与方案.md)

## 当前状态：MVP

Hello World 界面，验证「GitHub Actions 打包 IPA → 安装到 iPhone」完整链路。

## 一、打包 IPA（无需 Mac，GitHub Actions 云端构建）

1. 在 GitHub 新建一个**私有仓库**，把本工程推送上去：

   ```powershell
   git init
   git add .
   git commit -m "MVP: hello world + CI"
   git branch -M main
   git remote add origin https://github.com/<你的用户名>/<仓库名>.git
   git push -u origin main
   ```

2. 打开仓库页面 → **Actions** → 左侧选 **Build IPA** → **Run workflow**（或直接看 push 自动触发的运行）。
3. 运行完成后，在运行详情页最下方 **Artifacts** 中下载 `Teleprompter-unsigned-ipa`，解压得到 `Teleprompter-unsigned.ipa`。

> 产物是**未签名 IPA**，无法直接安装，需要下一步用免费 Apple ID 签名。

## 二、安装到 iPhone（Windows + 免费 Apple ID）

前置：iPhone 打开「设置 → 通用 → VPN与设备管理」信任对应证书；安装 AltStore 需要电脑版 iTunes（微软商店版不可用）。

### 方式 A：Sideloadly（最简单，一次性安装）

1. Windows 安装 [Sideloadly](https://sideloadly.io/) 和 iTunes（Apple 官网版）；
2. iPhone 用数据线连电脑；
3. Sideloadly 中选择 `Teleprompter-unsigned.ipa`，填入你的 Apple ID → **Start**；
4. 安装完成后，iPhone 上「设置 → 通用 → VPN与设备管理」里信任你的 Apple ID 证书；
5. 打开桌面「提词器」→ 看到 Hello World 界面即成功 ✅。

### 方式 B：AltStore（推荐，可自动续签）

1. Windows 安装 [AltServer](https://altstore.io/) + iTunes（官网版），按官网指引把 AltStore 装进 iPhone；
2. iPhone 打开 AltStore → 点左上角 **+** → 选择 `Teleprompter-unsigned.ipa`；
3. 同样需要在设置里信任证书。

## 三、⚠️ 免费签名的 7 天限制

免费 Apple ID 签名的应用 **7 天后会过期打不开**：

- **AltStore** 方式：iPhone 和电脑同一 WiFi 时 AltStore 会自动续签；
- **Sideloadly** 方式：7 天后重新用 Sideloadly 装一次即可；
- 想彻底免续签：需要购买 Apple 开发者账号（$99/年）。

## 四、工程结构

```
├── Sources/                    # SwiftUI 源码（MVP：Hello World）
├── Supporting Files/Info.plist
├── Teleprompter.xcodeproj/     # Xcode 工程（无需本机 Xcode，CI 使用）
├── docs/需求与方案.md           # 需求、技术方案、里程碑
└── .github/workflows/build-ipa.yml
```

## 五、下一步（M2）

稿子编辑 + 本地持久化 + App 内全屏滚动预演（速度/字体/颜色/高亮）。
