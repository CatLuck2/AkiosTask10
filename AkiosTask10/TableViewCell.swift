//
//  TableViewCell.swift
//  AkiosTask10
//
//  Created by Nekokichi on 2020/08/10.
//  Copyright © 2020 Nekokichi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var prefectureLabel: UILabel!
    @IBOutlet weak var prefectureDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
