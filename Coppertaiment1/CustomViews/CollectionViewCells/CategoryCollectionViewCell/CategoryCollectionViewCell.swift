//
//  CategoryCollectionViewCell.swift
//  Coppertaiment1
//
//  Created by Apps2M on 23/2/23.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    
    @IBOutlet weak var gameImageView: UIImageView!
    
    @IBOutlet weak var gameTitleLbl: UILabel!
    
    func setup(category: Game) {
        gameTitleLbl.text = category.nombre
        gameImageView.kf.setImage(with: category.portada.asUrl)
        
    }
    
}
