//
//  HomeDelegate.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 13/10/22.
//

import Foundation

// MARK: Navegação da Home para o Grimório e pega os monstros para a CollectionView

protocol HomeDelegate: AnyObject {

    func navigation()
    func monsterGet()

}
