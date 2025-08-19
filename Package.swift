// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorPluginFacebookAnalytics",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CapacitorPluginFacebookAnalytics",
            targets: ["FacebookAnalyticsPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0"),
        .package(url: "https://github.com/facebook/facebook-ios-sdk", from: "17.0.0")
    ],
    targets: [
        .target(
            name: "FacebookAnalyticsPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk")
            ],
            path: "ios/Plugin"),
        .testTarget(
            name: "FacebookAnalyticsPluginTests",
            dependencies: ["FacebookAnalyticsPlugin"],
            path: "ios/PluginTests")
    ]
)
