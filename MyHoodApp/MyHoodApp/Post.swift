//
//  Post.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 07/31/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation

// NSCoding all parecer necesita de NSObject y NSCoding es lo que nos permite convertir 
// cosas a binarios (data) y lo que nos permite devolverlo pa atras como data type
class Post: NSObject, NSCoding {
    //MARK: IBOutlets
    //MARK: Private
    private var _imagePath: String!
    private var _tittle : String!
    private var _postDesc: String!
    
    //MARK: Public-Getters
    var imagePath: String {
        return _imagePath
    }
    var tittle: String {
        return _tittle
    }
    var postDesc: String{
        return _postDesc 
    }
    
    //MARK: Methods
    init(imagePath: String, tittle: String, description: String){
        self._imagePath = imagePath
        self._tittle = tittle
        self._postDesc = description
        
    }
    
    override init() {
        
    }
    
    // whenever is getting the data(the load is call) from the disk you had to tell in what data type tu lo quieres
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        //esto es diciendole al protocolo en que dataType yo lo quiero/voy a  Devolver
        // en este caso yo lo unarchive/devolverlo en type como string
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._tittle = aDecoder.decodeObjectForKey("tittle") as? String
        self._postDesc = aDecoder.decodeObjectForKey("postDesc") as? String
        
    }
    
    // le vamos a decir al protocol que Object convertir a data whenever the save is call
    // in order to work with NSUserDefault tienes que nadir estos dos metodos ^^ y este de abajo
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._tittle, forKey: "tittle")
        aCoder.encodeObject(self._postDesc, forKey: "postDesc")
        
    }
    
    
    
    
}