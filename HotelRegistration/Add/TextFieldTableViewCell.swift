//
//  TextFieldTableViewCell.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
  
  let textField: UITextField = {
    let tf = UITextField()
    tf.font = UIFont.systemFont(ofSize: 16)
    return tf
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(textField)
    textField.matchParent(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
