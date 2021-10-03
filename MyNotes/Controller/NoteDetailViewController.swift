//
//  NoteDetailViewController.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-03.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    var note: NoteModel?

    @IBOutlet weak var noteTitleLabel: UILabel!
    
    @IBOutlet weak var noteLabel: UITextView!
    
    @IBOutlet weak var noteCreatedLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
        

        // Do any additional setup after loading the view.
    }
    
    func LoadData(){
        //noteTitleLabel.text = note?.noteTitle
        noteLabel.text = note?.note
        noteCreatedLable.text = note?.noteCreated
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
