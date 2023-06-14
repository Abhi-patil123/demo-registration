//
//  Extension + String.swift
//  LoginUI
//
//  Created by Yogesh Patel on 22/01/21.
//

import Foundation

//MARK: - Validation for all text fields
extension String{
    
    func validateNmae() ->Bool {
        let nameRegEx = ".*[^A-Za-z].*"
        return applyPredicateOnRegex(regexStr: nameRegEx)
    }
    
    func validatePhoneNumber() -> Bool {
        let phoneRegEx = "^[0-9+]{0,1}+[0-9]{5,16}$"
        return applyPredicateOnRegex(regexStr: phoneRegEx)
    }
    
    func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    
    func validatePassword() -> Bool {
        //Minimum 1 characters at least 1 Alphabet and 1 Number:
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
    func validateGDD() -> Bool {
        let GDD = "^[a-zA-Z0-9]+$"
        return applyPredicateOnRegex(regexStr: GDD)
    }
    
    func validateOnlyNumber() -> Bool {
        let number = "^[0-9]+$"
        return applyPredicateOnRegex(regexStr: number)
    }
    
    func validateOnlyChar() -> Bool {
        let char = ".*[^A-Za-z].*"
        return applyPredicateOnRegex(regexStr: char)
    }
    
    func validateZipCode() -> Bool {
        let code = #"^\d{6}$"#
       return applyPredicateOnRegex(regexStr: code)
    }
    
    //https://stackoverflow.com/a/39284766/8201581
    
    func applyPredicateOnRegex(regexStr: String) -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
