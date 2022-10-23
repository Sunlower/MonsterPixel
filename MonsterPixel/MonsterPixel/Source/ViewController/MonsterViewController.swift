//
//  MonsterViewController.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 12/10/22.
//

import UIKit

// MARK: - Controller

class MonsterViewController: UIViewController {

    var monster: Monster?

    private var monsterView = MonsterView()

    private lazy var shareButton = UIBarButtonItem(
        image: UIImage(named:"sharebtn1.png"),
        style: .plain,
        target: self,
        action: #selector(share)
    )

    lazy var backButton = UIBarButtonItem(
        image: UIImage(named: "backbtn1.png"),
        style: .plain,
        target: self,
        action: #selector(back)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }

    @objc func share() {
        playSound(name: "mixkit-water-bubble-1317", exten: "wav")
        guard let acitivityItem = monsterView.uiImage.image else {
            return
        }
        let activityViewController = UIActivityViewController(
            activityItems: [acitivityItem],
            applicationActivities: nil
        )
        activityViewController.isModalInPresentation = true
        activityViewController.popoverPresentationController?.barButtonItem = shareButton
        self.present(activityViewController, animated: true, completion: nil)
    }

    @objc func back() {
        playSound(name: "mixkit-water-bubble-1317", exten: "wav")
        self.dismiss(animated: true)
    }
}

// MARK: - Extensão para organizar a estrutura do código

extension MonsterViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(monsterView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            monsterView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            monsterView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            monsterView.heightAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.height
            ),
            monsterView.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width
            )
        ])
    }

    func configureViews() {
        monsterView.translatesAutoresizingMaskIntoConstraints = false
        monsterView.monster = self.monster
        view.backgroundColor = UIColor(
            red: 204/255,
            green: 204/255,
            blue: 204/255,
            alpha: 1.0
        )
        self.navigationItem.rightBarButtonItem = shareButton
        self.navigationItem.leftBarButtonItem = backButton
    }
}
