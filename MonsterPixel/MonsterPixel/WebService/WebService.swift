//
//  Webservice.swift
//  POCAPI
//
//  Created by Ieda Xavier on 14/10/22.
//

import Foundation
import UIKit

enum MonsterError: Error {
    case invalidServerResponse
}

class Webservice {

    public let baseURL = URL(string: "https://app.pixelencounter.com/api/basic/monsters/random/json")

    public var imageMonstro = UIImage()

    func getMonster() async throws -> Monstro {

        let (data, response) = try await URLSession.shared.data(from: baseURL!)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw MonsterError.invalidServerResponse
        }

        return try JSONDecoder().decode(Monstro.self, from: data)
    }

}
