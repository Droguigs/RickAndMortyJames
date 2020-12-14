//
//  Reusable.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import UIKit

extension UITableView {
    
    func register<R: UITableViewCell & Reusable>(_ reusable: R.Type = R.self) {
        register(R.self, forCellReuseIdentifier: R.reusableIdentifier)
    }
    
    func dequeue<R: UITableViewCell & Reusable>(_ reusable: R.Type = R.self, indexPath: IndexPath) -> R {
        guard let cell = dequeueReusableCell(withIdentifier: R.reusableIdentifier, for: indexPath) as? R else {
            fatalError("Cell is not registered - call tableView.register(Cell.Type) to register first before using.")
        }
        return cell
    }
    
}

extension UICollectionView {
    
    func register<R: UICollectionViewCell & Reusable>(_ reusable: R.Type = R.self) {
        register(R.self, forCellWithReuseIdentifier: R.reusableIdentifier)
    }
    
    func dequeue<R: UICollectionViewCell & Reusable>(_ reusable: R.Type = R.self, indexPath: IndexPath) -> R {
        guard let cell = dequeueReusableCell(withReuseIdentifier: R.reusableIdentifier, for: indexPath) as? R else {
            fatalError("Cell is not registered - call tableView.register(Cell.Type) to register first before using.")
        }
        return cell
    }
    
}
