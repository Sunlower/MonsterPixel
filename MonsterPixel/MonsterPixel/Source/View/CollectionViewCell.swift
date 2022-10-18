//
//  CollectionViewCell.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 12/10/22.
//

import UIKit

// MARK: - View da Célula

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CustomCell"
    var monsterImage: Monster? {
        didSet {
            configureViews()
        }
    }

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
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

extension CollectionViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            imageView.topAnchor.constraint(
                equalTo: self.topAnchor
            ),
            imageView.widthAnchor.constraint(
                equalTo: self.widthAnchor
            ),
            imageView.heightAnchor.constraint(
                equalTo: self.heightAnchor
            )
        ])
    }

    func configureViews() {
        if let monsterImage = monsterImage {
            imageView.load(mostro: monsterImage)
        }
    }
}
