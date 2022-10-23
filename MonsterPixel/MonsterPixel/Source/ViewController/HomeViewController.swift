//
//  HomeViewController.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 10/10/22.
//

import UIKit

// MARK: - Controller

class HomeViewController: UIViewController {

    var monstros: [Monster] = []

    public var home = HomeView()

    // MARK: enquanto a tela está carregando, essas instâncias são chamadas
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
        home.delegate = self
        monstros = DataManager.shared.monstros()
    }

    // MARK: Quando a tela aparrecer, essa função é chamada
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        monsterGet()
    }
}

// MARK: - Extensão para organizar a estrutura do código

extension HomeViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(home)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            home.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            home.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            home.heightAnchor.constraint(
                equalTo: view.heightAnchor
            ),
            home.widthAnchor.constraint(
                equalTo: view.widthAnchor
            )
        ])
    }

    func configureViews() {
        home.translatesAutoresizingMaskIntoConstraints = false
        playSound(name: "retro_8_bit_repeating_016", exten: "mp3")
    }
}

// MARK: - Delegate

extension HomeViewController: HomeDelegate {

    // MARK: leva para o BookViewController
    func navigation() {
        let rootViewcontroller = BookViewController()
        let viewController = UINavigationController(rootViewController: rootViewcontroller)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true, completion: nil)
    }

    // MARK: Pega o monstro, salva se houver mudanças e carrega a imagem
    func monsterGet() {
        Task {
            do {
                let dataId = try await Webservice().getMonster()
                let monster = DataManager.shared.monstro(dataId: dataId.dataId)

                monstros.append(monster)
                DataManager.shared.save()
                home.monsterImage.load(mostro: monster.self)

            } catch {
                print(error)
            }
        }
    }
}

extension UIImageView {
    func load(mostro: Monster) {

        let urlMonstro = URL(
            string: "https://app.pixelencounter.com/api/v2/basic/svgmonsters/\(mostro.dataId ?? "nil")/image/png?size=400"
        )

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlMonstro!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
