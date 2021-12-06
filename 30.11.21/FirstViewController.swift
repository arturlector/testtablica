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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль работника"
        view.backgroundColor = .white
       label = UILabel(frame: CGRect(x: 180, y: 400, width: 100, height: 40))
        label.text = ("\(String(describing: work!.name))  \(String(describing: work!.statusWorker))")
        view.addSubview(label)
        

    }
    
   
     
}
