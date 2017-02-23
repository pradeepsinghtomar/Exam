//
//  TextTableViewCell.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit

/*
 I've added seperate custom table view cell because If we want to have different functions or features with each type of cell, we can add those in the seperate class.
 */

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTextField: UITextField!
    @IBAction func selectDateAction(_ sender: UIButton) {
        // Display a date picker.
        self.showDatePickerView()
    }
    
    weak var tableView : UITableView?
    private var parentView : UIView? {
        didSet{
            let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(hideDatePickerView))
            tapGuesture.delegate = self
            parentView?.addGestureRecognizer(tapGuesture)
        }
    }
    private var datePicker : UIDatePicker?
    
    func showDatePickerView(){
        // add a parentView
        parentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        parentView?.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.2)

        // add Date Picker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.center = (parentView?.center)!
        parentView?.addSubview(datePicker!)

        tableView?.addSubview(parentView!)
    }
    
    func hideDatePickerView() {
        if let view = parentView {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeStyle = DateFormatter.Style.none
            dateTextField.text = dateFormatter.string(from: (datePicker?.date)!)
            view.removeFromSuperview()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
