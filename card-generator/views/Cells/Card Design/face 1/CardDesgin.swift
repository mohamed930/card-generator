//
//  CardDesgin.swift
//  card-generator
//
//  Created by Mohamed Ali on 20/09/2022.
//

import UIKit
import QRCodeGenerator

class CardDesgin: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel:  UILabel!
    @IBOutlet weak var employeeCodeLabel: UILabel!
    @IBOutlet weak var employeeAppointmentDateLabel:UILabel!
    @IBOutlet weak var employeePromotionDateLabel:UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var qrcodeview: QRCodeView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data: dataModel) {
        nameLabel.text = "اسم الموظف: " + data.name
        ageLabel.text  = "عُمر الموظف: " + data.age
        employeeCodeLabel.text = "الرقم الكودى: " + data.code
        employeeAppointmentDateLabel.text = "تاريخ التعين: " + data.startDate
        employeePromotionDateLabel.text = "تاريخ الترقية: " + data.endDate
        
        logQR(data.code)
    }
    
    private func logQR(_ text:String) {
        qrcodeview.text = text
        qrcodeview.tintColor = .black
    }
}
