//
//  ViewController.swift
//  MyHoodApp
//
//  Created by Christian Nogueras on 07/31/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPost()
        
        // añade un observer para que este pendiente a una notificacion 
        // parametros: 1er quien debe estar pendiente a escuchar la notificacoion 
        // 2do : que metodo quieres que ejecute cuando escuche esa notificacion esto nos envia un parametro de NSNotification hay que tener :
        // 3ro : cual es nombre de la notificacion que debo estar atento 
        //4to: si le quieo pasar un objeto
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostLoaded(_:)), name: "postsLoader", object: nil)
        
    }
    
    
    //MARK: tableView delegate method
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: tableView delegate method- data del tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPost.count
    }
    
    //MARK: tableView delegate method- especificar la celda de cada dato
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /** OJOO paraaa mostar la informacion correcta de cada POST tengo que saber cual celda(cual row) yo quiero mostrar el Post correcto 
         pq cada celda se va a resuar y se va ingresar el nuevo Post y como el arrays de posts machea con la celda yo tengo que accesar 
         al titulo, desc, image cada vez que el lea una celda. por eso post == posts[indexPath.row] pq como cada row es equivalente a los
         indexes del arrays posts. tengo que mostar en la celda el tittel,desc,img equivalente y eso lo hago con el indexPath.row.
         **/
        
        let post = DataService.instance.loadedPost[indexPath.row]
        
        // si no le pongo el as? PostCell no deveulve el UITableViewCell como un celda de PostCell
        // devuleve la celda como una celda normal y yo quiero que sea la cleda modificada para poder 
        // tener acceso a los label y la image( i.e los controles o lo que le ponga en la celda)
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
           
         /**
             Como esta es una celda Customizada yo soy el que tengo el control de los label y de lo que quiera cambiar 
             no se puede usar el tittleLabel default  de la UITableViewCell pq ya no es una UITableViewCell por default ya yo me hice
             una celda customizada y lo que tengo que cambiar son mis controles del StoryBoard(el label del StoryBoard y el
             DescriptionLabel y la imagen) los controles yo los cambios como si fueran controles normales pq son parte de la las PostCell
             que herita de la clase UITableViewCell. Yo tengo que hace eso mismo en la clase de PostCell que se llama configureCell
          **/
          /**   El parametro Post es importante pq esa variable es la que actualiza el titlle,description,img de cada celda por eso
                es que esta la primera explicacion(comentario) de arriba de este metodo
          **/
            cell.configureCell(post)
            return cell
        }else{// if for someReason it fail to give you a reusable cell the handle down here
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
        
        
    }
    
    //MARK: tableView delegate method- identificar el height de cada celda
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    //MARK: - Reload tableview
    func onPostLoaded(notify: AnyObject){
        tableView.reloadData()
    }
    
   
    //MARK: tableView delegate metho- Se llama cuando se seleciona una celda
// funcion que se llama para verificar si una cell fue selecionada y cargar otra view cuando la celda es selecionada
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //MARK: Muestra el PostDetailViewController
        print("holaa fue selecionada ")

    }
    
    
    
    
    
}

