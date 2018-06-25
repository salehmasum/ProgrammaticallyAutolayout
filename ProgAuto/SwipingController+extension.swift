//
//  SwipingController+extension.swift
//  ProgAuto
//
//  Created by user on 25/6/18.
//  Copyright © 2018 SM. All rights reserved.
//

import UIKit

extension SwipingController {
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    
    coordinator.animate(alongsideTransition: { (_) in
      if self.pageControl.currentPage == 0 {
        self.collectionView?.contentOffset = .zero
      }else {
        self.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      }
      
    }) { (_) in
      
    }
  }
  
}
