//
//  NewsViewController.swift
//  Tnews
//
//  Created by sriram on 09/05/18.
//  Copyright © 2018 sriram. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    //UI code goes here

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getMeANewsCard()
        getMeANewsCard()
       addColorButton()
        addForwardAndBackwardButton()
        //getNewsCardFromURL()
        
    }
    
    var theme = Theme()
    var NewsCardArray = [UIView]()
    
    var currentTheme =  UIColor(red:0.56, green:0.07, blue:1.00, alpha:1.0) {
        didSet {
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
                self.forwardButton.backgroundColor = self.currentTheme
                self.backwardButton.backgroundColor = self.currentTheme
                self.navigationController?.navigationBar.barTintColor = self.currentTheme
                self.navigationController?.navigationBar.layoutIfNeeded()
                self.currentNewsCard.layer.borderColor = self.currentTheme.cgColor
                
            }, completion:nil)
            
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
    
    
    var currentNewsCard = UIView()
    
    var currentNewsCardYConstraint : NSLayoutConstraint?
    
    
    
    func getMeANewsCard() {
        
        
        let newsCard  : UIView = {
            let cnc = UIView()
            
            cnc.translatesAutoresizingMaskIntoConstraints = false
            cnc.layer.cornerRadius = 15
            cnc.layer.shadowColor = UIColor.gray.cgColor
            cnc.layer.shadowOpacity = 1
            cnc.layer.shadowOffset = CGSize.zero
            cnc.layer.shadowRadius = 15
            cnc.layer.borderColor = currentTheme.cgColor
            cnc.layer.borderWidth = 5
            
            return cnc
            
            
        }()
        
        self.currentNewsCard = newsCard
        
        let showImageView : UIImageView = {
            let siv = UIImageView()
            siv.translatesAutoresizingMaskIntoConstraints = false
            siv.image = UIImage(named: "car")
            siv.contentMode = .scaleAspectFill
            siv.clipsToBounds = true
            siv.layer.cornerRadius = 15
            
            return siv
        }()
        
        let containerView : UIView = {
            let cv = UIView()
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.backgroundColor = .white
            cv.clipsToBounds = true
            cv.layer.cornerRadius = 15
            return cv
        }()
        
        
        let headingLabel : UILabel = {
            let hl = UILabel()
            hl.translatesAutoresizingMaskIntoConstraints = false
            hl.text = "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet"
            //hl.layer.zPosition = 100
            hl.textColor = .black
            hl.lineBreakMode = NSLineBreakMode.byWordWrapping
            hl.numberOfLines = 0
            hl.font = hl.font.withSize(10)
            hl.sizeToFit()
            //hl.alpha = 0.2
            //hl.clipsToBounds = true
            //hl.layoutMargins = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 10)
            return hl
            
        }()
        
        let descriptionLabel : UILabel = {
            let dl = UILabel()
            dl.text = "Sed ut perspiciati Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet amet Lorem ipsum dolor sit amet"
            dl.numberOfLines = 0
            dl.font = dl.font.withSize(10)
            dl.lineBreakMode = NSLineBreakMode.byWordWrapping
            dl.translatesAutoresizingMaskIntoConstraints = false
            dl.sizeToFit()
            dl.alpha = 0.4
            return dl
        }()
        
        
        
        
        view.addSubview(newsCard)
        newsCard.addSubview(showImageView)
        newsCard.addSubview(containerView)
        containerView.addSubview(headingLabel)
        containerView.addSubview(descriptionLabel)
        
        newsCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        newsCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60).isActive = true
        newsCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let YConstant = UIScreen.main.bounds.size.height * 0.05
       currentNewsCardYConstraint = currentNewsCard.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -YConstant)
        currentNewsCardYConstraint?.isActive = true
        
        showImageView.topAnchor.constraint(equalTo: newsCard.topAnchor).isActive = true
        showImageView.leadingAnchor.constraint(equalTo: newsCard.leadingAnchor).isActive = true
        showImageView.widthAnchor.constraint(equalTo: newsCard.widthAnchor).isActive = true
        showImageView.heightAnchor.constraint(equalTo: newsCard.heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.widthAnchor.constraint(equalTo: newsCard.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: newsCard.heightAnchor, multiplier: 0.5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: newsCard.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: newsCard.bottomAnchor).isActive = true
        
        //headingLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        headingLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        headingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        headingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        //headingLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.4).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        
        NewsCardArray.append(currentNewsCard)
        
}

    
    let colorButton : UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.backgroundColor = .black
        cb.addTarget(self, action: #selector(colorButtonClicked), for: .touchUpInside)
        return cb
    }()
    
    let forwardButton : UIButton = {
        let fb = UIButton()
        fb.translatesAutoresizingMaskIntoConstraints = false
        fb.backgroundColor = UIColor(red:0.56, green:0.07, blue:1.00, alpha:1.0)
        fb.layer.shadowColor = UIColor.gray.cgColor
        fb.layer.shadowOpacity = 1
        fb.layer.shadowOffset = CGSize.zero
        fb.layer.shadowRadius = 15
        fb.addTarget(self, action: #selector(forwardButtonClicked), for: .touchUpInside)
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
    
    
    @objc func colorButtonClicked() {
        let colorButtonColor = colorButton.backgroundColor
        currentTheme = colorButtonColor!
        colorButton.backgroundColor = theme.giveNextColor()
        
    }
    
    @objc func forwardButtonClicked() {
        
    }
    
    
    func addColorButton() {
        view.addSubview(colorButton)
        colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        colorButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        colorButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
}
    
    
   
    
    
    
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
    
    // networking code
    
    
    
    private func getNewsCardFromURL() {
        let url = URL(string: "\(URLConstants.BaseURL)\(URLConstants.endPoints)?country=\(URLConstants.parameters.country)&apiKey=\(URLConstants.parameters.api_key)")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as AnyObject
                        if let articles = json["articles"] as? [AnyObject]  {
                            // do something here
                        }
                    }
                    catch {
                        print("couldnt serialize json")
                    }
                    
                }
            }else {
                print("something went wrong")
            }
            
            
        }
        
        task.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
}





    
























