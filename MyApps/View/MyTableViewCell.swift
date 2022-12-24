//
//  MyTableViewCell.swift
//  MyApps
//
//  Created by Dinmukhamed on 23.12.2022.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    
    
    let myImageView = UIImageView()
    let loginLabel = UILabel()
    let passwordLabel = UILabel()
    let image = UIImage(named: "steam")
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
        self.backgroundColor = .cyan
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        
       
        
   
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = image
        contentView.addSubview(myImageView)
        myImageView.snp.makeConstraints{maker in
            maker.width.height.equalTo(64)
            maker.top.bottom.equalToSuperview().inset(3)
            maker.left.equalToSuperview().inset(50)
        }
        
        
        loginLabel.text = "Login:"
        self.addSubview(loginLabel)
        loginLabel.snp.makeConstraints{ maker in
            maker.left.equalTo(myImageView).inset(100)
            maker.top.equalToSuperview().inset(10)
        }
        passwordLabel.text = "Password:"
        self.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints{ maker in
            maker.left.equalTo(myImageView).inset(100)
            maker.top.equalTo(loginLabel).inset(30)
        }
       
        
        
        
        //        nameLabel.text = "Name"
        //        nameLabel.translatesAutoresizingMaskIntoConstraints = false
              

//        self.addSubview(nameLabel)
        
//
//        NSLayoutConstraint.activate([
//        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5),
//        nameLabel.widthAnchor.constraint (equalToConstant: self.frame.width / 2 - 10),
//        nameLabel.heightAnchor.constraint (equalToConstant: 25)
//        ])
//        NSLayoutConstraint.activate([
//        myImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//        myImageView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
//        myImageView.widthAnchor.constraint (equalToConstant: self.frame.width / 2 - 10),
//        myImageView.heightAnchor.constraint (equalToConstant: 25)
//        ])
        
    }
    
    
}
