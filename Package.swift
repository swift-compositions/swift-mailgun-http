// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-mailgun-http",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27"),
    ],
    products: [
        .library(
            name: "Mailgun HTTP",
            targets: ["Mailgun HTTP"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-standards/swift-mailgun-standard.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-standards/swift-domain-standard.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-standards/swift-emailaddress-standard.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-compositions/swift-html-form-coder.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-standards/swift-html-standard.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-compositions/swift-http-body.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-standards/swift-http-standard.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-ietf/swift-rfc-2045.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-2045-coder.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-2046.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-2046-coder.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-2183.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-3986.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-3986-coder.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-time.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-byte.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-compositions/swift-mailgun.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Mailgun HTTP",
            dependencies: [
                .product(name: "Mailgun Standard", package: "swift-mailgun-standard"),
                .product(name: "Domain Standard", package: "swift-domain-standard"),
                .product(name: "EmailAddress Standard", package: "swift-emailaddress-standard"),
                .product(name: "HTML Form Coder", package: "swift-html-form-coder"),
                .product(name: "HTML Form Coder Codable", package: "swift-html-form-coder"),
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .product(name: "HTTP Body", package: "swift-http-body"),
                .product(name: "HTTP Standard", package: "swift-http-standard"),
                .product(name: "RFC 2045", package: "swift-rfc-2045"),
                .product(name: "RFC 2045 Coder", package: "swift-rfc-2045-coder"),
                .product(name: "RFC 2046", package: "swift-rfc-2046"),
                .product(name: "RFC 2046 Coder", package: "swift-rfc-2046-coder"),
                .product(name: "RFC 2183", package: "swift-rfc-2183"),
                .product(name: "RFC 3986", package: "swift-rfc-3986"),
                .product(name: "RFC 3986 Coder", package: "swift-rfc-3986-coder"),
                .product(name: "Time", package: "swift-time"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Mailgun", package: "swift-mailgun"),
            ]
        ),
        .testTarget(
            name: "Mailgun HTTP Tests",
            dependencies: [
                "Mailgun HTTP",
                .product(name: "Domain Standard", package: "swift-domain-standard"),
                .product(name: "EmailAddress Standard", package: "swift-emailaddress-standard"),
                .product(name: "Time", package: "swift-time"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
