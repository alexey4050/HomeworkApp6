//
//  ProfileViewController.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

import UIKit

final class ProfileViewController: UIViewController{
    private var networkService = NetworkService()
    private var profileImageView = UIImageView()
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = Theme.currentTheme.textColor
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var themeView = ThemeView()
    private var isUserProvile: Bool
    
    init(name: String? = nil, photo:UIImage? = nil,
         isUserProfile: Bool){
        self.isUserProvile = isUserProfile
        super.init(nibName: nil, bundle: nil)
        nameLabel.text = name
        profileImageView.image = photo
        themeView.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.textColor
        setupViews()
        if isUserProvile {
            networkService.getProfileInfo { [weak self] user in self?.updateData(model: user)
            }
        }else {
            themeView.isHidden = true
        }
    }
    func updateData(model: User?) {
        guard let model = model else { return }
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLabel.text = (model.firstName ?? "") + " " +
            (model.lastName ?? "")
        }
    }
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(themeView)
        setupConstraints()
    }
    private func setupConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        themeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
        
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50),
            
            themeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            themeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            themeView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            themeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -10)
        ])
    }
}

extension ProfileViewController: ThemeViewDalegate {
    func updateColor() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        nameLabel.textColor = Theme.currentTheme.textColor
    }
}

