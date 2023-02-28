//
//  UIView+LoadNib.swift
//  VKApp
//
//  Created by Олеся Бабич on 27.2.23..
//

import UIKit

public extension UIView {
  func initializeFromNib() {
    let nibName = String(describing: Self.self)
    let bundle = Bundle(for: Self.self)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    addSubview(view)
    view.frame = bounds
  }
}
