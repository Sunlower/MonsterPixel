//
//  DaraManager.swift
//  BudgetData
//
//  Created by Ieda Xavier on 16/10/22.
//  Copyright © 2022 meech-ward. All rights reserved.
//

import Foundation
import CoreData

class DataManager {

    static let shared = DataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let conteiner = NSPersistentContainer(name: "MonsterPixel")
        conteiner.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unsolved error \(error), \(error.userInfo)")
            }
        }
        return conteiner
    }()

    func monstro(dataId: String) -> Monster {
        let monstro = Monster(context: persistentContainer.viewContext)
        monstro.dataId = dataId
        return monstro
    }

    func monstros() -> [Monster] {
        let request: NSFetchRequest<Monster> = Monster.fetchRequest()

        request.returnsObjectsAsFaults = false

        var fetchedMonsters: [Monster] = []

        do {
            fetchedMonsters = try persistentContainer.viewContext.fetch(request)
        } catch {
            print(error)
        }

        return fetchedMonsters
    }

    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()

            } catch {
                let nserror = error as NSError
                fatalError("unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
