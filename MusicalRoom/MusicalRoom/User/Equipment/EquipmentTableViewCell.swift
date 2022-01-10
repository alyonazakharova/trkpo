//
//  EquipmentTableViewCell.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 14.12.2021.
//

import UIKit

class EquipmentTableViewCell: UITableViewCell {
    static let identifier = "EquipmentTableViewCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.frame = CGRect(x: 30,
                                 y: 20,
                                 width: 100,
                                 height: contentView.frame.size.height/2)
        
        descriptionLabel.frame = CGRect(x: 30,
                                 y: 40,
                                 width: 100,
                                 height: contentView.frame.size.height/2)
        
        priceLabel.frame = CGRect(x: contentView.frame.size.width - 80,
                                 y: 0,
                                 width: 60,
                                 height: contentView.frame.size.height)
    }
    
    func configure(with equipment: Equipment) {
        nameLabel.text = equipment.name
        descriptionLabel.text = equipment.description
        priceLabel.text = "\(equipment.price)$"
    }
}
