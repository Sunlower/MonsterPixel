//
//  DataManagerTest.swift
//  MonsterPixelTests
//
//  Created by Ieda Xavier on 19/10/22.
//

import XCTest
@testable import MonsterPixel
import CoreData


final class DataManagerTest: XCTestCase {

    lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "MonsterPixel")

      let description = NSPersistentStoreDescription()
      description.url = URL(fileURLWithPath: "/dev/null")
      container.persistentStoreDescriptions = [description]

      container.loadPersistentStores(completionHandler: { _, error in
        if let error = error as NSError? {
          fatalError("Failed to load stores: \(error), \(error.userInfo)")
        }
      })

      return container
    }()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveMonster() {
        let dataManager = DataManager()

    }

    func testPersistencyMonster() {

    }

}
