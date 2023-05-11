//
//  RegistrationTableViewController.swift
//  HotelRegistration
//
//  Created by Derrick Park on 2023-05-10.
//

import UIKit

class RegistrationTableViewController: UITableViewController, AddTableViewControllerDelegate {
  let cellId = "RegistrationCell"
  
  var registrations = [Registration]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Registrations"
    tableView.register(RegistrationTableViewCell.self, forCellReuseIdentifier: cellId)
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewRegistration(_:)))
  }
  
  func add(registration: Registration) {
    registrations.append(registration)
    tableView.insertRows(at: [IndexPath(row: registrations.count - 1, section: 0)], with: .automatic)
  }
  
  @objc func addNewRegistration(_ sender: UIBarButtonItem) {
    let addTVC = AddTableViewController(style: .grouped)
    addTVC.delegate = self
    present(UINavigationController(rootViewController: addTVC), animated: true) // present modally
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return registrations.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RegistrationTableViewCell
    let registration = registrations[indexPath.row]
    cell.textLabel?.text = "\(registration.firstName) \(registration.lastName)"
    cell.detailTextLabel?.text = "\(registration.checkInDate) - \(registration.checkOutDate)"
    return cell
  }
}
