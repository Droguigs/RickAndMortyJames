//
//  CharactersCellBuilder.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import UIKit

typealias CharactersCellBuilder = ContainerCellBuilder<CharacterCellView>

extension CharacterCellView: ContentCellConvertible {}

extension ContainerCellBuilder where T == CharacterCellView {
    convenience init(configuration: CharacterCellView.Configuration) {
        self.init(configuration)
    }
}
