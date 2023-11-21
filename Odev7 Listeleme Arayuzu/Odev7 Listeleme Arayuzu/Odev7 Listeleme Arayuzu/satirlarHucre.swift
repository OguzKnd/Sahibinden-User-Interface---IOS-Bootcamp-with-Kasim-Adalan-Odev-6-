//
//  TableViewCell.swift
//  Odev7 Listeleme Arayuzu
//
//  Created by Oğuz Kanda on 10.10.2023.
//

import UIKit

class satirlarHucre: UITableViewCell {
    
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var imageViewSatir: UIImageView!
    @IBOutlet weak var aciklamaLabel: UILabel!
    @IBOutlet weak var isimLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
