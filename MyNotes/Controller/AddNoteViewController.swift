//
//  AddNoteViewController.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-03.
//

import UIKit
import CoreData

class AddNoteViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        noteTextView.layer.borderWidth = 1.0
        noteTextView.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func saveBtnClicked(_ sender: Any) {
        print("Cli(cked me")
        createData()
        retrieveData()
        
    }
    

    
    func createData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new user records.
        let noteEntity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm" //give the formate according to your need
        let dateStr =  dateFormatter.string(from: currentDate)
        
        
            
        let note = NSManagedObject(entity: noteEntity, insertInto: managedContext)
        note.setValue("1", forKey: "noteId")
        note.setValue(titleTextField.text, forKey: "noteTitle")
        note.setValue(noteTextView.text, forKey: "note")
        note.setValue(dateStr, forKey: "noteCreated")

        

        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveData() {
         
         //As we know that container is set up in the AppDelegates so we need to refer that container.
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         
         //We need to create a context from this container
         let managedContext = appDelegate.persistentContainer.viewContext
         
         //Prepare the request of type NSFetchRequest  for the entity
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
         
 //        fetchRequest.fetchLimit = 1
 //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
 //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
 //
         do {
             let result = try managedContext.fetch(fetchRequest)
             for data in result as! [NSManagedObject] {
                 print(data.value(forKey: "noteTitle") as! String)
             }
             
         } catch {
             
             print("Failed")
         }
     }
    
}
