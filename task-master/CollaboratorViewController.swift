//
//  CollaboratorViewController.swift
//  task-master
//
//  Created by Rizqi Imam Gilang Widianto on 12/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

class CollaboratorViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var addCollaborators: UITextField!
    @IBOutlet weak var collaboratorsCV: UICollectionView!
    
    let progressMax:Float = 100
    var collaboratorName: [String] = []
    var hostName: [String] = ["Rizqi"]
    var hostProgress: [Float] = [0]
    var collaboratorProgress: [Float] = [0]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collaboratorName.count + 1
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collaboratorsCV.dequeueReusableCell(withReuseIdentifier: "collaboratorCell", for: indexPath) as! CollaboratorCell
        if indexPath.row == 0 {
            cell.collaboratorName.text = hostName[indexPath.row]
                      cell.hostSign.image = #imageLiteral(resourceName: "Host")
                      cell.collaboratorProgress.setProgress(hostProgress[indexPath.row], animated: false)
                      cell.collaboratorProgress.progress = hostProgress[indexPath.row]/progressMax
                       cell.collaboratorProgress.transform.scaledBy(x: 0, y: 5)
                      cell.collaboratorProgressNumber.text = "\(hostProgress[indexPath.row])%"
                         return cell
        } else {
            cell.collaboratorName.text = goalTemp.colaboratorsList[indexPath.row-1].collaboratorName // sudah diubah
            cell.collaboratorProgress.setProgress(collaboratorProgress[indexPath.row-1], animated: false)
            cell.collaboratorProgress.progress = collaboratorProgress[indexPath.row-1]/progressMax
            cell.collaboratorProgress.transform.scaledBy(x: 0, y: 5)
            cell.collaboratorProgressNumber.text = "\(collaboratorProgress[indexPath.row-1])%"
            return cell
            
            
        }

        
       }
    
    
    
    
    @IBAction func addButton(_ sender: Any) {
        
        var newCollaborator: String = addCollaborators.text!
        let newCollaboratorProgress: Float = 0
        collaboratorName.append(newCollaborator)
        collaboratorProgress.append(newCollaboratorProgress)
        collaboratorsCV.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func countCheckedMission () -> Int {
        var index = 0
        var totalChecked = 0
        while(index < goalTemp.missionsList.count){
            totalChecked = totalChecked + 1
            index = index + 1
        }
        
        return totalChecked
    }
    
}
