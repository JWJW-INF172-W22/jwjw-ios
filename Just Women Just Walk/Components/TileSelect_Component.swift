//
//  TileSelect_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

enum TileColor {
    case red
    case blue
    case purple
}

struct TileSelect_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var tileColor : TileColor
    @Binding var choices : [[String]]
    @Binding var selected : [String]
    @Binding var max : Int
    
    var unselectedColor : Color {
        switch tileColor {
        case .blue: return uiConstants.tileBlueUnselectedColor
        case .red: return uiConstants.tileRedUnselectedColor
        case .purple: return uiConstants.tilePurpleUnselectedColor
        }
    }
    
    var selectedColor : Color {
        switch tileColor {
        case .blue: return uiConstants.tileBlueSelectedColor
        case .red: return uiConstants.tileRedSelectedColor
        case .purple: return uiConstants.tilePurpleSelectedColor
        }

    }
    
    var selectedStrokeColor : Color {
        switch tileColor {
        case .blue: return uiConstants.tileBlueSelectedStrokeColor
        case .red: return uiConstants.tileRedSelectedStrokeColor
        case .purple: return uiConstants.tilePurpleSelectedStrokeColor
        }

    }
    
    
    var body: some View {
        VStack {
            ForEach (choices, id: \.self) { row in
                HStack {
                    ForEach (row, id: \.self) { text in
                        Button(action: {
                            if (selected.contains(text)) {
                                selected.remove(at: selected.firstIndex(of: text)!)
                            }
                            else if (max == 1 && selected.count > 0) {
                                selected.remove(at: 0)
                                selected.append(text)
                            }
                            else if (max == 0 || selected.count < max) {
                                selected.append(text)
                            }
                        },
                        label: {
                            Text(text)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 150, height: 150)
                                .background(RoundedRectangle(cornerRadius: 25)
                                                .stroke((selected.contains(text) ?
                                                            selectedStrokeColor :
                                                            unselectedColor),
                                                        lineWidth: 3)
                                                .background((selected.contains(text) ?
                                                                selectedColor :
                                                                unselectedColor))
                                                .frame(width: 150, height: 150)
                                                .cornerRadius(25))
                        })
                        .padding(5)
                    }
                }
            }
        }
    }
}

struct TileSelect_Component_Previews: PreviewProvider {
    static var previews: some View {
        TileSelect_Component(tileColor: .constant(.blue),
                             choices: .constant([["A", "B"], ["C", "D"]]),
                             selected: .constant(["B"]),
                             max: .constant(3))
            .environmentObject(UIConstants())
    }
}
