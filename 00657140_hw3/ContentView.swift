//
//  ContentView.swift
//  00657140_hw3
//
//  Created by User06 on 2019/11/12.
//  Copyright © 2019 User06. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isHappy = true
    @State private var selectedIndex = 0
    @State private var showTextareaPage = false
    var roles = ["emoji", "anime", "dog", "pepe"]
    let color = UIColor(red: 173/255, green: 222/255, blue: 195/255, alpha: 0.2)
    var body: some View {
        ZStack{
            
            Color.init(color)
            .edgesIgnoringSafeArea(.all)

        VStack{
            if isHappy{
                Image((roles[selectedIndex])+"happy")
                .resizable()
                .frame(width:100, height: 100)
                Text("\n今天的心情猶如晴天般的美麗！\n")
                    .font(.system(size: 21))
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            } else{
                Image((roles[selectedIndex])+"sad")
                .resizable()
                .frame(width:100, height: 100)
                Text("\n今天的心情下著雨，呈現灰濛濛的樣子，記得要打起精神啊。\n\n")
                    .font(.system(size: 21))
                    .foregroundColor(Color.gray)
                    .frame(width:330)
            }
            Button("寫下你所想說的話\n") {
               self.showTextareaPage = true
            }
                .sheet(isPresented: self.$showTextareaPage){
                Textarea()}
                .font(.system(size: 21))
                .foregroundColor(.purple)

            Toggle("今天開心嗎？", isOn: $isHappy)
                .frame(width:350)
            
            Picker(selection: $selectedIndex, label: Text("代表的表情角色")) {
                          Text(self.roles[0]).tag(0)
                          Text(self.roles[1]).tag(1)
                          Text(self.roles[2]).tag(2)
                          Text(self.roles[3]).tag(3)
            }
                .frame(width:398)
           }
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
