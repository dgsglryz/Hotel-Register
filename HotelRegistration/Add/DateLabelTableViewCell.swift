//
//  DatePickerTableViewCell.swift
//  HotelRegistration
//
//  Created by Helin Akın on 10.05.2023.
//

import UIKit

class DateLabelTableViewCell: UITableViewCell {
  
  let datePicker: UIDatePicker = {
    let dp = UIDatePicker()
    dp.datePickerMode = .date
    return dp
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(datePicker)
    datePicker.matchParent(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

