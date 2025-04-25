import ProjectDescription

let project = Project(
    name: "StoreApp",
    targets: [
        .target(
            name: "StoreApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.StoreApp",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["StoreApp/Sources/**"],
            resources: ["StoreApp/Resources/**"],
            dependencies: [
              .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "StoreAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.StoreAppTests",
            infoPlist: .default,
            sources: ["StoreApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "StoreApp")]
        ),
    ]
)
