//
//  Flags.swift
//  Flags
//
//  Created by Лидия Некрасова on 23.03.2024.
//

import Foundation

struct Flags: Decodable {
    let flags: [String]
    
    static func getFlags() -> Flags {
        Flags(
            flags: ["🇺🇸", "🇬🇧", "🇯🇵", "🇷🇺", "🇨🇳"]
        )
    }
}
