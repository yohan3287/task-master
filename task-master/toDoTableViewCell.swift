//
//  toDoTableViewCell.swift
//  task-master
//
//  Created by Antonius F Aulia on 13/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

class toDoTableViewCell: UITableViewCell {

    @IBOutlet weak var checkedImage: UIImageView!
    @IBOutlet weak var checkedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
