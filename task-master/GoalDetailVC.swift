//
//  GoalDetailVC.swift
//  task-master
//
//  Created by Yohan Wongso on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

class GoalDetailVC: UIViewController {

    @IBOutlet weak var titleVC: UINavigationItem!
    @IBOutlet weak var goalNameTextField: UITextField!
    @IBOutlet weak var goalTimeStartTextField: UITextField!
    @IBOutlet weak var goalTimeEndTextField: UITextField!
    @IBOutlet weak var missionsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func colaboratorButtonDidTab(_ sender: UIBarButtonItem) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
