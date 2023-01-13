//
//  EditViewController.swift
//  TodoList
//
//  Created by Anisse Outssakki on 13/12/2022.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.delegate = self
        myPicker.dataSource = self
        
        if let data  = myData {
            name.text = data.nom
            nameTache.text = data.nom
            desc.text = data.desc
            myDatePicker.date = data.myDate
            pickerText = data.priorite
        }
        else{
            name.text = "Erreur"
        }
        
        nameTache.delegate = self
        desc.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        myData!.nom = nameTache.text!
        myData!.desc = desc.text!
                
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        myData = MyTodo(nom: nameTache.text!, desc: desc.text!, state: false,myDate: myDatePicker.date,priorite: pickerText )
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameTache: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var myPicker: UIPickerView!
    
    var myData: MyTodo?
    
    let contenuPicker = ["Aucune", "Faible","Moyenne", "Élevée"]
    var pickerText: String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contenuPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contenuPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerText = contenuPicker[row]
    }
}
