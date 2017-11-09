//
//  RealmObjects.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-08.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Quote: Object {
    @objc dynamic var quoteText:String = ""
    @objc dynamic var author:String = ""
    @objc dynamic var photoData:Data? = nil
}






