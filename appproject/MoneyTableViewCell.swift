//
//  MoneyTableViewCell.swift
//  appproject
//
//  Created by 이유진 on 12/04/2019.
//  Copyright © 2019 이유진. All rights reserved.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Labelindex: UILabel!
    @IBOutlet weak var Labelname: UILabel!
    @IBOutlet weak var Labelprice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
