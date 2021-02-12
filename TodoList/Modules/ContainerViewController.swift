//
//  ContainerViewController.swift
//  TodoList
//
//  Created by Denis Selivanov on 12.02.2021.
//

import UIKit

class ContainerViewController: UIViewController {

    var menuContoller: UIViewController!
    var centerContoller: UIViewController!
    var isExpandedMenu = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHomeController()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func configureHomeController() {
        let homeController = HomeViewController()
        homeController.delegate = self
        centerContoller = UINavigationController(rootViewController: homeController)

        view.addSubview(centerContoller.view)
        addChild(centerContoller)
        centerContoller.didMove(toParent: self)
    }

    func configureMenuContoller() {
        if menuContoller == nil {
            menuContoller = MenuViewController()
            menuContoller.view.frame.size.height = self.view.frame.size.height
            view.insertSubview(menuContoller.view, at: 0)
            addChild(menuContoller)
            menuContoller.didMove(toParent: self)

            print("Tapped")
//            print(menuContoller.view.frame.height)
//            print(centerContoller.view.frame.height)
//            print(menuContoller.view.frame.width)
//            print(centerContoller.view.frame.width)
        }
    }

    func showMenuContoller(shouldExpand: Bool) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

                self.centerContoller.view.frame.origin.x = self.centerContoller.view.frame.width - 80

            }, completion: nil)
        } else {

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

                self.centerContoller.view.frame.origin.x = 0

            }, completion: nil)

        }

    }

}

extension ContainerViewController: HomeContollerDelegate {

    func handleMenuToggle() {
        configureMenuContoller()
        isExpandedMenu = !isExpandedMenu
        showMenuContoller(shouldExpand: isExpandedMenu)
    }
}
