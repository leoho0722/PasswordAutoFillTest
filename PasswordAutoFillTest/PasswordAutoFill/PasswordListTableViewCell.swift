//
//  PasswordListTableViewCell.swift
//  PasswordAutoFill
//
//  Created by Leo Ho on 2022/7/5.
//

import UIKit

class PasswordListTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var leftIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    static let identifier = "PasswordAutoFillListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
