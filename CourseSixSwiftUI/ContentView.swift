//
//  ContentView.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 14.05.22.
//

import SwiftUI

struct ContentView: View {
    private var arrFriend = [Friend(firstName: "Andre", secondName: "Vensko", birthday: "28", avatar: "111")]

    @State private var valueSlider: Float = 0

    @State private var valueBoolOne = false
    @State private var valueBoolTwo: Bool = false
    @State private var valueBoolThree: Bool = false
    @State private var valueBoolFour: Bool = false
    @State private var valueToogle: Bool = false
    @State private var propertyForLabelOutput = "Output Data"

    @State private var valueTabView = 1

    @State private var valueMenu = false

    @State private var valuePicker: Int = 0

    private var colors: [ColorForPicker] = [ColorForPicker(nameColor: "mint", color: .mint),
                                   ColorForPicker(nameColor: "yellow", color: .yellow),
                                   ColorForPicker(nameColor: "green", color: .green)]

    //MARK: Pripery for player

    let nameSound: [String] = ["1", "2", "3", "4", "5",
                               "6", "7", "8", "9", "10",
                               "11", "12", "13", "14", "15"]
    let player = CastomPlayer()

    //MARK: property for shared

    @State var shared = false

    //MARK: ObservableObject

    @ObservedObject var userData = DataUser()

    // MARK: main view

    var body: some View {
        TabView(selection: $valueTabView) {
            addNavigation
                .tabItem {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("NavigDiffereElem")
                }
                .badge(34)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .tag(0)

            //MARK: New file (struct)

            VStack(alignment: .center) {
                First(shared: $shared)
                Second()
            }
            .tabItem {
                Image(systemName: "viewfinder")
                Text("ViewModifBuilder")
            }
            .tag(1)

            castomList
                .badge(Text("100 mes"))
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
                .tag(2)
        }
        .font(.title3)
        .tint(.teal)
        .accentColor(.yellow)
    }
}

// MARK: create view
private extension ContentView {

// MARK: List

    var castomList: some View {
        NavigationView {

            // MARK: Slider
            
            VStack {
                Slider(value: Binding(get: {
                    Double(valueSlider)
                }, set: { newValue in
                    valueSlider = Float(newValue)
                    player.setTime(time: Float(newValue))
                }), in: 0...player.maxDuration)
                    .padding(10)
                    .accentColor(.green)
                    .colorMultiply(.yellow)

                Button {
                    player.stop()
                } label: { Text("Stop") }
                .modifier(ImageViewModifier(color: .red, radius: 10))

                List(nameSound) { sound in
                    Section {
                        NavigationLink {
                            propertyItemCastom
                        } label: {
                            Text("Sound \(sound)")
                                .onTapGesture {
                                    player.play(sound)
                                }
                        }
                    }
                }
                .navigationBarHidden(true)
                .listStyle(.insetGrouped)
            }
        }
    }

    //MARK: Navigation

    var addNavigation: some View {
        NavigationView {
            VStack {

                //MARK: Form

                Form {

                    //MARK: Picker

                    Picker("Color", selection: $valuePicker) {
                        ForEach(0..<colors.count) {
                            Text("\(colors[$0].nameColor)")
                        }
                    }

                    // MARK: Segmented

                    Picker("Color", selection: $valuePicker) {
                        ForEach(0..<colors.count) {
                            Text("\(colors[$0].nameColor)")
                        }
                    }
                    .pickerStyle(.segmented)



                    //MARK: Toggle

                    Toggle(isOn: $valueToogle) {
                        Text("Elements Down")
                    }

                    //MARK: NavigationLink

                    NavigationLink {
                        ScrollView {
                            itemCastom(indexPath: arrFriend[0])
                            propertyItemCastom
                            ramdomButton
                        }
                    } label: {
                        Text("Start Date NavigationLink")
                    }

                }
                .frame(height: 150)

                //MARK: ScrollView

                ScrollView {
                    ZStack {

                        //MARK: Rectangle

                        Rectangle()
                            .fill(colors[valuePicker].color)
                            .offset(x: valueBoolOne ? 100 : 0)
                            .animation(.spring(response: 2, dampingFraction: 2, blendDuration: 2)  )
                        VStack {

                            //MARK: Group

                            Group {
                                HStack {
                                    NavigationLink {
                                        ViewForNavig(shared: $userData.sentence)
                                    } label: {
                                        Text("Start NavigationLink")
                                    }
                                    .padding(.all, 2)
                                    .offset(x: 0)
                                    .background(.red)

                                    Spacer()
                                        .frame(width: 10)

                                    Text("\(userData.sentence)")
                                }

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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .navigationBarItems(trailing: Button(action: {
                if valueMenu { valueMenu = false } else { valueMenu = true }
            }, label: {
                Text("Menu")
            })  )
            .navigationBarItems(trailing: Button(action: {
                if userData.sentence == "NewFromNavItems" {
                    userData.sentence = "Output Data"
                } else {
                    userData.sentence = "NewFromNavItems"
                }
            }, label: {
                Text("New")
            }))
            .animation(.linear(duration: 1))
            .offset(x: valueMenu ? -200 : 0)
        }

        //MARK: ObservableObject

        .environmentObject(userData)
    }

    func itemCastom(indexPath: Friend) -> some View {
        ZStack {
//            HStack(alignment: .top) {
            HStack {
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
            print("Print Button")
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
            .frame(width: 75, height: 75)
            .shadow(radius: 10)
            .cornerRadius(60)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String: Identifiable {
    public var id: Self {
        self
    }
}

//MARK: ObservableObject push value between View

class DataUser: ObservableObject {
    @Published var sentence: String = "Output Data"
}
