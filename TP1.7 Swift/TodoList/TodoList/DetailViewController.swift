//
//  DetailViewController.swift
//  TodoList
//
//  Created by Anisse Outssakki on 09/12/2022.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFormatter.dateFormat = "dd/MM/yyyy"
        
        if let data  = myData {
            name.text = data.nom
            desc.text = data.desc
            initialState.setOn(data.state, animated: true)
            myDateLabel.text = dataFormatter.string(from: data.myDate)
            prioriteLabel.text = data.priorite
        }
        else{
            name.text = "Erreur"
            desc.text = " Erreur "
            myDateLabel.text = "Erreur"
            prioriteLabel.text = "Erreur"
        }
    }
    
    let dataFormatter = DateFormatter()

    @IBOutlet weak var myDateLabel: UILabel!
    @IBOutlet weak var initialState: UISwitch!
    @IBAction func changeState() {
        if  initialState.isOn == true
        {
            myData?.state = true
        }
        else
        {
            myData?.state = false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController{
            vc.myData = myData
        }
    }

    
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            //vc.dismiss(animated: true, completion: nil)
            print("test")
            if let updatedTask = vc.myData {
                name.text = updatedTask.nom
                desc.text = updatedTask.desc
                myDateLabel.text = dataFormatter.string(from: updatedTask.myDate)
                prioriteLabel.text = updatedTask.priorite

                
                myData?.nom = updatedTask.nom
                myData?.desc = updatedTask.desc
                myData?.myDate = updatedTask.myDate
                myData?.priorite = updatedTask.priorite
                print("save")
            }
        }
        //let sourceViewController = unwindSegue.source
        
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var prioriteLabel: UILabel!
    
    var myData: MyTodo?

}
