//
//  NoteDataProperties.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-02.
//

import Foundation
import CoreData


extension NoteModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteModel> {
        return NSFetchRequest<NoteModel>(entityName: "Note")
    }

    @NSManaged public var noteId: String?
    @NSManaged public var noteTitle: String?
    @NSManaged public var note: String?
    @NSManaged public var noteCreated: String?
   

}
