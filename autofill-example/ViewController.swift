//
//  ViewController.swift
//  autofill-example
//
//  Created by Andreas van der Griendt on 20/07/2017.
//  Copyright © 2017 Visuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tryToGoToNextField(currentField: textField)
        return true
    }
    
    // Hacky way to auto jump to next field when the user used tapped on a suggestion, as the replacementString would probably count more than 2 characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count > 1 {
            textField.text = string
            tryToGoToNextField(currentField: textField)
            return false
        } else {
            return true
        }
    }
    
    private func tryToGoToNextField(currentField: UITextField) {
        let tag = currentField.tag
        if let tf = view.viewWithTag(tag + 1) as? UITextField {
            tf.becomeFirstResponder()
        } else {
            currentField.resignFirstResponder()
        }
    }

}

