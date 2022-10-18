//
//  BookViewController.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 12/10/22.
//

import UIKit

// MARK: - Controller

class BookViewController: UIViewController {

    var monstros: [Monster] = []

    lazy var backButton = UIBarButtonItem(
        image: UIImage(named: "backbtn1.png"),
        style: .plain,
        target: self,
        action: #selector(back)
    )

    private var bookView = BookView()

    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }

    @objc func back() {
        self.dismiss(animated: true)
    }

}

// MARK: - Extensão para organizar a estrutura do código

extension BookViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(bookView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            bookView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            bookView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            bookView.heightAnchor.constraint(
                equalTo: view.heightAnchor
            ),
            bookView.widthAnchor.constraint(
                equalTo: view.widthAnchor
            )
        ])
    }

    func configureViews() {
        bookView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.leftBarButtonItem = backButton
        bookView.delegate = self
    }

}

// MARK: - Delegate

extension BookViewController: BookDelegate {
    func navigation(monster: Monster) {
        let rootViewcontroller = MonsterViewController()
        rootViewcontroller.monster = monster
        let viewController = UINavigationController(rootViewController: rootViewcontroller)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true, completion: nil)
    }

}
