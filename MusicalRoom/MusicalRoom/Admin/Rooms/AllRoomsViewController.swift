//
//  AllRoomsViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import UIKit

class AllRoomsViewController: UIViewController {

    var presenter: AllRoomsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AllRoomsPresenter(view: self)
//        setBackground()
        presenter?.loadRooms()
    }
    
    func setBackground(){
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
}
