//
//  ContentView.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 14.05.22.
//

import SwiftUI

struct Friend {
    var firstName: String
    var secondName: String
    var birthday: String
    var avatar: String
}

struct ContentView: View {
    var arrFriend = [Friend(firstName: "Andre", secondName: "Vensko", birthday: "28", avatar: "111")]

    var body: some View {
        VStack(alignment: .center) {
            itemCastom(indexPath: arrFriend[0])
            propertyItemCastom
            propetyItemCastomTwo

            ramdomButton
        }
    }
}

// MARK: create view
private extension ContentView {
    func itemCastom(indexPath: Friend) -> some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer(minLength: 5)
                Image(indexPath.avatar)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .shadow(radius: 20)
                    .cornerRadius(30)


                VStack {
                    Text("\(indexPath.firstName) \(indexPath.secondName)")
                    Text(indexPath.birthday)
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 10)
            }
        }
    }

    var propertyItemCastom: some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer(minLength: 5)
                Image(indexPath().avatar)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .shadow(radius: 20)
                    .modifier(ImageViewModifier(color: .green, radius: 20))


                VStack {
                    Text("\(indexPath().firstName) \(indexPath().secondName)")
                    Text(indexPath().birthday)
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 10)
            }
        }
    }

    var propetyItemCastomTwo: some View {
        ZStack {
            HStack(alignment: .top) {
                Spacer(minLength: 5)

                ImageViewBuilder {
                    Image(indexPath().avatar)
                }

                VStack {
                    Text("\(indexPath().firstName) \(indexPath().secondName)")
                    Text(indexPath().birthday)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                Spacer(minLength: 10)
            }
        }
    }

    func indexPath() -> Friend {
        arrFriend[0]
    }

    var ramdomButton: some View {
        Button {
            print("kkk")
        } label: {
            Text("Button")
        }
    }
}

// MARK: ViewModifier
struct ImageViewModifier: ViewModifier {
    let color: UIColor
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            .shadow(color: Color(color), radius: radius, x: 10, y: 10)
    }
}

// MARK: ViewBulder
struct ImageViewBuilder: View {
    var content: Image

    init(@ViewBuilder content: () -> Image ) {
        self.content = content()
    }

    var body: some View {
        content
            .resizable()
            .frame(width: 100, height: 100)
            .shadow(radius: 10)
            .cornerRadius(15)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
