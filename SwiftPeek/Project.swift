import ProjectDescription

let project = Project(
    name: "SwiftPeek",
    targets: [
        .target(
            name: "SwiftPeek",
            destinations: .iOS,
            product: .staticLibrary,
            bundleId: "com.kelvinharron.SwiftPeek",
            infoPlist: .extendingDefault(with: [
                "CODE_SIGNING_ALLOWED": "NO",
                "SWIFT_VERSION": "6.0"
            ]),
            sources: ["SwiftPeek/Sources/**"],
            resources: ["SwiftPeek/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "SwiftPeekExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.kelvinharron.SwiftPeek.example",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["SwiftPeekExample/Sources/**"],
            resources: ["SwiftPeekExample/Resources/**"],
            dependencies: [.target(name: "SwiftPeek")]
        ),
        .target(
            name: "SwiftPeekTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.kelvinharron.SwiftPeek",
            infoPlist: .default,
            sources: ["SwiftPeek/Tests/**"],
            resources: [],
            dependencies: [.target(name: "SwiftPeek")]
        ),
    ]
)
