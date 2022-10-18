//
//  BookDelegate.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 13/10/22.
//

import Foundation

// MARK: Navegação do Grimório para Informação do monstro

protocol BookDelegate: AnyObject {

    func navigation(monster: Monster)

}
