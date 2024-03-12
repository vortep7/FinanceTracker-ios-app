//
//  CollectionViewCell.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 12.03.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var reason: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        return reason
    }()
    
    var amount: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        return reason
    }()
    
    var date: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        return reason
    }()
    
    func setupTableCell() {
        reason.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(reason)
        self.contentView.addSubview(amount)
        self.contentView.addSubview(date)

        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            reason.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            reason.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            amount.topAnchor.constraint(equalTo:reason.bottomAnchor),
            amount.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            amount.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8),
            
            date.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 10),
            date.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 30),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            date.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8)])

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

