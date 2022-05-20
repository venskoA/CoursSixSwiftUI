//
//  ContentView.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 14.05.22.
//

import SwiftUI
import UIKit

struct ColorForPicker {
    var nameColor: String
    var color: Color
}

struct ContentView: View {
    @State var valueBoolOne = false
    @State var valueBoolTwo: Bool = false
    @State var valueBoolThree: Bool = false
    @State var valueBoolFour: Bool = false
    @State var valueToogle: Bool = false

    @State var valuePicker: Int = 0
    var color: [ColorForPicker] = [ColorForPicker(nameColor: "mint", color: .mint),
                                   ColorForPicker(nameColor: "yellow", color: .yellow),
                                   ColorForPicker(nameColor: "green", color: .green)]

    var body: some View {

        //        NavigationView {
        //            NavigationLink {
        //                Cell()
        //            } label: {
        //                Text("Button")
        //            }
        //        }

        //MARK: NavigationView

        NavigationView {
            VStack {

                //MARK: Form

                Form {

                    //MARK: Picker

                    Picker("Color", selection: $valuePicker) {
                        ForEach(0..<color.count) {
                            Text("\(color[$0].nameColor)")
                        }
                    }

                    //MARK: Toggle

                    Toggle(isOn: $valueToogle) {
                        Text("Elements Down")
                    }

                    //                    Toggle("Elements Down", isOn: $valueToogle)
                    //                        .padding()
                    //                        .foregroundColor(.white)
                }
                .frame(height: 150)

                //MARK: ScrollView

                ScrollView {
                    ZStack {

                        //MARK: Rectangle

                        Rectangle()
                            .fill(color[valuePicker].color)
                            .offset(x: valueBoolOne ? 100 : 0)
                            .animation(SwiftUI.Animation.spring(response: 2, dampingFraction: 2, blendDuration: 2)  )
                        VStack {

                            //MARK: Group

                            Group {
                                Button {
                                    self.valueBoolOne = true
                                } label: {
                                    Text("Enter")
                                        .padding(.all, 5)
                                        .background(.green)
                                }

                                //MARK: Alert

                                .alert(isPresented: $valueBoolOne) {
                                    Alert(title: Text("Title"),
                                          message: Text("message"),
                                          primaryButton:
                                                .cancel(Text("Cancel")),
                                          secondaryButton: .default(Text("Ok"), action: {
                                        print("OOKK")
                                    }))
                                }

                                Button {
                                    self.valueBoolTwo = true
                                } label: {
                                    Text("EnterTwo")
                                        .padding()
                                        .background(.red)
                                }
                                .alert("EnterTwo", isPresented: $valueBoolTwo) {
                                    Button {
                                        print("OK")
                                    } label: {
                                        Text("OK")
                                    }

                                    Button {
                                        print("Cancel")
                                    } label: {
                                        Text("Cancel")
                                    }

                                    Button {
                                        print("Maibu")
                                    } label: {
                                        Text("Maibu")
                                    }
                                } message: {
                                    Text("Touch in button")
                                }

                                Button {
                                    self.valueBoolThree = true
                                } label: {
                                    Text("EnterThree")
                                        .padding()
                                        .background(.yellow)
                                }

                                //MARK: Sheet

                                .sheet(isPresented: $valueBoolThree) {
                                    print("DieButtonThree")
                                } content: {
                                    Text("Hellow Sheet")
                                    Button {
                                        print("TestButtonInSheet")
                                    } label: {
                                        Text("TestButtonInSheet")
                                    }

                                }

                                Button {
                                    self.valueBoolFour = true
                                } label: {
                                    Text("EnterThree")
                                        .padding()
                                        .background(.bar)
                                }

                                //MARK: ActionSheet

                                .actionSheet(isPresented: $valueBoolFour) {
                                    ActionSheet(title: Text("ActionSheet")
                                                    .foregroundColor(.red),
                                                message: Text("I build ActionSheet"),
                                                buttons: [.cancel(Text("cancel")),
                                                          .default(Text("Ok")
                                                                    .foregroundColor(.green),
                                                                   action: {
                                        print("Action in ActionSheet")
                                    })])
                                }
                            }
                            .cornerRadius(30)
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 50, x: 50, y: -30)
                            .cornerRadius(10)
                            .offset(y: valueToogle ? 50 : 0)

                            //MARK: Animation

                            .animation(.linear)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Navigation Title"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Cell: View {
    @State var value = false

    var body: some View {
        Text("ppppp")

        NavigationLink {
            Cell()
        } label: {
            Text("Button")
        }
    }
}
