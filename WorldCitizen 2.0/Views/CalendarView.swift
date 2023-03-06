//
//  CalendarView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI


struct CalendarView: View {
    @State private var date = Date()

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        ScrollView {
            DatePicker(
                    "Start Date",
                    selection: $date
                  //  displayedComponents: [.date]
                )
               .datePickerStyle(.graphical)
            
            VStack {
                Text("Selected date and time: ")
                Text(dateFormatter.string(from: date))
                    .font(.title)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

