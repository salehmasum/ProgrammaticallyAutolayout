//
//  ViewController.swift
//  ProgAuto
//
//  Created by user on 23/6/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

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
    textView.text = "Join us today in our fun and games !"
    textView.font = UIFont.boldSystemFont(ofSize: 18)
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment    = .center
    textView.isEditable       = false
    textView.isScrollEnabled  = false
    return textView
  }()
  
  let detailDescriptionTextView: UITextView = {
    let textView   = UITextView()
    textView.text  = "Programmatically autolayout is the best thing of autolayout. Now I am thinking why I never tried doing things this way. Now I am planning, I will do every video that involves this topic. Custom control, UIKit customization and programmatically autolayout is my current most important target"
    textView.font = UIFont.systemFont(ofSize: 14)
    textView.textAlignment = .center
    textView.isEditable    = false
    textView.isScrollEnabled = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //here its our entry point to add
    view.addSubview(roseImageView)
    view.addSubview(descriptionTextView)
    view.addSubview(detailDescriptionTextView)
    
    setupLayout()
    
  }

  private func setupLayout() {
    roseImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive   = true
    roseImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    roseImageView.widthAnchor.constraint(equalToConstant: 150).isActive                 = true
    roseImageView.heightAnchor.constraint(equalToConstant: 150).isActive                = true
    
    descriptionTextView.topAnchor.constraint(equalTo: roseImageView.bottomAnchor, constant: 32).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 8).isActive = true
    descriptionTextView.heightAnchor.constraint(equalToConstant: 30).isActive                   = true
    
    detailDescriptionTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16).isActive = true
    detailDescriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
    detailDescriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 8).isActive = true
    detailDescriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive = true
    
  }
  

}

