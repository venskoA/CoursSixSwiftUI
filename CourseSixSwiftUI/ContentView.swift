//
//  ContentView.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 14.05.22.
//

import SwiftUI
import Combine

struct ContentView: View {
    private let loginDef = "Admin"
    private let passwordDef = "1"

    let randonNumbers = Int.random(in: 0...100)

    @State private var login: String = ""
    @State private var password: String = ""
    @State private var shouldShowLogo: Bool = true
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false }
    ).removeDuplicates()

    var body: some View {

        ZStack {

            GeometryReader { geometry in
                Image("111")
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: 1000)
            }

            ScrollView {

                VStack {
                    Spacer(minLength: 150)

                    Text("VK")
                        .foregroundColor(.blue)
                        .font(.system(size: 60))
                        .font(.system(.largeTitle))
                        .padding(.top, 10)

                    Spacer(minLength: 180)

                    VStack {
                        HStack {
                            Text("Login:")
                                .foregroundColor(.white)
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 230)
                                .background(.gray)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        Spacer(minLength: 50)
                        HStack {
                            Text("Password:")
                                .foregroundColor(.white)
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 230)
                                .background(.gray)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    .frame(maxWidth: 350)

                    Spacer(minLength: 50)

                    Button {


                        if login == loginDef && password == passwordDef {
                            print("mkmkm")
                        }
                    } label: {
                        Text("Ok")
                            .colorMultiply(.black)
                    }
                    .padding()
                    .background(.blue)
                }
            }

            Spacer(minLength: 20)

        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:
                    nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 8")
            
        }
        
    }
}

@resultBuilder
struct MyFirstBuilder {
    static func buildBlock(_ components: Int...) -> [Int] {
        components.map { element in
            element * 2
        }
    }
}

extension Int {
    init(@MyFirstBuilder content: () -> Int) {
        self.init(content())
    }
}

