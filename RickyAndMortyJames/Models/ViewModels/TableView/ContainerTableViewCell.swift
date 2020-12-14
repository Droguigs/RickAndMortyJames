//
//  ContainerTableViewCell.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 14/12/20.
//

import UIKit

public class ContainerTableViewCell: UITableViewCell, Reusable {
    var wrappedContentView: UIView?
    public override func prepareForReuse() {
        super.prepareForReuse()
        wrappedContentView?.removeFromSuperview()
        wrappedContentView = nil
        self.backgroundColor = .clear
        self.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    public func addContent(_ content: UIView, insets: UIEdgeInsets) {
        content.translatesAutoresizingMaskIntoConstraints = false
        wrappedContentView = content
        addSubview(contentView)
        contentView.addSubview(content)
        content.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}


