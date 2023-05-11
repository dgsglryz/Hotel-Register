//
//  RoomTypeTableViewController.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit

protocol RoomTypeTableViewControllerDelegate {
  func select(roomType: RoomType)
}

class RoomTypeTableViewController: UITableViewController {
  let cellId = "RoomSelectCell"
  var roomType: RoomType?
  var delegate: RoomTypeTableViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(RoomSelectionTableViewCell.self, forCellReuseIdentifier: cellId)
  }
    
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return RoomType.all.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RoomSelectionTableViewCell
    let room = RoomType.all[indexPath.row]
    cell.textLabel?.text = room.name
    cell.detailTextLabel?.text = "$\(room.price)"
    if let roomType = roomType, roomType == room {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
      
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    roomType = RoomType.all[indexPath.row]
    tableView.reloadData()
    delegate?.select(roomType: roomType!)
  }
}
