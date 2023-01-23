//
//  CustomPickerVIew.swift
//  CustomDatePicker
//
//  Created by Yuriy Pashkov on 23.01.2023.
//

import Foundation
import SwiftUI

struct TimeEditPicker: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int

    var body: some View {
        HStack(spacing: 4) {
            Spacer()
            Picker("Hour", selection: self.$selectedHour) {
                ForEach(8..<19) {
                    Text(String($0)).tag($0)
                }
            }
            .labelsHidden()
            .fixedSize(horizontal: true, vertical: true)
            .frame(width: 50, height: 50)
            .clipped()
            .background(.green)
            
            Picker("Minute", selection: self.$selectedMinute) {
                ForEach(0..<5) {
                    Text(String($0*15)).tag($0)
                }
            }
            .labelsHidden()
            .fixedSize(horizontal: true, vertical: true)
            .frame(width: 50, height: 50)
            .clipped()
            .background(.orange)
            
            Spacer()
        }
    }
}
