// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MySwiftPackage",
            targets: ["MySwiftPackage"]),
           // .library(name: "DocumentReader", targets: ["DocumentReader.xcframework"])
    ],
    dependencies: [
//		.package(url: "https://github.com/daltoniam/Starscream.git", from: "3.1.1"),
//        .package(url: "https://github.com/cesarferreira/SwiftEventBus.git", from: "5.1.0"),
        //.package(url: "https://github.com/aws-amplify/amplify-ui-swift-liveness", from: "1.2.11")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on. "Starscream", "SwiftEventBus",
        .target(
            name: "MySwiftPackage",
           dependencies: ["DocumentReader"],
            
			path: "Sources",
			resources: [
				.process("Resource/Media.xcassets"),
                .process("Resources/Certificates.bundle"),
                .process("Resources/CertificatesPA.bundle"),
                .process("Resources/CertificatesTA.bundle"),
                .process("Resources/iPass.license")
               //.copy("Resource/DocumentReader.xcframework")
			]),
        .binaryTarget(
            name: "DocumentReader",
            path: "DocumentReader.xcframework"),
        //.target(name: "")
    ]
)
