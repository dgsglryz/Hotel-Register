//
//  DatePickerTableViewCell.swift
//  HotelRegistration
//
//  Created by Helin Akın on 11.05.2023.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
  
  let datePicker: UIDatePicker = {
    let datePicker = UIDatePicker()
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.preferredDatePickerStyle = .wheels
    return datePicker
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(datePicker)
    datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
    datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    datePicker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
