//
//  ViewController.swift
//  DemoRegistration
//
//  Created by APPLE on 02/06/23.
//

import UIKit
import MobileCoreServices
class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerImageView: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButtonSetup()
        setUPFieldIcon()
        hideShowPassword()
        imaegViewSet()
        
    }
    
    private func setUPFieldIcon() {
        firstNameField.setupLeftImage(imageName: ImageNameConstant.personNameImg)
        lastNameField.setupLeftImage(imageName: ImageNameConstant.personNameImg)
        phoneNumberField.setupLeftImage(imageName: ImageNameConstant.callIconImg)
        emailField.setupLeftImage(imageName: ImageNameConstant.emailIconImg)
        passwordField.setupLeftImage(imageName: ImageNameConstant.lockIconImg)
        confirmPasswordField.setupLeftImage(imageName: ImageNameConstant.lockIconImg)
        passwordField.isSecureTextEntry = true
    }
    
    private func radioButtonSetup() {
        maleBtn.setImage(UIImage.init(named: ImageNameConstant.radiobtnOffImg), for: .normal)
        maleBtn.setImage(UIImage.init(named: ImageNameConstant.radiobtnOnImg), for: .selected)
        femaleBtn.setImage(UIImage.init(named: ImageNameConstant.radiobtnOffImg), for: .normal)
        femaleBtn.setImage(UIImage.init(named: ImageNameConstant.radiobtnOnImg), for: .selected)
        maleBtn.isSelected = true
    }
    
    private func hideShowPassword() {
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: ImageNameConstant.passwordhideIconImg)
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: (UIImage(named: ImageNameConstant.passwordhideIconImg)?.size.width)!, height: (UIImage(named: ImageNameConstant.passwordhideIconImg)?.size.height)!)
        imageIcon.frame = CGRect(x: 3, y: 20, width: 40, height: 30)
        passwordField.rightView = contentView
        passwordField.rightViewMode = .always
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.passwordToggleTapped(tapGestureRecognizer:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(labelTap)
    }
    
    @objc func passwordToggleTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
        tappedImage.image = UIImage(named: passwordField.isSecureTextEntry == false ? ImageNameConstant.openEyeImg : ImageNameConstant.passwordhideIconImg)
    }
    
    //MARK: - Gender selection Action
    @IBAction func genderSelectionBtnAction(_ sender: UIButton) {
        if sender == maleBtn{
            maleBtn.isSelected = true
            femaleBtn.isSelected = false
        }else{
            maleBtn.isSelected = false
            femaleBtn.isSelected = true
        }
    }
    
    //MARK: - IMAGE VIEW FOR PIC
    private func imaegViewSet() {
        let imageViewTap = UITapGestureRecognizer(target: self, action: #selector(self.imageViewTapped(tapGestureRecognizer:)))
        registerImageView.isUserInteractionEnabled = true
        registerImageView.addGestureRecognizer(imageViewTap)
        registerImageView.layer.cornerRadius = registerImageView.frame.size.width / 2
        registerImageView.clipsToBounds = true
    }
    
    //MARK: - pic image from gallery and camera
    @objc func imageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: errorFieldConstant.library, style: .default, handler: { (_) in
               self.presentImagePicker(sourceType: .photoLibrary)
           }))
           if UIImagePickerController.isSourceTypeAvailable(.camera) {
               alertController.addAction(UIAlertAction(title: errorFieldConstant.takePhoto, style: .default, handler: { (_) in
                   self.presentImagePicker(sourceType: .camera)
               }))
           }
        alertController.addAction(UIAlertAction(title: errorFieldConstant.Cancel, style: .cancel, handler: nil))
           present(alertController, animated: true, completion: nil)
    }
    
    func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - Submit btn action
    @IBAction func submitBtnAction(_ sender: Any) {
       validationField()
    }
    
    //MARK: - Validation for textfield
    private func validationField() {
        if let firstName = firstNameField.text, let LastName = lastNameField.text, let email = emailField.text, let password = passwordField.text, let conPassword = confirmPasswordField.text, let phoneNumber = phoneNumberField.text{
            if (firstName.count < 3 || firstName == "" || firstName.validateNmae()){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.firstname, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if (LastName.count < 3 || LastName == "" || LastName.validateNmae()){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.lastname, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if (!phoneNumber.validatePhoneNumber() || phoneNumber.count < 10){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.phoneNumber, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])

            }else if !email.validateEmailId(){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.email, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if !password.validatePassword(){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.password, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }
            else if conPassword == ""{
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.confirmPassword, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            } else if password != conPassword {
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.confirmPassword, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
                
            }else if (firstName == "" && LastName == "" && phoneNumber == "" && email == "" && password == "" && conPassword == ""){
                openAlert(title: errorFieldTitle.title, message: errorFieldConstant.allField, alertStyle: .alert, actionTitles: [errorFieldConstant.okay], actionStyles: [.default], actions: [{_ in }])
            }
            else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddressViewController") as! AddressViewController
                navigationController?.pushViewController(vc, animated: true)
            }
        }else{
            print("Please check your details")
        }
    }
}

//MARK: - Image picker
extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            registerImageView.image = image
        }
    }
    
}

