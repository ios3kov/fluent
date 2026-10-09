// swift-tools-version: 5.9
import PackageDescription

// SwiftPM builds the portable learning domain only. The iOS UI requires Xcode.
let package = Package(
    name: "FluentDomain",
    platforms: [.iOS(.v17)],
    products: [.library(name: "FluentDomain", targets: ["FluentDomain"])],
    targets: [
        .target(name: "FluentDomain", path: "Fluent/Domain"),
        .testTarget(name: "FluentDomainTests", dependencies: ["FluentDomain"], path: "Tests")
    ]
)
