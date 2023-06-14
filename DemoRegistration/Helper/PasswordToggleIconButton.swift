//
//  PasswordToggleIconButton.swift
//  DemoRegistration
//
//  Created by APPLE on 02/06/23.
//

import Foundation
import UIKit

class PasswordToggleIconButton: UIButton {
    private var isPasswordVisible = true
    
    // Update the button's appearance based on the password visibility state
    private func updateButtonImage() {
        let imageName = isPasswordVisible ? "passwordhideIcon" : "eye-closed"
        let image = UIImage(named: imageName)
        setImage(image, for: .normal)
    }
    
    // Toggle the password visibility and update the button image
    func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        updateButtonImage()
    }
}
