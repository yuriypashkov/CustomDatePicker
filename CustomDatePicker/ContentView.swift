//
//  ContentView.swift
//  CustomDatePicker
//
//  Created by Yuriy Pashkov on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var value: Date = Date()
    @State var minterval: Int = 15
    
    @State var hour: Int = 8
    @State var minute: Int = 15

    var body: some View {
        VStack(alignment: .center) {
            CustomDatePicker(selection: $value, minuteInterval: minterval)
                .frame(width: 80, height: 40, alignment: .center)
            Text("\(value.formatted(.dateTime.hour().minute()))")
            Divider()
            CustomPickerView(selectedHour: $hour, selectedMinute: $minute)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
