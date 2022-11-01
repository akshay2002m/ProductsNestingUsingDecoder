//
//  ProductsTableViewCell.swift
//  ProductsNestingUsingDecoder
//
//  Created by Mac on 15/10/22.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productIdLabel: UILabel!
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    @IBOutlet weak var productRateLabel: UILabel!
    
    @IBOutlet weak var productCountLabel: UILabel!
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
