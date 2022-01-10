//
//  InstrumentTableViewCell.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 10.01.2022.
//

import UIKit

class InstrumentTableViewCell: UITableViewCell {
    static let identifier = "InstrumentTableViewCell"
    
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
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(deleteButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
          
        nameLabel.frame = CGRect(x: 30,
                                 y: 20,
                                 width: 300,
                                 height: contentView.frame.size.height/2)
        
        
        descriptionLabel.frame = CGRect(x: 30,
                                 y: 40,
                                 width: 300,
                                 height: contentView.frame.size.height/2)
        
        
        deleteButton.heightAnchor.constraint(equalToConstant: contentView.frame.size.height).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with instrument: InstrumentModel) {
        nameLabel.text = instrument.name
        descriptionLabel.text = instrument.description
    }
}

