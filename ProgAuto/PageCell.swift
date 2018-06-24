//
//  PageCell.swift
//  ProgAuto
//
//  Created by user on 24/6/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
  
  var page: Page? {
    didSet {
      
      guard let unwrappedPage = page else { return }
      
      let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
      
      attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
      
      roseImageView.image = UIImage(named: unwrappedPage.imageName)
      descriptionTextView.attributedText = attributedText
      descriptionTextView.textAlignment  = .center
    }
  }
  
  private let descriptionTextView: UITextView = {
    let textView  = UITextView()
  
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment    = .center
    textView.isEditable       = false
    textView.isScrollEnabled  = false
    return textView
  }()
  
  private let roseImageView: UIImageView  = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "appleRedSmall"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupLayout()
    
  }
  
  
  private func setupLayout() {
    
    let topImageContainerView = UIView()
    topImageContainerView.backgroundColor = .clear
    addSubview(topImageContainerView)
    
    //enable autolayout
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    topImageContainerView.addSubview(roseImageView)
    
    roseImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    roseImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    roseImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    
    addSubview(descriptionTextView)
    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
    descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

