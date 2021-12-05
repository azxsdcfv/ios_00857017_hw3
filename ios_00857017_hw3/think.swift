//
//  think.swift
//  ios_00857017_hw3
//
//  Created by User14 on 2021/11/27.
//

import SwiftUI

struct think: View {
    @State private var message = ""
    @Binding var s:Bool
    @State private var value = 60
    let step = 1
    let range = 0...100
    @State private var bgColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    var body: some View {
        VStack{
            Form{
                Text("感想")
                TextEditor(text: $message)
                            .frame(height: 300)
                    .border(Color.black, width: 5)
                    .padding()
                ColorPicker("心情顏色", selection: $bgColor)
                    .background(bgColor)
                Button("返回"){
                    s=false
                }
            }
            Stepper(value: $value,
                            in: range,
                            step: step) {
                        Text("自我評分: \(value) in \(range.description) " +
                             "stepping by \(step)")
                    }
                        .padding(10)
        }
        if(s==false){
            test()
        }
    }
}

struct think_Previews: PreviewProvider {
    @State static var s : Bool = true
    static var previews: some View {
        think(s:$s)
    }
}
