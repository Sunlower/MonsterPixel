//
//  Home.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 10/10/22.
//

import UIKit

// MARK: - View

class HomeView: UIView {

    weak var delegate: HomeDelegate?

    let labelName: UILabel = {
        let labelName = UILabel()
        labelName.text = "Monster Pixel"
        labelName.font = UIFont(name: "04b", size: 40.0)
        labelName.numberOfLines = 0
        labelName.textAlignment = .center
        labelName.textColor = .white
        return labelName
    }()

    lazy var buttonBook: UIButton = {
        var btnBook = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        btnBook.setImage(UIImage(named: "book1.png"), for: .normal)
        btnBook.setImage(UIImage(named: "book.png"), for: .highlighted)
        btnBook.addTarget(self, action: #selector(tapHere), for: .touchUpInside)
        return btnBook
    }()

    let buttonGenarate : UIButton = {
        let btnGenerator = UIButton(type: .custom)
        btnGenerator.setImage(UIImage(named: "gntBTN.png"), for: .normal)
        btnGenerator.setImage(UIImage(named: "gntBTN1.png"), for: .highlighted)
        btnGenerator.addTarget(
            self,
            action: #selector(getMonster),
            for: .touchUpInside
        )
        return btnGenerator
    }()

    let monsterImage : UIImageView = {
        let imageImage = UIImage()
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        image.image = imageImage
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
        delegate?.monsterGet()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Extensão para organizar a estrutura do código

extension HomeView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(buttonGenarate)
        self.addSubview(monsterImage)
        self.addSubview(labelName)
        self.addSubview(buttonBook)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            labelName.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            labelName.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 120
            ),
            labelName.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.7
            ),
            labelName.heightAnchor.constraint(
                equalToConstant: 150
            ),
            buttonGenarate.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            buttonGenarate.topAnchor.constraint(
                equalTo: monsterImage.bottomAnchor,
                constant: 60
            ),
            buttonGenarate.heightAnchor.constraint(
                equalToConstant: 60
            ),
            buttonGenarate.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.8
            ),
            monsterImage.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            monsterImage.topAnchor.constraint(
                equalTo: labelName.bottomAnchor
            ),
            monsterImage.heightAnchor.constraint(
                equalTo: self.heightAnchor,
                multiplier: 0.5
            ),
            monsterImage.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.8
            ),
            buttonBook.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -10
            ),
            buttonBook.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 60
            ),
            buttonBook.heightAnchor.constraint(
                equalToConstant: 60
            ),
            buttonBook.widthAnchor.constraint(
                equalToConstant: 60
            )
        ])
    }

    func configureViews() {
        buttonGenarate.translatesAutoresizingMaskIntoConstraints = false
        monsterImage.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        buttonBook.translatesAutoresizingMaskIntoConstraints = false

        self.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
    }

    @objc func tapHere () {
        playSound(name: "mixkit-water-bubble-1317", exten: "wav")
        delegate?.navigation()
    }

    @objc func getMonster() {
        playSound(name: "mixkit-water-bubble-1317", exten: "wav")
        delegate?.monsterGet()
    }
}
