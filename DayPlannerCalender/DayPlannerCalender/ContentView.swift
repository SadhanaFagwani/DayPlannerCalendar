//
//  ContentView.swift
//  DayPlannerCalender
//
//  Created by Sadhana Fagwani  on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dayPlanner = DayPlanner()
    
    var body: some View {
        let week = ["Mon", "Tue", "wed", "Thu", "Fri", "Sat", "Sun"]
      let currentDate = Date()
        VStack {
        HStack {
            Text(dayPlanner.currentDate.monthYYYY())
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
            Image(systemName: "calendar")
            Image(systemName: "tray.fill")
            Image(systemName: "gear")
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .padding([.top, .leading, .trailing])
            
            GeometryReader { geo in
                    ScrollViewReader { proxy in
                        let datesArray = dayPlanner.dates()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(datesArray.indices, id:\.self) { i in
                               let d = datesArray[i]
                                    VStack {
                                        Text(d.weekDayAbbrev())
                                            .fontWeight(.ultraLight)
                                        Text(d.dayNum())
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        
                                    }
                                    .frame(width: geo.size.width / 8)
                                }
                            }
                        }
                        .onAppear {
                            if let pos = datesArray.firstIndex(of: dayPlanner.currentDate) {
                                proxy.scrollTo(pos, anchor: .center)
                            }
                        }
                    }
                }
            }
        }
    }




















#Preview {
    ContentView()
}
