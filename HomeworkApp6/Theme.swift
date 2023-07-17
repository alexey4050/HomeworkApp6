//
//  Theme.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

import UIKit

enum AllAppTheme: String {
    case white
    case blue
    case green
}

protocol AppTheme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var subtitleTextColor: UIColor { get }
    var type: AllAppTheme { get }
    
    }

extension AppTheme {
    var subtitleTextColor: UIColor {
        .gray
    }
}

final class Theme {
    
    static var currentTheme: AppTheme = WhiteTheme()
}
    
    
final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var type: AllAppTheme = .white
}
    
final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 255, alpha: 1)
    var textColor: UIColor = .brown
    var type: AllAppTheme = .blue
}
    
final class GreenTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 206/255, green: 1,blue: 162/255, alpha: 1)
    var textColor: UIColor = .brown
    var type: AllAppTheme = .green
    }

