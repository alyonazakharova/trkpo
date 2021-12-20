//
//  MainScreenViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Our company has been operating since 1994. Such stars as Alla Pugacheva, Philip Kirkorov and many others worked with us. Order your music room as soon as possible!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .infoLabelTextColor
        label.font =  UIFont(name: "WorkSans-Medium", size: 22)
        label.layer.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.1).cgColor
        label.layer.cornerRadius = 70
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let goToReserveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 25)
        button.setTitle("Go To Reserve", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self,action: #selector(goToReserveButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setUI()
    }
    
    func setBackground(){
        let background = UIImage(named: "main-screen-bg")
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
        view.addSubview(infoLabel)
        infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 260).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        view.addSubview(goToReserveButton)
        goToReserveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        view.addConstraint(NSLayoutConstraint(item: goToReserveButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        goToReserveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToReserveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func goToReserveButtonTapped() {
        let vc = ReserveViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
