//
//  CardView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct CardView: View {
    
    var item: Item = items[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:128)
                .frame(maxWidth: .infinity)
            Text(item.description)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.trailing)
                .opacity(0.7)
        }
        .padding(16)
        .frame(width: 252, height: 329)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.516, saturation: 0.394, brightness: 0.951, opacity: 0.661)/*@END_MENU_TOKEN@*/)
        .cornerRadius(30)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

