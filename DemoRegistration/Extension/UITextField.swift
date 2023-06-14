//
//  UITextField.swift
//  DemoRegistration
//
//  Created by APPLE on 02/06/23.
//

import Foundation
import UIKit
extension UITextField {
    
    //MARK: - Left Icon set Field
    func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 3, y: 5, width: 40, height: 30))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        self.leftView = imageContainerView
        self.leftViewMode = .always
        self.tintColor = .lightGray
    }

    //MARK: - Right Icon set Field
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        self.rightView = imageContainerView
        self.rightViewMode = .always
        self.tintColor = .lightGray
    }

   
}
