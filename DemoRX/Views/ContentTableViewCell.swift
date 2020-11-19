//
//  ContentTableViewCell.swift
//  DemoRX
//
//  Created by Anh vũ on 11/16/20.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var priceNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(obj: ContentModel) {
        nameLbl.text = obj.name
        contentLbl.text = obj.content
        priceLbl.text = obj.price
        dateLbl.text = obj.date
    }

}
