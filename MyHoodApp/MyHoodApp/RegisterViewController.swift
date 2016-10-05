//
//  RegisterViewController.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 08/14/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var userField:UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //MARK: Private Variables
    private var _userList = [[String]] ()
    private var _userNameList = [String] ()
    private var _userPasswordList = [String]()
    
    //MARK: Getter
    var userList: [[String]]{
        return _userList
    }
    
    var userNameList: [String]{
        return _userNameList
    }
    
    var userPasswordList: [String]{
        return _userPasswordList
    }
    
    
    //MARK: Methods
    
    override func viewDidLoad() {
        
        
    }
    
    @IBAction func registerButtonTapped(sender: UIButton){
        
        if (userField.hasText() && passwordField.hasText()){
            if let userText = userField.text, userPassword = passwordField.text {
               _userNameList.append(userText)
               _userPasswordList.append(userPassword)
                _userList.append(_userNameList)
                _userList.append(_userPasswordList)
                
                print("UserrList: ",userList )
                print("Ussser: ", userNameList)
                print("password: ", userPasswordList)
                dismissViewControllerAnimated(true, completion: nil)
            }else {
                print("Something Went Wrong ")
            }
            
        }else{
            print("Something Went Wrong ")
            
        }
        
    }
    
    
    @IBAction func logInButtonTapped(sender: UIButton!){
        
        
        //FIXME: El foor hay que hacer que loopea en todo el array pq la funcion dl LOGIN es pq se supone que ya haiga un usaurio conectado y tengo que reccore toda la lista del array no como lo tengo abajo que tengo numeros enteros PLUS ADEMAS CREO QUE TENGO QUE HACERLO EN UNA CLASE APARTE PQ ESTE ES EL Controller 
        if(userField.hasText() && passwordField.hasText()){
            if let userText = userField.text, userPassword = passwordField.text {
                for currentCount in 0...1 {
                    //FIXME: No se puede usar el forEach tengo que iterar en un solo usuario y un solo paswword, esta solucion itera en todos los nombres de usuarios
                    for userInfo in 0...1 {
                        if (currentCount == 0) {
                             var userName = _userList[currentCount][userInfo]
                        }else if (currentCount == 1){
                            var userPassword = _userList[currentCount][userInfo]
                        }else{
                            print("No se encontro ningun Usuario")
                        }
                      
                        
                    }
                        
                    }
                }
            }// end if
        }// end outer if
        
        
    }// end class
    
   

