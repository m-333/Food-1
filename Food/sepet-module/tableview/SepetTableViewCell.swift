//
//  SepetTableViewCell.swift
//  Food
//
//  Created by melek türüdi on 21.09.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var resimImageView: UIImageView!
    @IBOutlet weak var foodCount: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var yemekAd: UILabel!
    @IBOutlet weak var SepetTableViewCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
