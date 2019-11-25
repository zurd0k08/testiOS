//
//  PostsTableViewCell.swift
//  testiOS
//
//  Created by Jose Pablo Perez Estrada on 11/25/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
