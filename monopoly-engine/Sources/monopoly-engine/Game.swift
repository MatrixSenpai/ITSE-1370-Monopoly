//
//  Game.swift
//  ITSE-1370-Monopoly
//
//  Created by Russell Collins on 6/16/21.
//

import Foundation

enum Square: Int, CustomStringConvertible, CaseIterable, Equatable {
    case Go = 0
    case MediterraneanAve = 1
    case CommunityChest1 = 2
    case BalticAve = 3
    case IncomeTax = 4
    case ReadingRR = 5
    case OrientalAve = 6
    case Chance1 = 7
    case VermontAve = 8
    case ConnecticuttAve = 9
    case Jail = 10
    // JustVisiting = 10
    case StCharlesPlace = 11
    case ElectricCo = 12
    case StateAve = 13
    case VirginiaAve = 14
    case PennsylvaniaRR = 15
    case StJamesPlace = 16
    case CommunityChest2 = 17
    case TennesseeAve = 18
    case NewYorkAve = 19
    case FreeParking = 20
    case KentuckyAve = 21
    case Chance2 = 22
    case IndianaAve = 23
    case IllinoisAve = 24
    case BandORR = 25
    case entnorAve = 26
    case WaterWorks = 27
    case AtlanticAve = 28
    case MarvinsGardens = 29
    case GoToJail = 30
    case PacificAve = 31
    case NorthCarolinaAve = 32
    case CommunityChest3 = 33
    case PennsylvaniaAve = 34
    case ShortLineRR = 35
    case LuxuryTax = 36
    case ParkPlace = 37
    case Chance3 = 38
    case Boardwalk = 39
}

enum Group: String {
    case HangOut
    case Movement
    case CommunityChest
    case Chance
    case Tax
    case LuxuryTax
    case Jail
    case Railroad
    case Utility
    case DarkPurple
    case LightBlue
    case Purple
    case Orange
    case Red
    case Yellow
    case Green
    case Blue
}

struct Deed {
    
}

struct BoardSquare {
    var name: String
    var group: Group
    // var boardText: String
    var price: Int
    var deed: Deed!
    
    init(square: Square, group: Group, price: Int, deed: Deed) {
        self.name = square.description
        self.group = group
        //self.boardText = boardText
        self.price = price
        self.deed = deed
    }
    
    init(square: Square, group: Group) {
        self.name = square
        self.group = group
        //self.boardText = boardText
        self.price = 0
        self.deed = nil
    }
}

var theBoard: [BoardSquare] = [
    BoardSquare(square: .Go, group: .HangOut),
    BoardSquare(square: .MediterraneanAve, group: .DarkPurple, price: 40, deed: <#Deed#>),
    BoardSquare(square: .CommunityChest1, group: .CommunityChest),
    BoardSquare(square: .BalticAve, group: .DarkPurple, price: 60),
    BoardSquare(square: .IncomeTax, group: .Tax),
    BoardSquare(square: .ReadingRR, group: .Railroad, price: 200),
    BoardSquare(square: .OrientalAve, group: .LightBlue, price: 300),
    BoardSquare(square: .Chance1, group: .Chance),
    BoardSquare(square: .VermontAve, group: .LightBlue, price: 300),
    BoardSquare(square: .ConnecticuttAve, group: .LightBlue, price: 300),
    BoardSquare(square: .Jail, group: .Jail),
    BoardSquare(square: .StCharlesPlace, group: .Purple, price: 140),
    BoardSquare(square: .ElectricCo, group: .Utility, price: 150),
    BoardSquare(square: .StateAve, group: .Purple, price: 140),
    BoardSquare(square: .VirginiaAve, group: .Purple, price: 160),
    BoardSquare(square: .PennsylvaniaRR, group: .Railroad, price: 200),
    BoardSquare(square: .StJamesPlace, group: .Orange, price: 180),
    BoardSquare(square: .CommunityChest2, group: .CommunityChest),
    BoardSquare(.TennesseeAve, group: .Orange, price: 180),
    BoardSquare(.NewYorkAve, group: .Orange, price: 200),
    BoardSquare(.FreeParking, group: .HangOut),
    BoardSquare(.KentuckyAve, group: .Red, price: 300),
    BoardSquare(.Chance2, group: .Chance),
    BoardSquare(.IndianaAve, group: .Red, price: 300),
    BoardSquare(.IllinoisAve, group: .Red, price: 300),
    BoardSquare(.BandORR, group: .Railroad, price: 200),
    BoardSquare(.VentnorAve, group: .Yellow, price: 300),
    BoardSquare(.AtlanticAve, group: .Yellow, price: 300),
    BoardSquare(.WaterWorks, group: .Utility, price: 300),
    BoardSquare(.MarvinsGardens, group: .Yellow, price: 300),
    BoardSquare(.GoToJail, group: .Movement),
    BoardSquare(.PacificAve, group: .Green, price: 300),
    BoardSquare(.CommunityChest3, group: .CommunityChest),
    BoardSquare(.NorthCarolinaAve, group: .Green, price: 300)
    BoardSquare(.ShortLineRR, group: .Railroad, price: 200),
    BoardSquare(.LuxuryTax, group: .Tax),
    BoardSquare(.Chance3, group: .Chance),
    BoardSquare(.ParkPlace, group: .Blue, price: 350),
    BoardSquare(.Chance3, group: .Chance),
    BoardSquare(.Boardwalk, group: .Blue, price: 400),
]
