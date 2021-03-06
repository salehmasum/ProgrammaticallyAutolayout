//
//  SwipingController.swift
//  ProgAuto
//
//  Created by user on 24/6/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  

  
  let pages = [
    Page(imageName: "appleRedSmall", headerText: "Join us today at our fun and games!", bodyText: "Are you ready for loads and loads fun? Don't wait any longer! We hope to see you in our stores soon"),
    Page(imageName: "appleRed", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the saving immediately when we announce them on our website, Make sure to also give us a feedback you have."),
    Page(imageName: "appleMixGreen", headerText: "VIP members special services", bodyText: ""),
    Page(imageName: "appleRedSmall", headerText: "Join us today at our fun and games!", bodyText: "Are you ready for loads and loads fun? Don't wait any longer! We hope to see you in our stores soon"),
    Page(imageName: "appleRed", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the saving immediately when we announce them on our website, Make sure to also give us a feedback you have."),
    Page(imageName: "appleMixGreen", headerText: "VIP members special services", bodyText: "")
  ]
  
  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
    return button
  }()
  
  @objc private func handlePrev() {
    print("Trying to advance to next")
    let nextIndex = max(pageControl.currentPage - 1, 0)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView?.scrollToItem(at: indexPath , at: .centeredHorizontally, animated: true)
  }
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    let pinkColor = UIColor.mainPink
    button.setTitleColor(pinkColor, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
    
    return button
  }()
  
  @objc private func handleNext() {
    print("Trying to advance to next")
    let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView?.scrollToItem(at: indexPath , at: .centeredHorizontally, animated: true)
  }
  
  lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.numberOfPages = pages.count
    pc.currentPage   = 0
    pc.currentPageIndicatorTintColor = .mainPink
    pc.pageIndicatorTintColor        = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    return pc
  }()
  
  fileprivate func setupButtonControls() {
    
    let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
    bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomControlStackView.distribution = .fillEqually
    view.addSubview(bottomControlStackView)
    
    NSLayoutConstraint.activate([
      bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
      ])
    
  }
  
  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = targetContentOffset.pointee.x
    pageControl.currentPage = Int(x / view.frame.width)
    print(x, view.frame.width, x/view.frame.width)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupButtonControls()
    collectionView?.backgroundColor = .white
    
    collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    collectionView?.isPagingEnabled = true
  }
  
  
}

