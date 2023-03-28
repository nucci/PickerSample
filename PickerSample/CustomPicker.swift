//
//  CustomPicker.swift
//  PickerSample
//
//  Created by Gian Nucci on 28/03/23.
//

import SwiftUI
import UIKit

struct CustomPicker: UIViewRepresentable {
    @Binding var dataArrays : [[String]]

    //makeCoordinator()
    func makeCoordinator() -> CustomPicker.Coordinator {
        return CustomPicker.Coordinator(self)
    }

    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }

    //updateUIView(_:context:)
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<CustomPicker>) {
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: CustomPicker
        init(_ pickerView: CustomPicker) {
            self.parent = pickerView
        }

        //Number Of Components:
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return parent.dataArrays.count
        }

        //Number Of Rows In Component:
        func pickerView(_ pickerView: UIPickerView,
                        numberOfRowsInComponent component: Int) -> Int {
            return parent.dataArrays[component].count
        }

        //Width for component:
        func pickerView(_ pickerView: UIPickerView,
                        widthForComponent component: Int) -> CGFloat {
            return UIScreen.main.bounds.width/3
        }

        //Row height:
        func pickerView(_ pickerView: UIPickerView,
                        rowHeightForComponent component: Int) -> CGFloat {
            return 60
        }

        //View for Row
        func pickerView(_ pickerView: UIPickerView,
                        viewForRow row: Int,
                        forComponent component: Int,
                        reusing view: UIView?) -> UIView {
            pickerView.subviews.first?.backgroundColor = .clear
            let pickerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width/3, height: 80))
            pickerLabel.backgroundColor = .clear
            pickerLabel.textColor = .darkGray

            pickerLabel.text = parent.dataArrays[component][row]
            pickerLabel.font = UIFont.systemFont(ofSize: 60, weight: .black)
            pickerLabel.adjustsFontSizeToFitWidth = true
            pickerLabel.textAlignment = .right
            pickerLabel.lineBreakMode = .byWordWrapping
            pickerLabel.numberOfLines = 1
           
            return pickerLabel
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            guard let label = pickerView.view(forRow: row, forComponent: component) as? UILabel else { return }

            label.textColor = .black
        }
    }
}
