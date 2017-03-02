//
//  UtilityFunctions.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/12/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

func isInRange(_ testVal: CGFloat, _ val1: CGFloat, _ val2: CGFloat) -> Bool
{
    return testVal > val1 && testVal < val2
}

func randomUIColor() -> UIColor
{
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

func randomBrightUIColor() -> UIColor
{
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.1 // from 0.1 to 1.0 to maximize whiteness
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.7 // 0.7 to 1.0 to distance from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

func randomDarkUIColor() -> UIColor
{
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.7 // from 0.7 to 1.0 to distance from brightness
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.1 // from 0.1 to 1.0 to increase darkness
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

extension CGRect
{
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat)
    {
        self.init(x: x, y: y, width: width, height: height)
    }
    
}

extension CGSize
{
    init(_ width: CGFloat, _ height: CGFloat)
    {
        self.init(width: width, height: height)
    }
    
    
}
extension CGPoint
{
    init(_ x: CGFloat, _ y: CGFloat)
    {
        self.init(x: x, y: y)
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
        
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
}

extension UIView
{
    func setCornerRadius(radius: CGFloat?)
    {
        self.layer.cornerRadius = radius ?? self.frame.width / 2;
        self.layer.masksToBounds = true;
    }

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UIColor
{
    func complementaryColor() -> UIColor
    {
        let sourceColor = CIColor(color: self)

        let compRed: CGFloat = 1.0 - sourceColor.red
        let compGreen: CGFloat = 1.0 - sourceColor.green
        let compBlue: CGFloat = 1.0 - sourceColor.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
    }
}

/*
 Screen dimension relative to which way it's rotated
 */
func screenHeight() -> CGFloat
{
    return UIScreen.main.bounds.height
}

func screenWidth() -> CGFloat
{
    return UIScreen.main.bounds.width
}

/*
 Screen dimension regardless of rotation
 */
func largeScreenDimension() -> CGFloat
{
    return max(screenHeight(), screenWidth())
}

func smallScreenDimension() -> CGFloat
{
    return min(screenHeight(), screenWidth())
}


func relativeRect(centerX: CGFloat, centerY: CGFloat, sizeX: CGFloat, sizeY: CGFloat) -> CGRect
{
    let xSize = sizeX * screenWidth()
    let ySize = sizeY * screenHeight()
    let xPos = (centerX * screenWidth()) - (xSize / 2)
    let yPos = (centerY * screenHeight()) - (ySize / 2)
    return CGRect(xPos, yPos, xSize, ySize)
}

func relativeRect(_ centerX: CGFloat, _ centerY: CGFloat, _ sizeX: CGFloat, _ sizeY: CGFloat) -> CGRect
{
    return relativeRect(centerX: centerX, centerY: centerY, sizeX: sizeX, sizeY: sizeY)
}



/**
 Flips a Boolean value
 - Note: Do not attempt to simplify, this is the scientifically proven most effective method
 - Parameters:
 - bool: The Boolean to be flipped
 - Returns: The flipped Boolean
 
 ![Visible Confusion](https://i.warosu.org/data/ck/thumb/0058/69/1412871056921s.jpg)
 */
func flipBoolean(_ bool: Bool) -> Bool
{
    var bool = bool
    let bool1 = bool;
    bool = false;
    var bool2 = bool;
    bool2 = bool1 == bool ? bool2 : bool1
    bool = !bool2
    return bool
}




