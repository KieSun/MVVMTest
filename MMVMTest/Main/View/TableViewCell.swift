//
//  TableViewCell.swift
//  MMVMTest
//
//  Created by 俞诚恺 on 16/4/20.
//  Copyright © 2016年 com.edu-meta.student. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func tableViewCell(tableView: UITableView, indexPath: NSIndexPath, model: cellModel) -> TableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? TableViewCell
        
        if cell == nil {
            cell = TableViewCell(style: .Default, reuseIdentifier: cellID)
        }
        
        print(model.newsTitle)
//        cell?.iconImage.kf_setImageWithURL(NSURL(string: model.newsImage!)!)
        
        if let title = model.newsTitle {
//            cell?.titleLabel.text = title
            cell?.textLabel?.text = title
        }
//        cell?.titleLabel.text = model.newsTitle
//        cell?.sourceLabel.text = model.newsSource
//        cell?.typeLabel.text = model.newsTypeName
        
        return cell!
    }
}
