//
//  ViewControllerArchives.swift
//  task-master
//
//  Created by Marvin Marcio on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

struct goalArchive {
       var namaGoals: String
       var missions: [String]
   //    add goal property here ! ( if needed ! )
   }
   // define dummy goals to render
   let dummyGoalsArchive = [
       goalArchive(namaGoals: "Turun 10 Kg",
            missions: ["Makan kurang dari 2000 kalori","Minum Air putih setiap hari","lari pagi setiap hari"]),
       goalArchive(namaGoals: "Belajar Swift",
            missions: ["Learn if-else","Learn Loop","qLearn OOP"]),
       goalArchive(namaGoals: "Punya Pacar",
            missions: ["buka tinder","jadi ganteng / cantik","jadi tajir"])
   ]

class ViewControllerArchives: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {


        @IBOutlet weak var archivesCV: UICollectionView!
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //
            return dummyGoalsArchive.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = archivesCV.dequeueReusableCell(withReuseIdentifier: "archivesCell", for: indexPath) as! ArchivesCellCV
            
            cell.backgroundColor = .green
            cell.archivesGoallabel.text = dummyGoalsArchive[indexPath.row].namaGoals + "\nProgress Bar"
            return cell
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    }


