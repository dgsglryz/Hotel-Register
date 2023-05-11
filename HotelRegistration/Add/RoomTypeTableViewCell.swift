//
//  RoomTypeTableViewCell.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit

class RoomTypeTableViewCell: UITableViewCell {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    accessoryType = .disclosureIndicator
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
