//
//  MonsterModel.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 10/10/22.
//

import Foundation
import UIKit

//MARK: Modelo do monstro
struct Monstro: Codable {
    var dataId = String()

    enum CodingKeys: String,CodingKey {
        case dataId
    }
}
