//
//  AdminEquipmentViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import UIKit

class AdminEquipmentViewController: UIViewController {
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(addButtontapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        setUI()
    }
    
    func setBackground() {
        let background = UIImage(named: "admin-bg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setUI() {
        view.addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        view.addConstraint(NSLayoutConstraint(item: addButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func addButtontapped() {
        //todo
    }
}
