//
//  ListView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct ListView: View {
    

    var countriesNames = ["Albania","Andorra","Austria","Belarus","Belgium","Bosnia","Bulgaria","Croatia","Cyprus","Czech Republic","Denmark","Estonia","Finland","France","Germany","Greece","Hungary","Iceland","Ireland","Italy","Kosovo","Latvia","Liechtenstein","Lithuania","Luxembourg","Malta","Moldova","Monaco","Montenegro","North Macedonia","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","The Netherlands","Turkey","Ukraine","United Kingdom","Vatican City"
    ]
    
    var flags = [ "Albania","Andorra","Austria","Belarus","Belgium","Bosnia","Bulgaria","Croatia","Cyprus","Czech Republic","Denmark","Estonia","Finland","France","Germany","Greece","Hungary","Iceland","Ireland","Italy","Kosovo","Latvia","Liechtenstein","Lithuania","Luxembourg","Malta","Moldova","Monaco","Montenegro","North Macedonia","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","The Netherlands","Turkey","Ukraine","United Kingdom","Vatican City"
    
    ]
    
    var body: some View {
   
        List (countriesNames.indices,id: \.self) { index in
           HStack {Image(self.flags[index])
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
                Text(self.countriesNames[index])
              }
            }
        }
    }



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
