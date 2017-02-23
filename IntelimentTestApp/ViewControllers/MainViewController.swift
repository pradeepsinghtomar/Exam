//
//  MainViewController.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit

let totalRows = 5
let totalSections = 1

class MainViewController: UITableViewController {

    @IBOutlet weak var listTableView: UITableView! {
        didSet{
            // hide the empty cells.
            listTableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // tableview datasources
    override func numberOfSections(in tableView: UITableView) -> Int {
        return totalSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalRows
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == (totalRows - 1) {
            return 150.0
        }
        
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            let cell : MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifierType.PushViewCellIdentifier.rawValue, for: indexPath) as! MainTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case 1:
            let cell : ModalTableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifierType.ModalViewCellIdentifier.rawValue, for: indexPath) as! ModalTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case 2:
            let cell : BulbTableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifierType.BulbCellIdentifier.rawValue, for: indexPath) as! BulbTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case 3:
            let cell : TextTableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifierType.TextCellIdentifier.rawValue, for: indexPath) as! TextTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.tableView = self.tableView
            return cell
        case 4:
            let cell : StaticImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifierType.StaticImageCellIdentifier.rawValue, for: indexPath) as! StaticImageTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        default:
            let cell : UITableViewCell? = nil
            return cell!
            
        }
    }
    
    // tableview delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.performSegue(withIdentifier: ImageCollectionViewSegueIdentifier, sender: self)
        }
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.row == 1{
            self.performSegue(withIdentifier: UserInfoSegueIdentifier, sender: self)
        }
    }
}
