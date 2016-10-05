//
//  User.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 08/10/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import Foundation


class User:NSObject, NSCoding {
    //MARK: Variables
    //MARK:Private
    private var _id:Int!
    private var _username: String!
    private var _password: String!
    private var _imgPath: String!
    private var _isSignIn = false
    
    //MARK:Public-Getters
    var id: Int{
        return _id
    }
    var imgPath: String{
        return _imgPath
    }
    var username: String{
        return _username
    }
    var password: String{
        return _password
    }
    
    var isSignIn: Bool{
        return _isSignIn
    }
    
    //MARK: Methods
    init(id:Int, username:String, password:String,imgPath:String) {
        self._id = id
        self._username = username
        self._password = password
        self._imgPath = imgPath
    }
    
    override init() {
        
    }
    
    // whenever is getting the data(the load is call) from the disk you had to tell in what data type tu lo quieres
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        //esto es diciendole al protocolo en que dataType yo lo quiero/voy a  Devolver
        // en este caso yo lo unarchive/devolverlo en type como string
        self._imgPath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._username = aDecoder.decodeObjectForKey("username") as? String
        self._password = aDecoder.decodeObjectForKey("password") as? String
        self._id = aDecoder.decodeObjectForKey("id") as? Int
        self._isSignIn = (aDecoder.decodeObjectForKey("isSignIn") as? Bool)!
    }
    
    // le vamos a decir al protocol que Object convertir a data whenever the save is call
    // in order to work with NSUserDefault tienes que nadir estos dos metodos ^^ y este de abajo
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imgPath, forKey: "imagePath")
        aCoder.encodeObject(self._username, forKey: "username")
        aCoder.encodeObject(self._password, forKey: "password")
        aCoder.encodeObject(self._id, forKey: "id")
        aCoder.encodeObject(self._isSignIn, forKey: "isSignIn")
        
    }

    
    
}
