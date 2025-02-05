//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Yashom on 26/09/24.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var rollNo: Int64
    @NSManaged public var age: Int64

}

extension Person : Identifiable {

}
