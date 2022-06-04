//
//  Second.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 22.05.22.
//

import Foundation
import SwiftUI

struct CastomTextView: View {

    // MARK: Castom Text View

    var body: some View {
        VStack(alignment: .leading) {
            Text("One. Work with TextView. This is very important sentance"
                    .uppercased()
//                    .lowercased()
            )
                .baselineOffset(-50)
                .font(.title)
                .kerning(10)
                .italic()
                .bold()
                .underline(true, color: .green)
                .strikethrough(true, color: .red)
                .padding(.all, 50)
                .multilineTextAlignment(.trailing)
                .background(.indigo)
                .foregroundColor(.red)
                .badge(3)
                .lineSpacing(10)

            Text("Two. Work with TextView".lowercased())
                .baselineOffset(40)
                .lineLimit(nil)
                .background(.yellow)
        }
    }
}
