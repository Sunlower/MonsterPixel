//
//  ViewCoding.swift
//  MonsterPixel
//
//  Created by Ieda Xavier on 12/10/22.
//

import Foundation

// MARK: Extensão para organizar a estrutura do projeto

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
