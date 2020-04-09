//
//  ViewController.swift
//  task-master
//
//  Created by Titan Russo on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

struct userData {
    var userName : String
    var userGender : String
    var userDOB : String
    
}
var currentUser = userData(userName: "User000", userGender: "Male", userDOB: "01/01/2000")
class ViewControllerEditProfile: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var GenderField: UITextField!
    @IBOutlet weak var AgeField: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.delegate = self
        GenderField.delegate = self
        AgeField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NameField.resignFirstResponder()
        GenderField.resignFirstResponder()
        AgeField.resignFirstResponder()
        
    }
    
    @IBAction func userUpdate(_ sender: Any) {
        currentUser.userName = NameField.text!
        currentUser.userGender = GenderField.text!
        currentUser.userDOB = AgeField.text!
    }
}
    
    extension ViewControllerEditProfile : UITextFieldDelegate {
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


