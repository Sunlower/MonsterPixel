//
//  MonsterPixelTests.swift
//  MonsterPixelTests
//
//  Created by Ieda Xavier on 10/10/22.
//

import XCTest
@testable import MonsterPixel

final class MonsterPixelTests: XCTestCase {

    var homeMonster: HomeViewController!
    var bookMonster: BookViewController!
    var monsterMonster: MonsterViewController!
    var monster = Monster()
    var monsters : [Monster] = []

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHomeVC() throws {
        homeMonster = HomeViewController()
        homeMonster.viewDidLoad()
        XCTAssertTrue(homeMonster.isViewLoaded)
    }

    func testGenarete() throws {
        homeMonster = HomeViewController()
        homeMonster.viewDidLoad()
        let contando = homeMonster.monstros.count.hashValue
        homeMonster.home.buttonGenarate.isPointerInteractionEnabled = true
        homeMonster.home.buttonGenarate.isTouchInside
        XCTAssertTrue(homeMonster.monstros.count.self > contando)
    }

    func testBookVC() throws {
        homeMonster = HomeViewController()
        homeMonster.viewDidLoad()
        homeMonster.home.tapHere()
        bookMonster = BookViewController()
        XCTAssertTrue(bookMonster.isViewLoaded)
    }

    func testMonsterVC() throws {
        homeMonster = HomeViewController()
        homeMonster.viewDidLoad()
        homeMonster.navigation()
        bookMonster = BookViewController()
        bookMonster.bookView.collectionView(
            bookMonster.bookView.collection,
            didSelectItemAt: IndexPath.init())
        XCTAssertTrue(monsterMonster.isViewLoaded)
    }

    func testBookDelete() throws {
        homeMonster = HomeViewController()
        homeMonster.viewDidLoad()
        homeMonster.navigation()
        bookMonster = BookViewController()
//        bookMonster.bookView.collectionView(bookMonster.bookView.collection.self, didSelectItemAt: bookMonster.bookView.collection.indexPath(for: UICollectionViewCell())!)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
