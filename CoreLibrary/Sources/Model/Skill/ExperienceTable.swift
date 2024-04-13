//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

public enum ExperienceTable {
    
    private static let fixed: [Int: Int] = [
        2: 10,
        3: 25,
        4: 45,
        5: 70,
        6: 100,
        7: 140,
        8: 200,
        9: 280,
        10: 380,
        11: 500,
        12: 650,
        13: 850,
        14: 1100,
        15: 1400,
        16: 1800,
        17: 2300,
        18: 2900,
        19: 3600,
        20: 4400,
        21: 5400,
        22: 6800,
        23: 8400,
        24: 10200,
        25: 12500,
        26: 17500,
        27: 25000,
        28: 35000,
        29: 50000,
        30: 75000,
    ]
    
    public static func xp(level: Int) -> Int {
        return fixed[level]!
    }
    
}
