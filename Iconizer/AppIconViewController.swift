//
// AppIconViewController.swift
// Iconizer
// https://github.com/behoernchen/Iconizer
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


import Cocoa

class AppIconViewController: IconizerExportTypeViewController {
    
     /// Export asset catalog for OS X?
    @IBOutlet weak var osx: NSButton!
     /// Export asset catalog for iPhone?
    @IBOutlet weak var iphone: NSButton!
     /// Export asset catalog for iPad?
    @IBOutlet weak var ipad: NSButton!
     /// Export asset catalog for Apple Watch?
    @IBOutlet weak var watch: NSButton!
     /// Export asset catalog for CarPlay?
    @IBOutlet weak var carPlay: NSButton!
     /// Export selected platforms as combined appiconset?
    @IBOutlet weak var combined: NSButton!
     /// Progress indicator; Spins while building asset catalog(s)
    @IBOutlet weak var progress: NSProgressIndicator!
     /// Image view
    @IBOutlet weak var imageView: NSImageView!
    
     /// Which platforms are actually choosen?
    var enabledPlatforms: [String] {
        get {
            var tmp: [String] = []
            if watch.state == NSOnState {
                tmp.append(watch.title)
            }
            
            if ipad.state == NSOnState {
                tmp.append(ipad.title)
            }
            
            if iphone.state == NSOnState {
                tmp.append(iphone.title)
            }
            
            if osx.state == NSOnState {
                tmp.append(osx.title)
            }
            
            if carPlay.state == NSOnState {
                tmp.append("Car")
            }
            
            return tmp
        }
    }
    
     /// Holds the AppIcon object with all images in the appropriate size
    var appIcon = AppIcon()
    
    // Return nib name for the associated view
    override var nibName: String {
        return "AppIconView"
    }
    
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * Generates the images for the selected platforms.
     *
     * :returns: true if generation was succesful, false otherwise
     */
    override func export() -> Bool {
        if self.imageView.image == nil {
            let alert = NSAlert()
            
            alert.messageText = "No Image provided!"
            alert.informativeText = "You haven't provided any images to convert."
            
            alert.beginSheetModalForWindow(self.view.window!, completionHandler: nil)
        }
        
        // Display the progress indicator and start animating
        self.toggleProgressIndicator()
        
        // Is at least one platform selected?
        if self.enabledPlatforms.count > 0 {
            // Generate necessary images
            self.appIcon.generateImagesForPlatforms(self.enabledPlatforms, fromImage: self.imageView.image)
        } else {
            // Create a new NSAlert
            let alert = NSAlert()
            
            // Set message and text...
            alert.messageText     = "No platform selected!"
            alert.informativeText = "You have to select at least one platform."
            
            // ...and display it as sheet on the window of this view.
            alert.beginSheetModalForWindow(self.view.window!, completionHandler: nil)
            
            // Hide the progress indicator and stop the animation
            self.toggleProgressIndicator()
            
            return false
        }
        
        // Hide the progress indicator and stop the animation
        self.toggleProgressIndicator()
        
        // Everything fine down here...
        return true
    }
    
    /**
     * Tells the model object to save itself as asset catalog.
     *
     * :param: url Path url, where to save the asset catalog.
     *
     * :returns: Return true on success, false otherwise
     */
    override func saveToURL(url: NSURL) -> Bool {
        if self.combined.state == NSOnState {
            println("Save as combined")
            self.appIcon.saveImageAssetToDirectoryURL(url, asCombinedAsset: true)
        } else {
            println("Save as seperated")
            self.appIcon.saveImageAssetToDirectoryURL(url)
        }
        return true
    }
    
    /**
     * Toggles the visibility and the animation status of the NSProgressIndicator
     */
    func toggleProgressIndicator() {
        println("toggleProgressIndicator()")
        // Is the progressIndicator visible?
        if self.progress.hidden == false {
            println("progressIndicator.hidden = true")
            // Hide it...
            self.progress.hidden = true
            // ...and stop the animation.
            self.progress.stopAnimation(self)
        } else {
            println("progressIndicator.hidden = false")
            // Otherwise start the animation and...
            self.progress.startAnimation(self)
            // ...display it on screen.
            self.progress.hidden = false
        }
    }
}
