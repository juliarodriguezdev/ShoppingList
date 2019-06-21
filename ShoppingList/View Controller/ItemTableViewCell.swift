//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by julia rodriguez on 6/21/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    var delegate: ItemTableViewCellDelegate?
    
    @IBOutlet weak var primaryLabel: UILabel!
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        let item = Item()
        ShoppingListController.sharedInstance.toggleIsComplete(item: item)
        delegate?.buttonCellButtonTapped(self)
        update(withItem: item)
    }
    
    func updateButton(_ isComplete: Bool) {
        switch isComplete {
            case true:
                completeButton.setImage(UIImage(named: "complete"), for: .normal)
            case false:
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}

extension ItemTableViewCell {
    
    func update(withItem item: Item) {
        primaryLabel.text = item.name
        updateButton(item.isComplete)
    }
}

protocol ItemTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ItemTableViewCell)
}
