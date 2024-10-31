//
//  StatusBarView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/28/24.
//

import SwiftUI

struct StatusBarView: View {
    let minWidth: CGFloat = 35
    let minPercent: CGFloat = 96
    let minPtsBound: Int = 0
    let maxPtsBound: Int = 110
    var points: Int
    var width: CGFloat = 320
    var height: CGFloat = 40
    
    var body: some View {
        let statusPercent: CGFloat = calcStatusPrecent(pts: points, width: width)
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            
            if(statusPercent < minPercent){
                HStack {
                    if(points < maxPtsBound && points > minPtsBound){
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: minWidth, height: height)
                            .foregroundColor(Color(#colorLiteral(red: 0.02723839507, green: 0.3904387653, blue: 0.547154665, alpha: 1)))
                        Text("\(points)pts")
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    }
                    else{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: statusPercent, height: height)
                            .foregroundColor(Color(#colorLiteral(red: 0.02723839507, green: 0.3904387653, blue: 0.547154665, alpha: 1)))
                        Text("\(points)pts")
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    }//display pre-determined bar width if under a certain percentage
                }
            }
            else{
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: statusPercent, height: height)
                        .foregroundColor(Color(#colorLiteral(red: 0.02723839507, green: 0.3904387653, blue: 0.547154665, alpha: 1)))
                    Text("\(points) pts")
                        .foregroundColor(.white)
                }
            }//place points display within bar when width reaches a certain val
        }
    }
}

#Preview {
    StatusBarView(points: 500)
}
