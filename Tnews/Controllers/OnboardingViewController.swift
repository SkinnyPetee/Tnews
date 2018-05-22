//
//  ViewController.swift
//  Tnews
//
//  Created by sriram on 27/04/18.
//  Copyright © 2018 sriram. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
   UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var PrevButton: UIButton!
    @IBOutlet weak var UIPageController: UIPageControl!
    @IBOutlet weak  var collectionView: UICollectionView!
    
    
    
    let pages : [Page] = {
       let firstPage = Page(imageName: "placeholder", message: "Read News From All Over The World")
        let secondPage = Page(imageName: "placeholder", message: "Local News Custom Tailored For You")
        let thirdPage = Page(imageName: "placeholder", message: "Let's Get Started")
        return [firstPage,secondPage,thirdPage]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = true
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    
        PrevButton.isHidden = true
        
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if pNumber == 2 {
            self.performSegue(withIdentifier: "NewsSegue", sender: self)
        }
        
        let indexPath = IndexPath(item: UIPageController.currentPage + 1, section: 0)
        if UIPageController.currentPage + 1 <= 2 {
            pNumber += 1
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            UIPageController.currentPage += 1
            setPrevButtonHidden()
        }
        
        
        
    }
    
    @IBAction func prevButtonTapped(_ sender: UIButton) {
        
        
        let indexPath = IndexPath(item: UIPageController.currentPage - 1, section: 0)
        if UIPageController.currentPage - 1 >= 0 {
            pNumber -= 1
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            UIPageController.currentPage -= 1
            setPrevButtonHidden()
        }
    }
    
    func setPrevButtonHidden() {
        if pNumber == 0 {
            PrevButton.isHidden = true
        }else {
            PrevButton.isHidden = false
        }
    }
    
    
    var pNumber = 0
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        pNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        setPrevButtonHidden()
        UIPageController.currentPage = pNumber
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCellCollectionViewCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  
    
    
}

