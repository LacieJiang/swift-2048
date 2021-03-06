//
//  TileView.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. All rights reserved.
//

import UIKit

class TileView : UIView {
  var delegate: AppearanceProviderProtocol
  var value: Int = 0 {
  didSet {
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
  }
  var numberLabel: UILabel

  init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate: AppearanceProviderProtocol) {
    self.delegate = delegate
    numberLabel = UILabel(frame: CGRectMake(0, 0, width, width))
    numberLabel.textAlignment = NSTextAlignment.Center
    numberLabel.minimumScaleFactor = 0.5
    numberLabel.font = delegate.fontForNumbers()

    super.init(frame: CGRectMake(position.x, position.y, width, width))
    self.addSubview(numberLabel)
    self.layer.cornerRadius = radius

    self.value = value
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
}
