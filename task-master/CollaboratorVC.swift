//
//  CollaboratorVC.swift
//  task-master
//
//  Created by Rizqi Imam Gilang Widianto on 10/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollaboratorCell"

struct Collaborator {
     var collaboratorName: String
     var collaboratorProgress: Float
 }
 
 let dummyCollaborator = [
    Collaborator(collaboratorName: "Rizqi", collaboratorProgress: 20),
    Collaborator(collaboratorName: "Marvin", collaboratorProgress: 20),
    Collaborator(collaboratorName: "Titan", collaboratorProgress: 20)
     
 ]
var collaborators = [Collaborator]()
class CollaboratorVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //nanti ganti
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dummyCollaborator.count //nanti ganti
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollaboratorCell{
   //            let collaborator = collaboratora[indexPath.row]

              cell.collaboratorName.text = dummyCollaborator[indexPath.row].collaboratorName
              cell.collaboratorProgress.setProgress(20, animated: true)
              cell.collaboratorProgress.transform = cell.collaboratorProgress.transform.scaledBy(x: 1, y: 5)
                    
                print(indexPath.row)
            
               return cell
        }
        // Configure the cell
    
        return CollaboratorCell()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
