//
//  NoteTableViewCell.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-03.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteTitileLable: UILabel!
    
    @IBOutlet weak var noteCreatedLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
