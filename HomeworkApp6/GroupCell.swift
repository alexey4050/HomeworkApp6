//
//  GroupCell.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

import UIKit

final class GroupCell: UITableViewCell {
    
    private var groupImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private var title: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = Theme.currentTheme.textColor
        return label
    }()
    
    private var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = Theme.currentTheme.textColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(model: Group) {
        title.text = model.name
        subtitle.text = model.description
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.groupImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews(){
        contentView.addSubview(groupImageView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     groupImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                                     groupImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor),
                                     groupImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                                     title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
                                     title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                                     title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     subtitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
                                     subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
                                     subtitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                                     subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
    }
}
    





