//
//  DateExtensions.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation


extension Date {
    
    
    init(string: String) {
        guard string != "" && string.count > 0 else {
            self = Date()
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        self = dateFormatter.date(from: string)!
    }
    
    func toDDMMYYY() -> String {
        return self.toFormat("dd/MM/yyyy")
    }
    
    func toFormat(_ format: String, locale: Locale = NSLocale(localeIdentifier: "pt_BR") as Locale) -> String {
        let currentDate = self
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        
        let convertedDate: String = dateFormatter.string(from: currentDate)
        return convertedDate
    }
    
}
