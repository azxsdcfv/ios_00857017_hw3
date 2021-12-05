//
//  ContentView.swift
//  ios_00857017_hw3
//
//  Created by User14 on 2021/11/27.
//

import SwiftUI

struct ContentView: View {
    @State private var t : Bool = false
    @State private var s : Bool = false
    var body: some View {
        VStack{
            Form{
                Button(action: {self.t = true}, label: {
                    Text("紀錄")
                })
                .sheet(isPresented: $t, content: {
                    test()
                })
                Button(action: {self.s = true}, label: {
                    Text("心得")
                })
                .fullScreenCover(isPresented: $s, content: {
                    think(s: $s)
                })
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
