//
//  TableViewCell.swift
//  tableView0528Test1
//
//  Created by 홍석평 on 5/28/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var mainLabel: UILabel!
    
    
    @IBOutlet var checkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
