//
//  SeparatorView.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import UIKit

public class SeparatorView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public struct Configuration {
        var color: UIColor
    }
    
    public func setup(with data: Configuration) {
        self.backgroundColor = data.color
    }
    
}

extension SeparatorView: CodeView {
    func buildViewHierarchy() { }
    
    func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }    
    
}
