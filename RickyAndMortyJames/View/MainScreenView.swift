//
//  MainScreenView.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 08/12/20.
//

import UIKit

final class MainScreenView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainScreenView: CodeView {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
}
