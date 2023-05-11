//
//  WifiTableViewCell.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit

class WifiTableViewCell: UITableViewCell {
  let label: UILabel = {
    let lb = UILabel()
    lb.text = "Wi-Fi"
    lb.font = .systemFont(ofSize: 16)
    return lb
  }()
  
  let wifiPriceLabel: UILabel = {
    let lb = UILabel()
    lb.text = "$10 per day"
    lb.font = .systemFont(ofSize: 16)
    return lb
  }()
  
  let wifiSwitch: UISwitch = {
    let s = UISwitch()
    s.isOn = false
    return s
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    let hsv = HorizontalStackView(arrangedSubviews: [label, wifiPriceLabel, wifiSwitch], spacing: 8, alignment: .center, distribution: .fill)
    contentView.addSubview(hsv)
    hsv.matchParent(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
