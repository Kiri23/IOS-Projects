//
//  DataService.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 08/02/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    // esto es un singleton es una variable static que permanece o vive en la clase y como es de la clase pues es globally accesed by everyone so I can call properties and methods from dataservice.instance.(method o variable)
    //MARK: Variables
    //MARK: Singleton
    static let instance = DataService()
    
    //MARK: Private
    // this is where we going to store our Post
    private var _loadedPost = [Post]()
    //MARK: Public
    let KEY_POST = "posts"
    
    var loadedPost: [Post] {
        return _loadedPost
        
    }
    
    //MARK: Methods
    // idea 1) convertir el array a data(ejemplo bites and bits)(NSData)
    // 2) Grabar en el *disco* I think el Object yo convertir a NSData con un key de "posts"
    func savePost() {
        // save a whole array (i.e loadedPost)
        // we need to archieveData and convert to bites and bits
        // convert it to data
        let postData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPost)
        
        // We're grabbing the storing mechanism and set it a object
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POST)
        // this actually saved to the Disk and Update it
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    // idea 1) Coger el objeto del Disco como NSData 
    // 2) Unarchive la data volverla a cconvertir en el data Type para que se pueda mostar al Usuario
    func loadPost() {
        //we're doing the opposite here we're grabing an object from the storing mechanism name "post" and convert it to NSData 
        // tengo el if let para que entre al if si pudo conseguir el objeto con key "posts" y si no 
        // existe el objeto pues no entre al if y no crashee
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POST) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
                _loadedPost = postsArray
            }
            
        }
        
        // notify that the post have been loaded to whoever is listen 
        // call our default NotificationCenter and post a Notification
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoader", object: nil))
        
        
    }
    
    //MARK: Return the path of the image
    func saveImageAndCreatePath(image: UIImage) -> String{
        // return the data of the mage in png format in order to save it to the disk como se ha hecho anteriormente
        let imgData = UIImagePNGRepresentation(image)
        // we want to save a image each time with a unique name ***THIS IS HOW WE DO UNIQUE NAME**
        // this is safe each time with a timerInterval
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        // this is the fullPath(location to save the img) /where we want to save the image
        let fullPath = documentsPathForFileName(imgPath)
        // ****AQUI EN DONDE GUARDO LA IMAGEN AL FULLPath*****
        // NO se guarda con NSUserDefault se Guarda en el disco, y espacio real en el telefono
        imgData?.writeToFile(fullPath, atomically: true)
        // return the path of the image so we can save then in the NSUserDefault // each path is Unique
        return imgPath
        
    }
    
    //MARK: Retrieve a image // the loading of a Image // it may return an image it may not
    func imageForPath(path: String) -> UIImage? {
        // do the same thing tht we did before get the directory for the fullPath image
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
        
        
    }
    
    func addPost(post:Post){
        _loadedPost.append(post)
        savePost()
        loadPost()
        
    }
    
    /** THIS IS THE WAY TO GRABBING A PATH FROM THE PHONE **/
    //MARK: Get a Path For a Specific Fileame
    func documentsPathForFileName(name: String) -> String{
        // if you want to get a Document Directory Document is Store in DocumentDirectory not the Standar NSuserDeafult 
        // NSSearchPathForDirectorysInDomain devuelve un array de String en el directorio del Document(1st parameters) el 2do parametro es busca dentro de DocumentDirectory en the user homer directory en donde el usuario guartda todas sus cosas 3er parameter expandedTittle
        // this give us a array and we want the first item in the array
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fulllPath = paths[0] as NSString // objective-C class
        // fullPath va a devolver el idrectorio de donde esta mis photos byAppendingPathComponent le añado el nombre de la imagen que quiero buscar dentro del DocumentDirectory, this is only an Objective-C class method that's why we use NSString y no String(de Swift) que no tiene el metodo
        return fulllPath.stringByAppendingPathComponent(name)
    }
    
    
    
    
    
    
}