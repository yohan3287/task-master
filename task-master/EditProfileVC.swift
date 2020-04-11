//
//  ViewController.swift
//  task-master
//
//  Created by Titan Russo on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit



class EditProfileVC: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var GenderField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
     @objc func datePickerAge() { // controller of done button from goal time start date picker
            if let datePicker = self.ageField.inputView as? UIDatePicker {
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "dd MMM yyyy"
    //            dateformatter.dateStyle = .medium
                self.ageField.text = dateformatter.string(from: datePicker.date)
            }
        self.ageField.resignFirstResponder()
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.delegate = self
        GenderField.delegate = self
        ageField.delegate = self
        // Do any additional setup after loading the view.
        self.ageField.setInputViewDatePicker(target: self, selector: #selector(datePickerAge))
    }
    @IBAction func backToProfile(_ sender: Any) {
           //currentUser.userName = NameField.text!
           currentUser.userGender = GenderField.text!
           currentUser.userDOB = ageField.text!
           print(currentUser.userName)
        performSegue(withIdentifier: "unwindToProfile", sender: self)
        
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ProfileVC
        destVC.userName.text = "\(NameField.text ?? "null")"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NameField.resignFirstResponder()
        GenderField.resignFirstResponder()
        ageField.resignFirstResponder()
        
    }
    
}
    
    extension EditProfileVC : UITextFieldDelegate {
        func textFieldShouldReturn(_ textField:UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



