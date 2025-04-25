// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import struct ProjectDescription.PackageSettings

let packageSettings = PackageSettings(
  // Customize the product types for specific package product
  // Default is .staticFramework
  // productTypes: ["Alamofire": .framework,]
  productTypes: [:]
)
#endif

let package = Package(
  name: "SnapKitDemo",
  dependencies: [
    .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
    // 추가로 프로젝트 파일에도 관련 코드 추가해줘야 한다.
    // 이후 터미널에서 tuist install 후, generate generate
    // 팝업창에서 SDK? DISK? 선택해야. 바뀐다.
  ]
)
