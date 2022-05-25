//
//  First.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 21.05.22.
//

import Foundation
import SwiftUI

struct ProcessingActivityView: View {
    @Binding var shared: Bool

    var body: some View {

        ZStack {
            Rectangle()
                .fill(.teal)
            VStack {
                Button {
                    shared = true
                } label: { Text("Shared")
                        .foregroundColor(.yellow)
                }

                // MARK: add activityView on screen

                .sheet(isPresented: $shared) {
                    ActivityView(activityItems: ["+375 44 539 58 87"])
                }

                Spacer().frame(height: 20)
            }
        }
    }
}

// MARK: work with UIKit

struct ActivityView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?

    func makeUIViewController(context: Context) -> UIActivityViewController {

        // MARK: add activityView

        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return vc
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
