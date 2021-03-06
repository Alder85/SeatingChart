//
//  MainMenuController.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 1/27/17.
//  Copyright © 2017 DEAN, JOSHUA. All rights reserved.
// potatoe comment

import Foundation
import UIKit
import GTMAppAuth
import GoogleAPIClient
import GoogleAPIClientForREST

let sheetsAPI = SheetsAPI()

class MainMenuController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad()
    {
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.setNeedsDisplay()
        pickerView.setNeedsDisplay()
        let namePlate = GoogleNamePlate(origin: CGPoint(0,0))
        self.view.addSubview(namePlate)
        if sheetsAPI.loadState()
        {
            login()
        }
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(reloadPicker), userInfo: nil, repeats: true)
        
        let emailLabel = UILabel(frame: relativeRect(0.2, 0.666, 0.9, 0.05))
        emailLabel.text = "test"
        emailLabel.backgroundColor = randomBrightUIColor()
        view.addSubview(emailLabel)
    }
    func reloadPicker()
    {
        pickerView.reloadAllComponents()
    }
    func login()
    {
        sheetsAPI.auth(viewController: self)
    }
    
    //Data Sources
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fileList.count
    }
    
    //Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return fileList[row].name
    }
    
    //On Selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(fileList.count > 0)
        {
            currentFile = fileList[row]
        }
    }
    //Display Rainbow
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var potatoe = UITextField(frame: CGRect(0,0,0,0))
       // potatoe.isEditing = false
        var pickerLabel = view as! UILabel!
        if view == nil
        {
            let hue = CGFloat(row)/CGFloat(fileList.count)
            pickerLabel = UILabel()
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 0.7)
        }
        let titleData = fileList[row].name
        let title = NSAttributedString(string: titleData!, attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 24)])
        pickerLabel!.attributedText = title
        pickerLabel!.textAlignment = .center
        return pickerLabel!
        
    }

}
