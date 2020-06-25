//
//  LocationView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

struct LocationView: View {

    let location: String
    
    var body: some View {
        Button(action: {} ) {
            HStack {
                Image(systemName: SFSymbols.mapAndPin)
                Text(location).fontWeight(.black)
            }
        }

    }
    
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: "Merton").padding()
            .previewLayout(.sizeThatFits)
    }
}
