//
//  EquipmentTableViewCell.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 14.12.2021.
//

import UIKit

class EquipmentTableViewCell: UITableViewCell {
    static let identifier = "EquipmentTableViewCell"
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
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
        contentView.addSubview(image)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
//        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        nameLabel.frame = CGRect(x: 10,
                                 y: 0,
                                 width: 100,
                                 height: contentView.frame.size.height)
        
        priceLabel.frame = CGRect(x: contentView.frame.size.width - 50,
                                 y: 0,
                                 width: 50,
                                 height: contentView.frame.size.height)
        
        image.heightAnchor.constraint(equalToConstant: contentView.frame.size.height).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configure(with equipment: Equipment) {
        nameLabel.text = equipment.name
        image.image = UIImage(named: "empty-image")
        priceLabel.text = String(equipment.price)
    }
}
