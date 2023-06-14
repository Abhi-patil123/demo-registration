//
//  AddressViewController.swift
//  DemoRegistration
//
//  Created by APPLE on 02/06/23.
//

import UIKit


class AddressViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var landmarkField: UITextField!
    @IBOutlet weak var areaField: UITextField!
    @IBOutlet weak var cityfetchField: DropdownTextField!
    @IBOutlet weak var pinCodeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldIconSetup()
        cityfetchField.setOptions([CityFieldConstant.Delhi, CityFieldConstant.Gujrat, CityFieldConstant.Maharastra, CityFieldConstant.madhyaPradesh, CityFieldConstant.UttarPradesh])
    }
    
    private func fieldIconSetup() {
        cityfetchField.setupRightImage(imageName: ImageNameConstant.triangleIconImg)
    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        validationField()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - VALIDATION FIELD
   private func validationField() {
        
        if let address = addressField.text, let landmark = landmarkField.text, let city = cityfetchField.text, let pinCode = pinCodeField.text {
            
            if address.count < 3 {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.addressField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            } else if landmark.count < 3  {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.landmarkField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if (!city.validateOnlyChar()) {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.cityField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if (!pinCode.validateZipCode() || pinCode.count < 6) {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.pincode, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if (address == "" && landmark == "" && city == "" && pinCode == "") {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.allField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
                navigationController?.pushViewController(vc, animated: true)
            }
        }else {
            print("Please check your details")
        }
    }
}
