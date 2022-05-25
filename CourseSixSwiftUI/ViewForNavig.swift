//
//  Second.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 22.05.22.
//

import Foundation
import SwiftUI

struct ViewForNavig: View {
    @Environment(\.presentationMode) var presentation

    @Binding var shared: String

    @State var selector: String?

    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Text("Destination \(shared)")
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Push on start view")
                }

                // MARK: Open new windiw with delay  on tag

                openWithDelay
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink {
                ViewForNavigTwo()
            } label: {
                Image(systemName: "plus.circle")
            })
    }
}

extension ViewForNavig {

    // MARK: Open new windiw with delay on tag

    var openWithDelay: some View {
        VStack {
            Spacer()
                .frame(height: 40)

            NavigationLink(tag: "first", selection: $selector) {
                NavigationLink {} label: {
                    ViewForNavigTwo()
                        .body
                        .background(.yellow)
                }
            } label: {
                EmptyView()
            }

            NavigationLink(tag: "second", selection: $selector) {
                NavigationLink {} label: {
                    ViewForNavigTwo()
                        .body
                        .background(.red)
                }
            } label: {
                EmptyView()
            }

            Button("Open with delay 2 sec") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    selector = "first"
                }
            }

            Button("Open with delay 4 sec") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    selector = "second"
                }
            }
        }
    }
}

struct ViewForNavigTwo: View {

    //MARK: ObservableObject

    @EnvironmentObject private var propertyBackValue: DataUser

    @State var propertyTexField = String()
    @Environment(\.presentationMode) var present

    var body: some View {

        VStack(spacing: 30) {
            Text(propertyTexField)
            TextField("Enter sentence", text: $propertyTexField)
                .background(.teal)
            Button {
                if propertyBackValue != nil {
                    propertyBackValue.sentence = propertyTexField
                }
                present.wrappedValue.dismiss()
            } label: {
                Text("Back")
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}



