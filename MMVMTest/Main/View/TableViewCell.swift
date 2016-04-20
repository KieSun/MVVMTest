//
//  TableViewCell.swift
//  MMVMTest
//
//  Created by 俞诚恺 on 16/4/20.
//  Copyright © 2016年 com.edu-meta.student. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class TableViewCell: UITableViewCell {

    var iconImage: UIImageView?
    var titleLabel: UILabel?
    var sourceLabel: UILabel?
    var typeLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImage = UIImageView()
        addSubview(iconImage!)
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont.systemFontOfSize(14)
        titleLabel?.numberOfLines = 2
        addSubview(titleLabel!)
        
        sourceLabel = UILabel()
        sourceLabel?.font = UIFont.systemFontOfSize(12)
        addSubview(sourceLabel!)
        
        typeLabel = UILabel()
        typeLabel?.font = UIFont.systemFontOfSize(12)
        addSubview(typeLabel!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImage?.snp_makeConstraints(closure: { (make) in
            make.left.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(60)
        })
        
        titleLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo((iconImage?.snp_right)!).offset(8)
            make.top.equalTo(iconImage!)
        })
        
        sourceLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(titleLabel!)
            make.bottom.equalTo(iconImage!)
        })
        
        typeLabel?.snp_makeConstraints(closure: { (make) in
            make.bottom.equalTo(sourceLabel!)
            make.right.equalTo(-10)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        cell?.iconImage!.kf_setImageWithURL(NSURL(string: model.newsImage!)!)

        cell?.titleLabel!.text = model.newsTitle
        cell?.sourceLabel!.text = model.newsSource
        
        cell?.typeLabel!.text = model.newsTypeName
        
        return cell!
    }
}
