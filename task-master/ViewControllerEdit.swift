//
//  ViewController.swift
//  task-master
//
//  Created by Titan Russo on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit



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
    @IBAction func backToProfile(_ sender: Any) {
           //currentUser.userName = NameField.text!
           currentUser.userGender = GenderField.text!
           currentUser.userDOB = AgeField.text!
           print(currentUser.userName)
        performSegue(withIdentifier: "unwindToProfile", sender: self)
        
       }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NameField.resignFirstResponder()
        GenderField.resignFirstResponder()
        AgeField.resignFirstResponder()
        
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


