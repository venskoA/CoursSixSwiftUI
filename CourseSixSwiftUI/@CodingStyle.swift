//
//  @CodingStyle.swift
//  CourseSixSwiftUI
//
//  Created by Andrey Vensko on 4.06.22.
//

import Foundation
import SwiftUI

enum StyleForCoding {
    case camelCase
    case snakeCase
    case kebabCase
}

@propertyWrapper
struct CodingStyle {
    private var value: String = ""
    private var style: StyleForCoding

    public var wrappedValue: String {
        get {
            get()
        }
        set {}
    }

    init(wrappedValue: String, style: StyleForCoding) {
        self.style = style
        self.value = wrappedValue
    }

    private func get() -> String {
        switch style {
        case .camelCase:
            return camelCaseGet()
        case .snakeCase:
            return snakeCaseGet()
        case .kebabCase:
            return kebabCaseGet()
        }
    }

    var projectedValue: Binding<String> {
        .init {
            switch style {
            case .camelCase:
                return camelCaseGet()
            case .snakeCase:
                return snakeCaseGet()
            case .kebabCase:
                return kebabCaseGet()
            }
        } set: { str in }
    }

    func pritValue() {
        print(value)
    }
}

extension CodingStyle {
    func camelCaseGet() -> String {
        let newChar = value.map { char in
            return String(char).lowercased()
        }
        
        var string = String()
        var capitalLate = false

        for index2 in newChar {
            var inputValue = index2

            if capitalLate {
                inputValue = inputValue.uppercased()
                capitalLate = false
                string += inputValue
            } else {
                if inputValue == " " {
                    string += ""
                    capitalLate = true
                } else if inputValue == "." ||
                            inputValue == "-" ||
                            inputValue == "," {
                    string += ""
                } else {
                    string += inputValue
                }
            }
        }
        print("String: \(string)")
        return string
    }

    func snakeCaseGet() -> String {
        let newChar = value.map { char in
            return String(char).lowercased()
        }

        var string = String()
        var capitalLate = false

        for index2 in newChar {
            var inputValue = index2
            if capitalLate {
                inputValue = inputValue.uppercased()
                capitalLate = false
                string += inputValue
            } else {
                if inputValue == " " {
                    string += "_"
                    capitalLate = true
                } else if inputValue == "." ||
                            inputValue == "-" ||
                            inputValue == "," {
                    string += ""
                } else {
                    string += inputValue
                }
            }
        }
        print("String: \(string)")
        return string
    }

    func kebabCaseGet() -> String {
        let newChar = value.map { char in
            return String(char).lowercased()
        }

        var string = String()
        var capitalLate = false

        for index2 in newChar {
            var inputValue = index2

            if capitalLate {
                inputValue = inputValue.uppercased()
                capitalLate = false
                string += inputValue
            } else {
                if inputValue == " " {
                    string += "-"
                    capitalLate = true
                } else if inputValue == "." ||
                            inputValue == "-" ||
                            inputValue == "," {
                    string += ""
                } else {
                    string += inputValue
                }
            }
        }
        print("String: \(string)")
        return string
    }
}
