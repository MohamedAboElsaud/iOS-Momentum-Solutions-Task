//
//  Extentions.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 24/07/2025.
//

import Foundation

extension String{
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
