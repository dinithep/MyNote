//
//  UserDataProperties.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-02.
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "User")
    }

    @NSManaged public var userId: String?
    @NSManaged public var email: String?
    @NSManaged public var userName: String?
    @NSManaged public var userCreated: String?

}
