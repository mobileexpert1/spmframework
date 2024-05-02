// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftPackage",
    platforms: [
       .macOS(.v10_13), .iOS(.v14),
    ],
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
        .package(url: "https://github.com/aws-amplify/amplify-ui-swift-liveness", from: "1.2.11")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on. "Starscream", "SwiftEventBus",
        .target(
            name: "MySwiftPackage",
           dependencies: ["DocumentReader", "DocumentReaderCore", "RegulaCommon" ,
            .product(name: "FaceLiveness", package: "amplify-ui-swift-liveness")
        ],

			path: "Sources",
			resources: [
				.copy("Media.xcassets"),
                .copy("Certificates.bundle"),
                .copy("CertificatesPA.bundle"),
                .copy("CertificatesTA.bundle"),
                .copy("iPass.license"),
                .copy("amplifyconfiguration.json"),
                .copy("awsconfiguration.json"),
                .copy("Certificates"),
                .copy("CertificatesPA"),
                .copy("CertificatesTA"),
                .copy("iPass"),
                .copy("amplifyconfiguration"),
                .copy("awsconfiguration"),
                
                
              
               //.copy("Resource/DocumentReader.xcframework")
			]),
        .binaryTarget(
            name: "DocumentReader",
            path: "DocumentReader.xcframework"),
        .binaryTarget(
            name: "DocumentReaderCore",
            path: "DocumentReaderCore.xcframework"),
        .binaryTarget(
            name: "RegulaCommon",
            path: "RegulaCommon.xcframework"),
        
    ]
)
