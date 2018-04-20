//
//  LogTableViewCell.swift
//  current-place-on-map
//
//  Created by Sushan Jiang on 4/18/18.
//  Copyright © 2018 William French. All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {

    @IBOutlet weak var emojilabel: UILabel!
    @IBOutlet weak var commentlabel: UITextView!
    @IBOutlet weak var placelabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var energylabel: UILabel!
    @IBOutlet weak var productivitylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
