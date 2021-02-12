//
//  HomeViewController.swift
//  TodoList
//
//  Created by Denis Selivanov on 12.02.2021.
//

import UIKit

protocol HomeContollerDelegate {
    func handleMenuToggle()
}

class HomeViewController: UIViewController {

    var delegate: HomeContollerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .white
        view.backgroundColor = .darkGray
        configureNavigationBar()
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: #selector(handleMenuToggle))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }

    @objc
    func handleMenuToggle() {
        delegate?.handleMenuToggle()
    }


}
