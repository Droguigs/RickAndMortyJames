//
//  SeparatorViewCellBuilder.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import UIKit

extension SeparatorView: ContentCellConvertible {
    public static var cellInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

public typealias SeparatorViewCellBuilder = ContainerCellBuilder<SeparatorView>

extension ContainerCellBuilder where T == SeparatorView {
    convenience init(configuration: SeparatorView.Configuration? = nil) {
        let config = configuration ?? .init(color: UIColor(red: 218,green: 220, blue: 226, alpha: 1))
    }
}


