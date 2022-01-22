//
//  ReservationTableViewCell.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {
    static let identifier = "ReservationTableViewCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let roomNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let confirmationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(dateLabel)
        contentView.addSubview(roomNameLabel)
        contentView.addSubview(confirmationLabel)
        contentView.addSubview(confirmButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
          
        dateLabel.frame = CGRect(x: 30,
                                 y: 10,
                                 width: 100,
                                 height: contentView.frame.size.height/3)
        
        roomNameLabel.frame = CGRect(x: 30,
                                 y: 35,
                                 width: 150,
                                 height: contentView.frame.size.height/3)
        
        confirmationLabel.frame = CGRect(x: 30,
                                 y: 60,
                                 width: 150,
                                 height: contentView.frame.size.height/3)
        
        confirmButton.heightAnchor.constraint(equalToConstant: contentView.frame.size.height).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        confirmButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        confirmButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with reservation: ReservationModel) {
        dateLabel.text = reservation.date
        roomNameLabel.text = reservation.room.name
        if (reservation.confirmed) {
            confirmationLabel.text = "Confirmed"
            confirmationLabel.textColor = .green
        } else {
            confirmationLabel.text = "Not confirmed"
            confirmationLabel.textColor = .red
        }
        
    }
}
