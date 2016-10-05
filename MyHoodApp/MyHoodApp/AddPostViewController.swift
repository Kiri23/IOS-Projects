//
//  AddPostViewController.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 07/31/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit

// it need to have the UINavigationControllerDelegate to work apropely with UIImagePickerViewControllerDelegate para que el usuario pueda interacturar con el
// UIImagePickerViewController correctamente
class AddPostViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK: IBOUtlets
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var tittleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var addPicButton: UIButton!
    
    //MARK: Variables
    var imagePicker : UIImagePickerController!
    private var _didSelectImage = false
    
    var didSelectImage: Bool {
        return _didSelectImage
    }
    //MARK:Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true 
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if(didSelectImage){
            addPicButton.setTitle("", forState: .Normal)
        }
        
    }

    @IBAction func makePostBtnPressed(sender: AnyObject) {
        // devuelve ? so it may have or not may have a tittle so para eso es el if let syntax 
        // pq si contiene un tittle pues entonces entra al if pero si no lo contiene pues entonces no entra al if
        if let tittle = tittleField.text,let desc = descriptionField.text, let img = postImg.image{
            // devuelve el nombre de la imagen
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
           let post = Post(imagePath: imgPath, tittle: tittle, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        
        
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //FIXME: Arreglar cuando el usuario le da a cancel al button y no eligio ninguna foto pues dejar el texto del button en +Add Pic. Chequiar si el UIButton
    @IBAction func addPicBtnPressed(sender: UIButton) {
        // si seleciono una imagen elimina el texto "+AddPic" 
        if(didSelectImage){
            sender.setTitle("", forState: .Normal)
        }
        // metodo de UIViewController para presentar(load) un UIViewController(i,e UIPickerViewController es un UIViewController) toma tres parametros el viewcontroller que quieres cargar(load) en este caso imagePicker , 2do parametro animated true, 3er parametro what you want to do when controller load in this null(nil)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
   
    //MARK: imagePickerControllerDelegate Method-se llama cuando el usuario eligio una imagen
    // tell the imagePickerdelegate that a user select an  image from the imagepicker
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // imagePicker inhiere de UIViewController por eso puede llamar el metodo de dismissViewControllerAnimated. As a side note tambien inhiere de UINavigationViewController so puede hacer todo lo que hace un UINavigationViewController hace
        // when the user select a image que es lo que hace este delegate method we want to hide the UIViewPickerController
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        // the image that the user selected que es given by this delegate method
        postImg.image = image
        _didSelectImage = true
        
        // la intencion de este metodo es que cuando un user select an image we want to hide the librayPhot(i.e UIImagePickerController) y cojer la foto que el usuario le dio tap y asignarla a la imagen que el usuario va a postear
    }
    
    
    // MARK: To hide the keyboard, this function es hereda por el UIViewController
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
         view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
}
