//
//  ViewNoteViewController.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-03.
//

import UIKit
import CoreData

class ViewNoteViewController: UIViewController {
    var notes :[NoteModel] = []
    @IBOutlet weak var tableView: UITableView!
    var note: NoteModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotes()

        // Do any additional setup after loading the view.
    }
    

    func fetchNotes(){
        let fetchRequest:NSFetchRequest<NoteModel> = NoteModel.fetchRequest()
        
        do{
            let _notes = try CoreDataHandler.context.fetch(fetchRequest)
            
            if _notes.count > 0 {
                self.notes = _notes
                tableView.reloadData()
            } else {
                DispatchQueue.main.async {
                    //self.alertDialogOK(titile: "Wenn", message: "No claim histroy found", btntxt: "Ok")
                }
            }
        }catch{
            print("error")
        }
    }
    
    

}

extension ViewNoteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell
        //cell.textLabel?.text = array[indexPath.row]
        cell?.noteTitileLable?.text = self.notes[indexPath.row].noteTitle
        cell?.noteCreatedLable?.text = self.notes[indexPath.row].noteCreated
                
        //cell?.selectionStyle = .none
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          //print(indexPath)
         note = notes[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: indexPath)

    }
}

extension ViewNoteViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue", let viewController = segue.destination as? NoteDetailViewController {
            viewController.note = self.note
        }
    }
}
