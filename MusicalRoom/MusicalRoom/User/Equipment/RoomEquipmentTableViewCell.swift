//
//  RoomEquipmentTableViewCell.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.02.2022.
//

import UIKit

class RoomEquipmentTableViewCell : UITableViewCell {
    static let identifier = "RoomEquipmentTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
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
    }
    
    func configure(with instrument: InstrumentModel) {
        nameLabel.text = instrument.name
        descriptionLabel.text = instrument.description
    }
}
