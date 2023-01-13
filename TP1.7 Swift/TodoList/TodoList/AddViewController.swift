//
//  AddViewController.swift
//  TodoList
//
//  Created by Anisse Outssakki on 15/12/2022.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.dataSource = self
        myPicker.delegate = self
        

        if let data  = myData {
            nameTask.text = data.nom
            desc.text = data.desc
            myDatePicker.date = data.myDate
            pickerText = data.priorite
        }
        else{
            print("ERREUR")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        myData!.nom = nameTask.text!
        myData!.desc = desc.text!
                
        return true
    }
    
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var myPicker: UIPickerView!
    
    var myData: MyTodo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        myData = MyTodo(nom: nameTask.text!, desc: desc.text!, state: false, myDate: myDatePicker.date, priorite: pickerText)
    }
    
    let contenuPicker = ["Aucune", "Faible","Moyenne", "Élevée"]
    var pickerText: String = ""
    
    

}
