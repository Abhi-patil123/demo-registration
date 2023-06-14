//
//  InformationViewController.swift
//  DemoRegistration
//
//  Created by APPLE on 02/06/23.
//

import UIKit

class InformationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var educationField: DropdownTextField!
    @IBOutlet weak var yearofpassField: DropdownTextField!
    @IBOutlet weak var gradeField: UITextField!
    @IBOutlet weak var experienceField: UITextField!
    @IBOutlet weak var designationField: DropdownTextField!
    @IBOutlet weak var domainField: DropdownTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldIconSetup()
        dropdownfieldSetup()
    }
    
    private func dropdownfieldSetup() {
        educationField.setOptions([EducationdetailsConstant.graduate, EducationdetailsConstant.postGraduate, EducationdetailsConstant.HSCDiploma, EducationdetailsConstant.ssc])
        yearofpassField.setOptions([yearofpassFieldConstant.year1, yearofpassFieldConstant.year2, yearofpassFieldConstant.year3, yearofpassFieldConstant.year4, yearofpassFieldConstant.year5, yearofpassFieldConstant.year6])
        designationField.setOptions([designationFieldConstant.softwareEnginner, designationFieldConstant.associateSoftwareEnginner, designationFieldConstant.IosDeveloper, designationFieldConstant.Andriod, designationFieldConstant.Flutter])
        domainField.setOptions([domailFieldConstant.Btech, domailFieldConstant.BBA, domailFieldConstant.Bcom, domailFieldConstant.BCA, domailFieldConstant.Bpharma])
    }
    
    private func fieldIconSetup() {
        educationField.setupRightImage(imageName: ImageNameConstant.triangleIconImg)
        yearofpassField.setupRightImage(imageName: ImageNameConstant.triangleIconImg)
        designationField.setupRightImage(imageName: ImageNameConstant.triangleIconImg)
        domainField.setupRightImage(imageName: ImageNameConstant.triangleIconImg)
    }
    
    //MARK: - submit btn action
    @IBAction func submitBtnAction(_ sender: Any) {
        validationField()
    }
    
    //MARK: - back btn action
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - validation text field
    private func validationField() {
        
        if let education = educationField.text, let passingYear = yearofpassField.text, let grade = gradeField.text, let experience = experienceField.text, let designation = designationField.text {
            
            if education == "" {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.educationField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            } else if passingYear == "" {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.passingField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }else if (grade == "" || !grade.validateGDD()){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.gradeField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }else if (experience == "" || !experience.validateOnlyNumber()) {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.experienceField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }else if (designation == "" || !designation.validateGDD())  {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.designationField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }else if (education == "" && passingYear == "" && grade == "" && experience == "" && designation == "") {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.allField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                navigationController?.pushViewController(vc, animated: true)
            }
        }else {
            print("Please check your details")
        }
    }
}
