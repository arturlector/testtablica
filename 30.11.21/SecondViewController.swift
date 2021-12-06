//
//  SecondViewController.swift
//  30.11.21
//
//  Created by APPLE on 30.11.2021.
//

import UIKit

protocol Delegate {
    func appendArrayWorker (parametr1: String, parametr2: String)
}

class SecondViewController: UIViewController {

    
    var textField = UITextField()
    var textFieldName = UITextField()
    var button = UIButton()
    var delegate1: Delegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createTextFieldNameWork()
        createButtonSave()
        createTextFieldStatusWork()
     
        
    }
    
    func createTextFieldNameWork()  {
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: 180, height: 40))
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "status"
        
        view.addSubview(textField)
    }
    
    func createTextFieldStatusWork(){
        textFieldName = UITextField(frame: CGRect(x: 118, y: 350, width: 180, height: 40))
        textFieldName.borderStyle = .roundedRect
        textFieldName.placeholder = "name"
        view.addSubview(textFieldName)
    }
    
    func createButtonSave() {
        button = UIButton(frame: CGRect(x: 163, y: 500, width: 100, height: 50))
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 0.5
        button.setTitle("Save", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonMov), for: .touchUpInside)
        button.addTarget(self, action: #selector(changeButtonColor), for: .touchUpInside)
        view.addSubview(button)
     }
    
    @objc func buttonMov () {
        let name = textFieldName.text
        let status = textField.text
        
        delegate1?.appendArrayWorker(parametr1: name!, parametr2: status!)
        
        print("1")
    }
    
    @objc func changeButtonColor () {
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}



