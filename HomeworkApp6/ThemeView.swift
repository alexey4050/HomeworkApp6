//
//  ThemeView.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

import UIKit

protocol ThemeViewDalegate: AnyObject {
    func updateColor()
}

final class ThemeView: UIView {
    weak var delegate: ThemeViewDalegate?
    private var button1: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = WhiteTheme().backgroundColor
        return button
        
    }()
    private var button2: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = BlueTheme().backgroundColor
        return button
    }()
    private var button3: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = GreenTheme().backgroundColor
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Theme.currentTheme.backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        setupViews()
    }
    required init?(coder:NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    private func setupViews(){
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        setupConstraints()
    }
    private func setupConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button2.centerYAnchor.constraint(equalTo: centerYAnchor),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.leadingAnchor.constraint(equalTo: leadingAnchor),
            button2.trailingAnchor.constraint(equalTo: trailingAnchor),
            button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant:  -30),
            button1.centerXAnchor.constraint(equalTo: centerXAnchor),
            button1.leadingAnchor.constraint(equalTo: leadingAnchor),
            button1.trailingAnchor.constraint(equalTo: trailingAnchor),
            button3.topAnchor.constraint(equalTo: button2.topAnchor, constant: 30),
            button3.centerXAnchor.constraint(equalTo: centerXAnchor),
            button3.trailingAnchor.constraint(equalTo: trailingAnchor),
            button3.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
        
    }
private extension ThemeView {
    
    @objc func tap1() {
        Theme.currentTheme = WhiteTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
        ThemeSaver.putData()
    }
    
    @objc func tap2() {
        Theme.currentTheme = BlueTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
        ThemeSaver.putData()
    }
    @objc func tap3() {
        Theme.currentTheme = GreenTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
        ThemeSaver.putData()
        }
    }
