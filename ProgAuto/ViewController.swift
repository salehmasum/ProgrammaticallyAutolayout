//
//  ViewController.swift
//  ProgAuto
//
//  Created by user on 23/6/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

extension UIColor {
  static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
  
  let roseImageView: UIImageView  = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "appleRedSmall"))
    //This enables Autolayout for our imageview
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let descriptionTextView: UITextView = {
    let textView  = UITextView()
    let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games !", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
    
    attributedText.append(NSAttributedString(string: "\n\n\nProgrammatically autolayout is the best thing of autolayout. Now I am thinking why I never tried doing things this way.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
    
    textView.attributedText = attributedText
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment    = .center
    textView.isEditable       = false
    textView.isScrollEnabled  = false
    return textView
  }()
  
  //apply correct encapsulation practices
  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("PREV", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("NEXT", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    let pinkColor = UIColor.mainPink
    button.setTitleColor(pinkColor, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.numberOfPages = 4
    pc.currentPage   = 0
    pc.currentPageIndicatorTintColor = .mainPink
    pc.pageIndicatorTintColor        = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    return pc
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //here its our entry point to add
   // view.addSubview(roseImageView)
    view.addSubview(descriptionTextView)
    
    setupButtonControls()
    setupLayout()
    
  }

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
  
  private func setupLayout() {
    
    let topImageContainerView = UIView()
    topImageContainerView.backgroundColor = .clear
    view.addSubview(topImageContainerView)
    
    //enable autolayout
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    topImageContainerView.addSubview(roseImageView)
    
    roseImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    roseImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    roseImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    
    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
    descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    
  }
  

}

