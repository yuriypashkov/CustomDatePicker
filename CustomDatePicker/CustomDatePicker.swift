//
//  MyDatePicker.swift
//  CustomDatePicker
//
//  Created by Yuriy Pashkov on 23.01.2023.
//

import Foundation
import SwiftUI

struct CustomDatePicker: UIViewRepresentable {

    @Binding var selection: Date
    let minuteInterval: Int

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<CustomDatePicker>) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged), for: .valueChanged)
        return picker
    }

    func updateUIView(_ picker: UIDatePicker, context: UIViewRepresentableContext<CustomDatePicker>) {
        picker.minuteInterval = minuteInterval
        picker.date = selection
        picker.datePickerMode = .time
        picker.locale = Locale(identifier: "ru_RU")
        
        let currentDateStartOfDay: Date = Calendar.current.startOfDay(for: Date())
        picker.minimumDate = Calendar.current.date(byAdding: .hour, value: 8, to: currentDateStartOfDay)
        picker.maximumDate = Calendar.current.date(byAdding: .hour, value: 18, to: currentDateStartOfDay)
    }

    class Coordinator {
        let datePicker: CustomDatePicker
        
        init(_ datePicker: CustomDatePicker) {
            self.datePicker = datePicker
        }

        @objc func dateChanged(_ sender: UIDatePicker) {
            datePicker.selection = sender.date
        }
    }
}

