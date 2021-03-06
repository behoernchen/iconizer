//
// Constants.swift
// Iconizer
// https://github.com/raphaelhanneken/iconizer
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Raphael Hanneken
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


///  Nicely wrap up the integers from NSSegmentedControl.
///
///  - kAppIconViewControllerTag:     Represents the tag for the AppIconView.
///  - kLaunchImageViewControllerTag: Represents the tag for the LaunchImageView.
///  - kImageSetViewControllerTag:    Represents the tag for the ImageSetView.
enum ViewControllerTag: Int {
  case kAppIconViewControllerTag     = 0
  case kLaunchImageViewControllerTag = 1
  case kImageSetViewControllerTag    = 2
}


// MARK: - Platform names

let kAppleWatchPlatformName = "Watch"
let kIPadPlatformName       = "iPad"
let kIPhonePlatformName     = "iPhone"
let kOSXPlatformName        = "Mac"
let kCarPlayPlatformName    = "Car"


// MARK: - Image Orientation names

/// Wrap the different image orientations into an enum.
enum ImageOrientation: String {
  case Portrait  = "portrait"
  case Landscape = "landscape"
}


// MARK: - Directory names

/// Defines the name of the directory, where Iconizer saves the asset catalogs.
let appIconDirectory     = "Iconizer Assets/App Icons"
let launchImageDirectory = "Iconizer Assets/Launch Images"
let imageSetDirectory    = "Iconizer Assets/Image Sets"


// MARK: - Asset Types

///  Wrap the different asset catalog types into an enum, for nicer code.
///
///  - AppIcon:     Represents the AppIcon model
///  - ImageSet:    Represents the ImageSet model
///  - LaunchImage: Represents the LaunchImage model
enum AssetType : Int {
  case AppIcon     = 0
  case ImageSet    = 1
  case LaunchImage = 2
}


// MARK: - Keys to access the user defaults

/// Generate an AppIcon for the Apple Watch.
let generateAppIconForAppleWatchKey = "generateAppIconForAppleWatch"
/// Generate an AppIcon for the iPhone.
let generateAppIconForIPhoneKey     = "generateAppIconForIPhone"
/// Generate an AppIcon for the iPad.
let generateAppIconForIPadKey       = "generateAppIconForIPad"
/// Generate an AppIcon for OS X.
let generateAppIconForMacKey        = "generateAppIconForMac"
/// Generate an AppIcon for CarPlay
let generateAppIconForCarKey        = "generateAppIconForCar"
/// Generate an AppIcon with multiple platforms (combined asset)
let combinedAppIconAssetKey         = "combinedAppIconAsset"
/// Selected ExportTypeViewController (NSSegmentedControl)
let selectedExportTypeKey           = "selectedExportType"
/// Generate a LaunchImage for the iPhone.
let generateLaunchImageForIPhoneKey = "generateLaunchImageForIPhone"
/// Generate a LaunchImage for the iPad.
let generateLaunchImageForIPadKey   = "generateLaunchImageForIPad"

