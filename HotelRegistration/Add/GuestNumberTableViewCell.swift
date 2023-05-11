//
//  GuestNumberTableViewCell.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit

class GuestNumberTableViewCell: UITableViewCell {
  
  let label: UILabel = {
    let lb = UILabel()
    lb.font = .systemFont(ofSize: 16)
    return lb
  }()
  
  let numberLabel: UILabel = {
    let lb = UILabel()
    lb.text = "0"
    lb.font = .systemFont(ofSize: 16)
    return lb
  }()
  
  let stepper: UIStepper = {
    let stepper = UIStepper()
    stepper.value = 0
    return stepper
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    let hsv = HorizontalStackView(arrangedSubviews: [label, numberLabel, stepper], spacing: 8, alignment: .center, distribution: .fill)
    contentView.addSubview(hsv)
    hsv.matchParent(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
