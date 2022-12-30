//
//  Created by Evhen Gruzinov on 24.11.2022.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable{
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .poppy, .seafoam, .sky, .tan, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple, .periwinkle, .teal: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
