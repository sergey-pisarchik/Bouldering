//
//  UserInfo.swift
//  Bouldering Tickets
//
//  Created by Sergey Pisarchik on 9/13/15.
//  Copyright (c) 2015 Sergey Pisarchik. All rights reserved.
//

import Foundation
import UIKit

class UserInfo {
    
    //MARK: Properties
    var firstName: String
    var secondName: String
    var fathersName: String?
    var phone: String?
    var mail: String?
    var enterSource: String?
    var discount: String?
    var note: String?
    var photo: UIImage?
    
    //MARK: Initialization
    
    init(firstName: String, secondName: String,
    fathersName: String?,
    phone: String?,
    mail: String?,
    enterSource: String?,
    discount: String?,
    note: String?,
    photo: UIImage?){
    
    self.firstName = firstName
    self.secondName = secondName
    self.fathersName = fathersName
    self.phone = phone
    self.mail = mail
    self.enterSource = enterSource
    self.discount = discount
    self.note = note
    self.photo = photo
    }
    
}