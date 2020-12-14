//
//  CharacterCellView.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import UIKit

public class CharacterCellView: UIView {
    
    let imageView = UIImageView(frame: .zero)
    let labelName = UILabel(frame: .zero)
    let labelStatus = UILabel(frame: .zero)
    let labelLocation = UILabel(frame: .zero)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterCellView: CodeView {
    
    func buildViewHierarchy() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(labelName)
        addSubview(labelStatus)
        addSubview(labelLocation)
    }
    
    func setupConstraints() {
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        imageView.trailingAnchor.constraint(equalTo: labelName.leadingAnchor, constant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
        labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        labelName.bottomAnchor.constraint(equalTo: labelStatus.topAnchor, constant: -8).isActive = true
        labelName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        labelStatus.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
        labelStatus.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16).isActive = true
        labelStatus.bottomAnchor.constraint(equalTo: labelLocation.topAnchor, constant: -8).isActive = true
        labelStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        labelLocation.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
        labelLocation.topAnchor.constraint(equalTo: labelStatus.topAnchor, constant: 16).isActive = true
        labelLocation.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        labelLocation.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        imageView.backgroundColor = .black
        labelName.backgroundColor = .purple
        labelStatus.backgroundColor = .green
        labelLocation.backgroundColor = .brown
    }
    
}
