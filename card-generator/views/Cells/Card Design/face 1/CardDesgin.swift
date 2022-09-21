//
//  CardDesgin.swift
//  card-generator
//
//  Created by Mohamed Ali on 20/09/2022.
//

import UIKit

class CardDesgin: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel:  UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data: dataModel) {
        nameLabel.text = "اسم الموظف: " + data.name
        ageLabel.text  = "عُمر الموظف: " + data.age
    }
}
