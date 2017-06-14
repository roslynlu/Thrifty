//
//  StartingInfo.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation

struct userInfo {
    var income : Double
    var recurringExpenses : Double
    var savings : Double
    
    init() {
        income = 0
        recurringExpenses = 0
        savings = 0
    }
    
//    init(_ sourceUserMO: UserMO) {
//        self.income = sourceUserMO.income
//        self.recurringExpenses = sourceUserMO.recurringExpenses
//        self.savings = sourceUserMO.savings
//        
//    }
}
