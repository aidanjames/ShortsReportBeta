//
//  ShortsRatingView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 10/07/2020.
//

import SwiftUI

struct ShortsRatingView: View {
    var shortsRating: Int
    
    var body: some View {
        HStack {
            ForEach(1..<(shortsRating + 1), id: \.self) { _ in
                Images.shortsFill.resizable().scaledToFit()
            }
            ForEach(1..<(6 - shortsRating), id: \.self) { _ in
                Images.shortsNoFill.resizable().scaledToFit()
            }
        }.padding()
    }
}

struct ShortsRatingView_Previews: PreviewProvider {
    static var previews: some View {
        ShortsRatingView(shortsRating: 2)
    }
}
