//
//  FirstViewController.swift
//  30.11.21
//
//  Created by APPLE on 04.12.2021.
//

import UIKit

class FirstViewController: UIViewController {

    var work : Worker?
   var label = UILabel()
    var image = UIImageView()
    var fotoWork : String?
    var textFieldOpisanie = UITextField()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль работника"
        view.backgroundColor = .white
        labelOpisanie()
        createTableViewOpisanie()
        imageFoto()
       
    }
    
    func labelOpisanie() {
        label = UILabel(frame: CGRect(x: 180, y: 400, width: 160, height: 40))
         label.text = ("\(String(describing: work!.name))  \(String(describing: work!.statusWorker))")
         view.addSubview(label)
        
    }
    
    func createTableViewOpisanie() {
        textFieldOpisanie = UITextField(frame: CGRect(x: 10, y: 500, width: 400, height: 200))
        textFieldOpisanie.placeholder = "Особые отметки"
        textFieldOpisanie.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        textFieldOpisanie.borderStyle = .roundedRect
        view.addSubview(textFieldOpisanie)
        
    }
    
    func imageFoto() {
        image = UIImageView(frame: CGRect(x: 120, y: 100, width: 200, height: 300))
        image.image = UIImage(named: fotoWork ?? "2")
        view.addSubview(image)
    }
     
}
