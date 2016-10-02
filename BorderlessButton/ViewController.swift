//
//  ViewController.swift
//  BorderlessButton
//
//  Created by Ampy Fejes on 9/26/16.
//  Copyright © 2016 Touch of Cocoa. All rights reserved.
//

import Cocoa

extension NSColor {
    static func iOSBlue() -> NSColor {
        return NSColor(calibratedRed: CGFloat(21.0/255.0), green: CGFloat(126.0/255.0), blue: CGFloat(251.0/255.0), alpha: 1.0)
    }
    static func linkUnread() -> NSColor {
        return NSColor(calibratedRed: CGFloat(30.0/255.0), green: CGFloat(142.0/255.0), blue: CGFloat(203.0/255.0), alpha: 1.0)
    }
    static func linkRead() -> NSColor {
        return NSColor(calibratedRed: CGFloat(101.0/255.0), green: CGFloat(18.0/255.0), blue: CGFloat(151.0/255.0), alpha: 1.0)
    }
}

class WebLinkButton : NSButton {
    
    override func awakeFromNib() {
        let trackingArea = NSTrackingArea(rect: self.bounds, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
    }
    
    override func mouseEntered(with event: NSEvent) {
        let mutableTitle = NSMutableAttributedString(attributedString: self.attributedTitle)
        mutableTitle.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSMakeRange(0, mutableTitle.length))
        self.attributedTitle = mutableTitle
    }
    
    override func mouseExited(with event: NSEvent) {
        let mutableTitle = NSMutableAttributedString(attributedString: self.attributedTitle)
        mutableTitle.addAttribute(NSUnderlineStyleAttributeName, value: 0, range: NSMakeRange(0, mutableTitle.length))
        self.attributedTitle = mutableTitle
    }
}

class ViewController: NSViewController {
    
    @IBOutlet weak var iosButton: NSButton!
    @IBOutlet weak var webLinkButton: NSButton!
    
    // Adding a space at the end so title is not cut-off
    let iosTitle = "iOS Button "
    let webLink = "Web Link Button "

    override func viewDidLoad() {
        super.viewDidLoad()
        

        iosButton.attributedTitle = NSAttributedString(string: iosTitle, attributes: [NSForegroundColorAttributeName : NSColor.iOSBlue()])
        iosButton.attributedAlternateTitle = NSAttributedString(string: iosTitle, attributes: [NSForegroundColorAttributeName : NSColor.gray])

        
        webLinkButton.attributedTitle = NSAttributedString(string: webLink, attributes: [NSForegroundColorAttributeName : NSColor.linkUnread()])
        webLinkButton.attributedAlternateTitle = NSAttributedString(string: webLink, attributes: [NSForegroundColorAttributeName : NSColor.gray])
    }


    @IBAction func didClickLink(_ sender: NSButton) {
        let mutableTitle = NSMutableAttributedString(attributedString: sender.attributedTitle)
        mutableTitle.addAttribute(NSForegroundColorAttributeName, value: NSColor.linkRead(), range: NSMakeRange(0, mutableTitle.length))
        sender.attributedTitle = mutableTitle
    }
    
    
}

