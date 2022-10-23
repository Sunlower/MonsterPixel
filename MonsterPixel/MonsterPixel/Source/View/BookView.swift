//
//  BookView.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 12/10/22.
//

import UIKit

// MARK: - View

class BookView: UIView {

    weak var delegate: BookDelegate?

    var monsters: [Monster] = []

    let label: UILabel = {
        let label = UILabel()
        label.text = "Grimoire"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Minecraft", size: 40.0)
        return label
    }()

    public var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2-30,
                                 height: UIScreen.main.bounds.width/2-15)
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.backgroundColor = UIColor(
            red: 204/255,
            green: 204/255,
            blue: 204/255,
            alpha: 1.0
        )
        collection.register(CollectionViewCell.self,
                            forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collection
    }()

    init() {
        super.init(frame: .zero)
        applyViewCode()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Extensão para organizar a estrutura do código

extension BookView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(label)
        self.addSubview(collection)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            label.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 100
            ),
            label.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width * 0.9
            ),
            label.heightAnchor.constraint(
                equalToConstant: 50
            ),
            collection.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: 20
            ),
            collection.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            collection.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width*0.95
            ),
            collection.heightAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.height
            )
        ])
    }

    func configureViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(
            red: 204/255,
            green: 204/255,
            blue: 204/255,
            alpha: 1.0
        )
        collection.dataSource = self
        collection.delegate = self
        monsters = DataManager.shared.monstros()
        collection.reloadData()
        setupLongGestureRecognizerOnCollection()
    }
}

// MARK: - Collection DataSource

extension BookView: UICollectionViewDataSource {

    // MARK: Número de itens
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return monsters.count
    }

    // MARK: Retorna a célula customizada
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath) as? CollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting"
            )
        }

        let monster = monsters[indexPath.row]
        cell.monsterImage = monster
        cell.backgroundColor = UIColor(
            red: 204/255,
            green: 204/255,
            blue: 204/255,
            alpha: 1.0
        )
        return cell
    }

    // MARK: Quando a célula é clicada
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        playSound(name: "mixkit-water-bubble-1317", exten: "wav")
        let monster = monsters[indexPath.row]
        delegate?.navigation(monster: monster)
    }

    @objc public func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if (gestureRecognizer.state != .began) {
            return
        }

        let gesture = gestureRecognizer.location(in: collection)

        if let indexPath = collection.indexPathForItem(at: gesture) {
            playSound(name: "mixkit-water-bubble-1317", exten: "wav")
            delete(cell: collection.cellForItem(at: indexPath)!)
        }
    }

}

// MARK: - Collection Delegate

extension BookView: UICollectionViewDelegate {
    func delete(cell: UICollectionViewCell) {

        if let indexPath = collection.indexPath(for: cell) {

            let dataManager = DataManager.shared.persistentContainer.viewContext
            let monster = monsters[indexPath.item]
            monsters.remove(at: indexPath.item)
            dataManager.delete(monster)
            collection.deleteItems(at: [indexPath])
            collection.reloadData()
            DataManager.shared.save()

        }
    }
}

extension BookView: UIGestureRecognizerDelegate {
    public func setupLongGestureRecognizerOnCollection() {
        let longPressedGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLongPress(gestureRecognizer:))
        )
        longPressedGesture.minimumPressDuration = 0.5
        longPressedGesture.delegate = self
        longPressedGesture.delaysTouchesBegan = true
        collection.addGestureRecognizer(longPressedGesture)
    }
}
