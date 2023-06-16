//
//  ImageCityCollectionViewCell.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 19/08/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCity: UIImageView!
    
    @IBOutlet weak var nameCity: UILabel!
    
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";
    func setCell(with city: CommunityAndCities){
        nameCity.text = city.Name
        let imageCity1 = imgFolder + city.PicUrl
        imageCity.sd_setImage(with: URL(string: imageCity1))
    }
}
