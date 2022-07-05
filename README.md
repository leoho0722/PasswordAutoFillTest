# PasswordAutoFillTest

## 開發環境
* Xcode 13.1
* Swift 5
* 最低安裝版本：iOS 15.0

## 建立步驟
1. 專案的 Target 新增 Capabilities - AutoFill Credential Provider
2. 專案的 Target 新增 App Extension - AutoFill Credential Provider
3. 在 MainInterface.storyboard 設計 UI
4. 在 CredentialProviderViewController.swift 撰寫對應的 Code

Notes：App Extension 裡的 func 跟 專案內的沒有互通
