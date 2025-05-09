import ProjectDescription

let project = Project(
    name: "SnapKitDemo",
    targets: [
        .target(
            name: "SnapKitDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.SnapKitDemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["SnapKitDemo/Sources/**"],
            resources: ["SnapKitDemo/Resources/**"],
            dependencies: [
                .external(name: "SnapKit"), // 패키징 의존성 작업시 추가해줘야 하는 코드
            ]
        ),
        .target(
            name: "SnapKitDemoTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.SnapKitDemoTests",
            infoPlist: .default,
            sources: ["SnapKitDemo/Tests/**"],
            resources: [],
            dependencies: [.target(name: "SnapKitDemo")]
        ),
    ]
)
