//
//  DropdownTextField.swift
//  DemoRegistration
//
//  Created by APPLE on 02/06/23.
//

import Foundation

import UIKit

class DropdownTextField: UITextField {
    // Properties
    let pickerView = UIPickerView()
    var options: [Any] = []
    
    // Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        pickerView.delegate = self
        pickerView.dataSource = self
        inputView = pickerView
        setupToolbar()
    }
    
    private func setupToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        resignFirstResponder()
    }
    
    // Public method to set dropdown options
    func setOptions(_ options: [Any]) {
        self.options = options
        pickerView.reloadAllComponents()
    }
}

extension DropdownTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    // UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row] as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = options[row] as? String
    }
}

