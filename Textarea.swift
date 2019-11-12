//
//  Textarea.swift
//  00657140_hw3
//
//  Created by User06 on 2019/11/12.
//  Copyright © 2019 User06. All rights reserved.
//

import SwiftUI

struct Textarea: View {
    @State private var mindTime = Date()
    @State private var num: CGFloat = 50
    @State private var textarea = ""
    @State private var showAlert = false
    let color = UIColor(red: 173/255, green: 222/255, blue: 195/255, alpha: 0.2)
    let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       return dateFormatter
    }()
    
    var body: some View {
    ZStack{
        Color.init(color)
            .edgesIgnoringSafeArea(.all)
       VStack {
        Text("今天是"+dateFormatter.string(from: mindTime))
        DatePicker("選擇今天的日期", selection: $mindTime,displayedComponents: .date)
            .frame(width:380)
        Text("今天的心情強烈指數是:\(Int(num))")
        Slider(value: $num, in: 1...100, step: 1)
            .accentColor(.orange)
            .frame(width:380)
        TextField("寫下你今天的心情小語....", text: $textarea) {
            self.showAlert = true
        }
        .frame(width:380,height:60)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.orange, lineWidth: 3))
        .alert(isPresented: $showAlert) { () -> Alert in
                let result: String
                result = "今天是\(dateFormatter.string(from: mindTime))\n心情強烈指數是:\(Int(num))\n心情語錄:\n\(self.textarea)"
                        
                return Alert(title: Text(result))
        }
        .padding()
        Spacer()
       }
    }
    }
}
struct Textarea_Previews: PreviewProvider {
    static var previews: some View {
        Textarea()
    }
}
