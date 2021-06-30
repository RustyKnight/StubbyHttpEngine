// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StubbyHttpEngine",
    platforms: [
			.macOS(.v10_12), .iOS(.v10), .tvOS(.v11), .watchOS(.v4)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "StubbyHttpEngine",
            targets: ["StubbyHttpEngine"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
		.package(url: "https://github.com/RustyKnight/HttpEngineCore", Package.Dependency.Requirement.branch("feature/pk-xcframeworks")),
		.package(url: "https://github.com/RustyKnight/Cadmus", Package.Dependency.Requirement.branch("feature/spm")),
        .package(url: "https://github.com/mxcl/PromiseKit", .exact("6.14.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "StubbyHttpEngine",
            dependencies: [
							"HttpEngineCore",
                            .product(name: "PromiseKit", package: "PromiseKit"),
							"Cadmus",
				],
    		path: "StubbyHttpEngine")
    ]
)
