//
//  MyTableViewCell.swift
//  MyApps
//
//  Created by Dinmukhamed on 23.12.2022.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    
    
    let image = UIImageView()
    let nameLabel = UILabel()
    let loginLabel = UILabel()
    let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
extension MyTableViewCell{
    private func initialize(){
        
        nameLabel.text = "Name"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
        nameLabel.widthAnchor.constraint (equalToConstant: self.frame.width / 2 - 10),
        nameLabel.heightAnchor.constraint (equalToConstant: 25)
        ])
    }
    
    
}
