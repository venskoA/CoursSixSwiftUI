//
//  ColorForPiker.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 22.05.22.
//

import Foundation
import SwiftUI

// MARK: Two methods for add Identifiable

//struct ColorForPicker: Identifiable {
//    let id: UUID = UUID()
//
//
//    var nameColor: String
//    var color: Color
//}

struct ColorForPicker: Hashable, Identifiable {
    var id: Self {
        self
    }

    var nameColor: String
    var color: Color
}
