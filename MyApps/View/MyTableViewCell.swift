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
    let stackView = UIStackView()
    let someView = UIView()
    
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
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        someView.layer.cornerRadius = self.frame.height / 2
//        someView.layer.masksToBounds = false
//        someView.layer.shadowRadius = 3
//        someView.layer.shadowOpacity = 0.5
//        someView.layer.shadowColor = UIColor.purple.cgColor
//        someView.layer.shadowPath = UIBezierPath(roundedRect: someView.bounds, cornerRadius: (someView.frame.height / 2)).cgPath
//    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        someView.layer.cornerRadius = self.frame.height / 2
        someView.layer.masksToBounds = false
        someView.layer.shadowRadius = 3
        someView.layer.shadowOpacity = 0.5
        someView.layer.shadowColor = UIColor.purple.cgColor
        someView.layer.shadowPath = UIBezierPath(roundedRect: someView.bounds, cornerRadius: (someView.frame.height / 2)).cgPath
    }
    private func initialize(){
        

        contentView.addSubview(someView)
        someView.backgroundColor = .white
        someView.snp.makeConstraints{ maker in
            maker.top.bottom.equalTo(contentView).inset(5)
            maker.right.left.equalTo(contentView).inset(30)
        }
        
        myImageView.contentMode = .scaleAspectFill
        someView.addSubview(myImageView)
        myImageView.snp.makeConstraints{maker in
            maker.width.height.equalTo(60)
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
            maker.top.equalTo(loginLabel).inset(25)
        }
    }
    func setImage(name: String)-> UIImage{
        let image = UIImage(named: name)
        return image!
    }
   
    
    
}
