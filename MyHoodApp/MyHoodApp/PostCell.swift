//
//  PostCell.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 07/31/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var tittleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }
    
    //MARK: Configura el UI de una celda 
    func configureCell(post: Post){
        tittleLbl.text = post.tittle
        descriptionLbl.text = post.postDesc
        // post.imgPath contiene el nombre unico de cada Imagen 
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        
    }
    

}
