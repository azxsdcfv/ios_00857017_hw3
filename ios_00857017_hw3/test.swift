//
//  test.swift
//  ios_00857017_hw3
//
//  Created by User14 on 2021/11/27.
//

import SwiftUI

struct test: View {
    @State private var isRain = true
    @State private var  mood: Double = 50
    @State private var snackTime = Date()
    let work = ["累成狗了", "想辭職誒", "好輕鬆喔", "無敵的吧"]
    @State private var selectedIndex = 0
    @State private var name = ""
    var number = Int.random(in: 0...100)
    @State private var showAlert = false
    @State private var alertTitle = ""
    var body: some View {
        ScrollView {
            TextField("你的名字", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            DisclosureGroup("    date") {
                DatePicker("    日期", selection: $snackTime, in: ...Date(), displayedComponents: .date)
            }
            DisclosureGroup("    weather") {
                Image(isRain ? "bad" : "good")
                Text(isRain ? "🌧️" : "晴")
                    .offset(x: 10, y: 37)
                Toggle(isOn: $isRain) {
                    Text("有下雨嗎?")
                }
            }
            Text("mood:\(Int(mood))")
                    Slider(value: $mood, in: 0...100)
            Picker(selection: $selectedIndex, label: Text("工作")) {
                        Text(work[0]).tag(0)
                        Text(work[1]).tag(1)
                        Text(work[2]).tag(2)
                        Text(work[3]).tag(3)
            }
            Button(action: {
                    showAlert = true
                 }) {
                    VStack {
                       Text("今天還行嗎")
                    }
                 }.alert(isPresented:$showAlert) { () -> Alert in
                    let answer = ["不行", "簡單"].randomElement()!
                    return Alert(title: Text(answer))
                 }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
