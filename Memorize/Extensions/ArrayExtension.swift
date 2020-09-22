//
//  ArrayExtension.swift
//  Memorize
//
//  Created by Петр Тартынских  on 22.09.2020.
//  Copyright © 2020 Петр Тартынских . All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
}
