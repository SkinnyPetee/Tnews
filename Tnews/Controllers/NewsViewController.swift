//
//  NewsViewController.swift
//  Tnews
//
//  Created by sriram on 09/05/18.
//  Copyright © 2018 sriram. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNewsCard()
        addColorButton()
        addForwardAndBackwardButton()
        
    }
    
    var theme = Theme()
    
    
    var currentTheme =  UIColor(red:0.56, green:0.07, blue:1.00, alpha:1.0) {
        didSet {
            forwardButton.backgroundColor = currentTheme
            backwardButton.backgroundColor = currentTheme
            navigationController?.navigationBar.barTintColor = currentTheme
            NewsCard.backgroundColor = currentTheme
        }
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colorButton.layer.cornerRadius = 0.5 * colorButton.bounds.size.width
        colorButton.layer.masksToBounds = true
        forwardButton.layer.cornerRadius = 0.5 * forwardButton.bounds.size.width
        //forwardButton.layer.masksToBounds = true
        backwardButton.layer.cornerRadius = 0.5 * backwardButton.bounds.size.width
        //backwardButton.layer.masksToBounds = true
    }
    
    
    var NewsCard = UIView()
    
    func addNewsCard() {
        
        let tempNewsCard  : UIView = {
            let nc = UIView()
            nc.backgroundColor =  currentTheme
            nc.translatesAutoresizingMaskIntoConstraints = false
            nc.layer.cornerRadius = 15
            nc.layer.shadowColor = UIColor.gray.cgColor
            nc.layer.shadowOpacity = 1
            nc.layer.shadowOffset = CGSize.zero
            nc.layer.shadowRadius = 15
            return nc
        }()
        
        NewsCard = tempNewsCard
        
        view.addSubview(NewsCard)
        NewsCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        NewsCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60).isActive = true
        NewsCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let YConstant = UIScreen.main.bounds.size.height * 0.05
        
        NewsCard.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -YConstant).isActive = true
    }

    
    let colorButton : UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.backgroundColor = .black
        cb.addTarget(self, action: #selector(colorButtonClicked), for: .touchUpInside)
        return cb
    }()
    
    
    @objc func colorButtonClicked() {
        let colorButtonColor = colorButton.backgroundColor
        currentTheme = colorButtonColor!
        colorButton.backgroundColor = theme.giveNextColor()
        
    }
    
    
    
    func addColorButton() {
        
        
        view.addSubview(colorButton)
        colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        colorButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        colorButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        
        
        
        
    }
    
    let forwardButton : UIButton = {
        let fb = UIButton()
        fb.translatesAutoresizingMaskIntoConstraints = false
        fb.backgroundColor = UIColor(red:0.56, green:0.07, blue:1.00, alpha:1.0)
        fb.layer.shadowColor = UIColor.gray.cgColor
        fb.layer.shadowOpacity = 1
        fb.layer.shadowOffset = CGSize.zero
        fb.layer.shadowRadius = 15
        return fb
    }()
   
    
    let backwardButton : UIButton = {
        let bb = UIButton()
        bb.translatesAutoresizingMaskIntoConstraints = false
        bb.backgroundColor = UIColor(red:0.56, green:0.07, blue:1.00, alpha:1.0)
        bb.layer.shadowColor = UIColor.gray.cgColor
        bb.layer.shadowOpacity = 1
        bb.layer.shadowOffset = CGSize.zero
        bb.layer.shadowRadius = 15
        return bb
    }()
    
    func addForwardAndBackwardButton() {
        
        
        view.addSubview(forwardButton)
        view.addSubview(backwardButton)
        let gapConstant = UIScreen.main.bounds.width * 0.17
        forwardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: gapConstant).isActive = true
        forwardButton.bottomAnchor.constraint(equalTo: colorButton.topAnchor, constant: -5).isActive = true
        forwardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        forwardButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        
        backwardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -gapConstant).isActive = true
        backwardButton.bottomAnchor.constraint(equalTo: colorButton.topAnchor, constant: -5).isActive = true
        backwardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        backwardButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        
        
    }
    
    
   
    
    
    
    
        
    
    
        
        
        
        
        
    
    
    

}
