// swift-tools-version:5.9

// This file is licensed to you under the Apache License, Version 2.0 
// (http://www.apache.org/licenses/LICENSE-2.0) or the MIT license 
// (http://opensource.org/licenses/MIT), at your option.
//
// Unless required by applicable law or agreed to in writing, this software is 
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS OF 
// ANY KIND, either express or implied. See the LICENSE-MIT and LICENSE-APACHE 
// files for the specific language governing permissions and limitations under
// each license.

import PackageDescription

let package = Package(
    name: "C2PA",
    platforms: [
        .iOS(.v16),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "C2PA",
            targets: ["C2PA"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/alrikai/swift-certificates.git", branch: "main"),
        .package(url: "https://github.com/alrikai/swift-asn1.git", branch: "main"),
        .package(url: "https://github.com/alrikai/swift-crypto.git", branch: "main")
    ],
    targets: [
        .binaryTarget(
            name: "C2PAC",
            url: "https://github.com/contentauth/c2pa-ios/releases/download/v0.0.9/C2PAC.xcframework.zip",
            checksum: "16626d062f08a1cde1adf76a324c7859c95270161fb0c6569434460b6703f135"
        ),
        .target(
            name: "C2PA",
            dependencies: [
                "C2PAC",
                .product(name: "X509", package: "swift-certificates"),
                .product(name: "SwiftASN1", package: "swift-asn1"),
                .product(name: "Crypto", package: "swift-crypto")
            ],
            path: "Library/Sources"
        )
    ]
)
