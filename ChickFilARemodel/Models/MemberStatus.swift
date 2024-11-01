//
//  MemberStatus.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/28/24.
//

import Foundation

func calcStatusPrecent(pts: Int, width: CGFloat) -> CGFloat{
    let multiplier = width/100
    var statusPercent: Float
    var percent: CGFloat
    
    if (pts >= 5000 && pts < 10000){
        statusPercent = Float(pts)/10000
        statusPercent = statusPercent * 100
        percent = CGFloat(statusPercent)
        return percent * multiplier
    }//red member reaching signature status
    else if (pts >= 1000 && pts < 5000){
        statusPercent = Float(pts)/5000
        statusPercent = statusPercent * 100
        percent = CGFloat(statusPercent)
        return percent * multiplier
    }//sliver member reaching red status
    else{
        statusPercent = Float(pts)/1000
        statusPercent = statusPercent * 100
        percent = CGFloat(statusPercent)
        return percent * multiplier
    }//member reaching silver status
}//calculate percentage of completion within status range

func maxMemberPoints(memberStatus: String) -> Int{
    let signature = 10000
    let red = 5000
    let silver = 1000
    
    if(memberStatus == "signature"){
        return signature
    }
    else if(memberStatus == "red"){
        return signature
    }
    else if(memberStatus == "silver"){
        return red
    }
    else {
        return silver
    }
}//determine points needed to reach next member status
 //displayed at the end of progress bar 
