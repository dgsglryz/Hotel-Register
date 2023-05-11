//
//  AddTableViewController.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit
protocol AddTableViewControllerDelegate {
  func add(registration: Registration)
}

class AddTableViewController: UITableViewController, RoomTypeTableViewControllerDelegate {
  
  let firstnameCell = TextFieldTableViewCell()
  let lastnameCell = TextFieldTableViewCell()
  let emailCell = TextFieldTableViewCell()
  
  let checkInDateCell = DatePickerTableViewCell()
  let checkOutDateCell = DatePickerTableViewCell()
  
  let adultsNumberCell = GuestNumberTableViewCell()
  let childrenNumberCell = GuestNumberTableViewCell()
  
  let wifiCell = WifiTableViewCell()
  
  let roomTypeCell = RoomTypeTableViewCell()
  var roomType: RoomType?
  var delegate: AddTableViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "New Guest Registration"
    view.backgroundColor = .white
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped(_:)))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped(_:)))
    
    adultsNumberCell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    childrenNumberCell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    
    checkInDateCell.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    checkOutDateCell.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    
    
  }
  
  @objc func stepperValueChanged(_ stepper: UIStepper) {
    let cell = stepper.superview?.superview?.superview as! GuestNumberTableViewCell
    if let labelText = cell.label.text {
      if labelText == "Adults" {
        adultsNumberCell.numberLabel.text = "\(Int(adultsNumberCell.stepper.value))"
      } else {
        childrenNumberCell.numberLabel.text = "\(Int(childrenNumberCell.stepper.value))"
      }
    }
  }
  
  @objc func cancelButtonTapped(_ sender: UIBarButtonItem) {
    print("cancel")
  }
  
  @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
    
    let firstname = firstnameCell.textField.text!
    let lastname = lastnameCell.textField.text!
    let email = emailCell.textField.text!
    let checkInDate = checkInDateCell.datePicker.date
    let checkOutDate = checkOutDateCell.datePicker.date
    let adults = Int(adultsNumberCell.numberLabel.text!)!
    let children = Int(childrenNumberCell.numberLabel.text!)!
    let wifi = wifiCell.wifiSwitch.isOn
    
    let registration = Registration(firstName: firstname, lastName: lastname, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: adults, numberOfChildren: children, roomType: roomType!, wifi: wifi)
    delegate?.add(registration: registration)
    dismiss(animated: true)
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 3
    case 1:
      return 2
    case 2:
      return 2
    case 3:
      return 1
    case 4:
      return 1
    case 5:
      return 1
    default:
      return 0
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch (indexPath) {
    case [0, 0]:
      firstnameCell.textField.placeholder = "First Name"
      return firstnameCell
    case [0, 1]:
      lastnameCell.textField.placeholder = "Last Name"
      return lastnameCell
    case [0, 2]:
      emailCell.textField.placeholder = "Email"
      return emailCell
    case [1, 0]:
      checkInDateCell.datePicker.minimumDate = Date()
      return checkInDateCell
    case [1, 1]:
      checkOutDateCell.datePicker.minimumDate = Date()
      return checkOutDateCell
    case [2, 0]:
      adultsNumberCell.label.text = "Adults"
      return adultsNumberCell
    case [2, 1]:
      childrenNumberCell.label.text = "Children"
      return childrenNumberCell
    case [3, 0]:
      return wifiCell
    case [4, 0]:
      roomTypeCell.textLabel?.text = "Room Type"
      roomTypeCell.detailTextLabel?.text = "Not Set"
      return roomTypeCell
    default:
      return UITableViewCell()
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44.0
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    if indexPath.section == 4 && indexPath.row == 0 {
      let roomTypeTVC = RoomTypeTableViewController()
      roomTypeTVC.delegate = self
      navigationController?.pushViewController(roomTypeTVC, animated: true)
    }
  }
  
  func select(roomType: RoomType) {
    self.roomType = roomType
    roomTypeCell.detailTextLabel?.text = "\(roomType.name)"
  }
  
  @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
      if datePicker == checkInDateCell.datePicker {
          // user changed check-in date
      } else if datePicker == checkOutDateCell.datePicker {
          // user changed check-out date
      }
  }

}
