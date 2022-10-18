//
//  MonsterView.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 12/10/22.
//

import UIKit
import SwiftUI

// MARK: - View

class MonsterView: UIView {

    var monster: Monster? {
        didSet {
            configureViews()
        }
    }

    let label: UILabel = {
        let label = UILabel()
        label.text = "Monster"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Minecraft", size: 40.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let uiImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Extensão para organizar a estrutura do código

extension MonsterView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(uiImage)
        self.addSubview(label)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            label.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 120
            ),
            label.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width * 0.9
            ),
            label.heightAnchor.constraint(
                equalToConstant: 50
            ),
            uiImage.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            uiImage.topAnchor.constraint(
                equalTo: label.bottomAnchor
            ),
            uiImage.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width * 0.8
            ),
            uiImage.heightAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.height * 0.5
            )
        ])
    }

    func configureViews() {
        if let monster = monster {
            uiImage.load(mostro: monster)
        }
    }

}
