//
//  HomeViewController.swift
//  Deer Diary
//
//  Created by Clara Hung on 7/29/20.
//  Copyright © 2020 jenny and clara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let transition = SlideinTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Charter-Bold", size: 17)!]
        
        UINavigationBar.appearance().titleTextAttributes = attributes

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        print("test")
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in print(menuType)
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title


    
        
        
        topView?.removeFromSuperview()
        switch menuType {
        case .myWorld:
            /*let myWorldVC = MyWorldViewController()
            view.addSubview(myWorldVC.view)
            self.topView = myWorldVC.view
            addChild(myWorldVC)*/
            let view = UIView()
            self.performSegue(withIdentifier: "goToMyWorld", sender: self)
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.view.backgroundColor = UIColor(displayP3Red: 171/255, green: 164/255, blue: 152/255, alpha: 1)
        case .theWorld:
            let view = UIView()
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.view.backgroundColor = UIColor(displayP3Red: 171/255, green: 164/255, blue: 152/255, alpha: 1)
            self.performSegue(withIdentifier: "goToTheWorld", sender: self)
        case .settings:
            let view = UIView()
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.view.backgroundColor = UIColor(displayP3Red: 171/255, green: 164/255, blue: 152/255, alpha: 1)
        case .Profile:
            let view = UIView()
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.view.backgroundColor = UIColor(displayP3Red: 171/255, green: 164/255, blue: 152/255, alpha: 1)
        }
    }

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
