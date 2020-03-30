//
//  Item.swift
//  Say No to Forget
//
//  Created by Andika Banuraga on 28/03/20.
//  Copyright © 2020 Andika Banuraga. All rights reserved.
//

import Foundation

// Codable confirms that the class Item is Decodable and Encodable protocols

class Item: Codable {
    var title: String = ""
    var done: Bool = false
}
