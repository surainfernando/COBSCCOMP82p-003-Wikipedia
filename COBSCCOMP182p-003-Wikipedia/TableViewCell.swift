//
//  TableViewCell.swift
//  COBSCCOMP182p-003-Wikipedia
//
//  Created by user161121 on 2/10/20.
//  Copyright © 2020 surainfdo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lableView: UILabel!
    @IBOutlet weak var imageViewer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
