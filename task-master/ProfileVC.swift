//
//  ViewControllerProfile.swift
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
class ProfileVC: UIViewController {
    var bgImage: UIImageView?


    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!

//    profileImage.imageView.image =[profileImage setImage:[UIImage imageNamed: @"Profile Blue.png"]]
    @IBOutlet weak var archiveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editButton.layer.cornerRadius = 20
        self.archiveButton.layer.cornerRadius = 20
        var image: UIImage = UIImage(named: "Profile Blue")!
        
              bgImage = UIImageView(image: image)
//              bgImage!.frame = CGRect(0,0,100,200)
              self.view.addSubview(bgImage!)
        userName.text = currentUser.userName
        print(currentUser.userName)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveToEdit(_ sender: Any) {
        performSegue(withIdentifier: "toEditProfile", sender: self)
    }
    @IBAction func unwindToProfile(unwindSegue: UIStoryboardSegue){}
   
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
