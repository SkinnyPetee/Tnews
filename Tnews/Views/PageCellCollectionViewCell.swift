//
//  PageCellCollectionViewCell.swift
//  Tnews
//
//  Created by sriram on 04/05/18.
//  Copyright © 2018 sriram. All rights reserved.
//

import UIKit

class PageCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    
    var page : Page? {
        didSet {
           
            cellImage.image = UIImage(named: (page?.imageName)!)
            cvLabel.text = page?.message
            
        }
    }
    
    @IBOutlet weak var cvLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    
}
