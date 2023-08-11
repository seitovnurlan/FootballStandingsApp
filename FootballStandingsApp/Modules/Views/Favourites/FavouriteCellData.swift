//
//  FavouriteCellData.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 31/7/23.
//

import UIKit

class FavouriteCellData {
    let indexPath: IndexPath
    let isFavourite: Bool
    let image: UIImage?
    
    init(indexPath: IndexPath, isFavourite: Bool, image: UIImage?) {
        self.indexPath = indexPath
        self.isFavourite = isFavourite
        self.image = image
    }
}

