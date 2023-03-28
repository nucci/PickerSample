//
//  ContentView.swift
//  PickerSample
//
//  Created by Gian Nucci on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedArray = [
        Times.texts
    ]

        var body: some View {
            CustomPicker(dataArrays: $selectedArray)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
