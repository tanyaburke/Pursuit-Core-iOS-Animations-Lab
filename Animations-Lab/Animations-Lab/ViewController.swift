//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 10
        return buttonStack
    }()
    
    lazy var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    
    lazy var downButton: UIButton = {
        let button = UIButton()
        button.setTitle("down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        view.backgroundColor = .systemGray
        
    }
    
    @IBAction func animateSquareRight(sender: UIButton){
        let oldOffset = blueSquareCenterXConstraint.constant
         if blueSquare.frame.origin.x > 200 {return}
        blueSquareCenterXConstraint.constant = oldOffset + 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func animateSquareLeft(sender: UIButton){
        let oldOffset = blueSquareCenterXConstraint.constant
         if blueSquare.frame.origin.x < 10 {return}
        blueSquareCenterXConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        if blueSquare.frame.origin.y < 100 {return}
        blueSquareCenterYConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
         if blueSquare.frame.origin.y > 500 {return}
        blueSquareCenterYConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    private func addSubviews() {
        view.addSubview(blueSquare)
                addStackViewSubviews()
        view.addSubview(buttonStackView)
    }
    
        private func addStackViewSubviews() {
            buttonStackView.addSubview(upButton)
            buttonStackView.addSubview(downButton)
            buttonStackView.addSubview(leftButton)
            buttonStackView.addSubview(rightButton)
        }
    
    private func configureConstraints() {
        constrainBlueSquare()
        constrainUpButton()
        constrainDownButton()
        constrainRightButton()
        constrainLeftButton()
        constrainButtonStackView()
        configureNavBar()
    }
    
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constrainRightButton(){
        rightButton.translatesAutoresizingMaskIntoConstraints = false
         rightButton.trailingAnchor.constraint(equalTo:  buttonStackView.centerXAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func constrainLeftButton(){
          leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.leadingAnchor.constraint(equalTo:  buttonStackView.centerXAnchor).isActive = true
//       leftButton.trailingAnchor.constraint(equalTo: upButton.trailingAnchor).isActive = true
          leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      }
    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
         
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    private func configureNavBar(){
    //set Title of navigation bar
           navigationItem.title = "Programmatic UI"
    
           //adding a UIBar Button Item on Navigation , can add one, or an array of tem
           //target- where looking for function
           //action is that function
           navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    //self = view controller
    }
    @objc
    private func showSettings(_ sender: UIBarButtonItem){
        //print("show settings")
        //segue to the SettingsViewController
        
        //this is how to do it using NavigationController
       let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    
    
    
}


