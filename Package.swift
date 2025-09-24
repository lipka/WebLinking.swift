// swift-tools-version: 5.7
// JPNetworking - Production-Ready Networking Framework
// Minimum Swift 5.7 for async/await and modern concurrency support

import PackageDescription

let package = Package(
    name: "WebLinking",
    
    // MARK: - Platform Support

    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    
    // MARK: - Products

    products: [
        .library(
            name: "WebLinking",
            targets: ["WebLinking"]
        ),
    ],

    // MARK: - Dependencies
    
    dependencies: [
    ],
    
    // MARK: - Targets
    targets: [
        // MARK: Main Framework Target
        .target(
            name: "WebLinking",
            dependencies: [],
            path: "Sources/WebLinking"
        ),
        
        // MARK: Test Target
        .testTarget(
            name: "WebLinkingTests",
            dependencies: ["WebLinking"],
            path: "Tests/WebLinking"
        ),
    ]
)