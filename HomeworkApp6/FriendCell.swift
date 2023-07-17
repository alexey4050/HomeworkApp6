//
//  FriendCell.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

import UIKit

final class FriendCell: UITableViewCell{
    
    var tap: ((String?, UIImage?) -> Void)?
    
    private var friendImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private var text: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = Theme.currentTheme.textColor
        return label
    }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 12
        return circle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellClick))
        addGestureRecognizer(recognizer)
        setupViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implimented")
    }
    
    func updateCell(model: Friend) {
        text.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        if let online = model.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .purple
            }
        }
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.friendImageView.image = UIImage(data: data)
                }
            }
        }
    }
    private func setupViews(){
        contentView.addSubview(friendImageView)
        contentView.addSubview(text)
        friendImageView.addSubview(onlineCircle)
        setupConstraints()
    }
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                                     friendImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor),
                                     friendImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                                     text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
                                     text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     onlineCircle.trailingAnchor.constraint(equalTo: friendImageView.trailingAnchor),
                                     onlineCircle.bottomAnchor.constraint(equalTo: friendImageView.bottomAnchor),
                                     onlineCircle.widthAnchor.constraint(equalToConstant: 10),
                                     onlineCircle.heightAnchor.constraint(equalToConstant: 10)
                                    ])
        
    }
                                                
    @objc private func cellClick(){
            tap?(text.text, friendImageView.image)
        }
}




