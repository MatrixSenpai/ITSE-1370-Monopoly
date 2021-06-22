//
//  Game.swift
//  ITSE-1370-Monopoly
//
//  Created by Russell Collins on 6/16/21.
//  Modified by Russell Collins on 6/18/2021.
//  Adapted code for enum using Python source
//

import Foundation

enum Order: Int, /* CustomStringConvertible, */ CaseIterable, Equatable {
    case Go = 0
    case MediterraneanAve
    case CommunityChest1
    case BalticAve
    case IncomeTax
    case ReadingRR
    case OrientalAve
    case Chance1
    case VermontAve
    case ConnecticuttAve
    case Jail                       // JustVisiting
    case StCharlesPlace
    case ElectricCo
    case StateAve
    case VirginiaAve
    case PennsylvaniaRR
    case StJamesPlace
    case CommunityChest2
    case TennesseeAve
    case NewYorkAve
    case FreeParking
    case KentuckyAve
    case Chance2
    case IndianaAve
    case IllinoisAve
    case BandORR
    case AtlanticAve
    case VentnorAve
    case WaterWorks
    case MarvinGardens
    case GoToJail
    case PacificAve
    case NorthCarolinaAve
    case CommunityChest3
    case PennsylvaniaAve
    case ShortLineRR
    case Chance3
    case ParkPlace
    case LuxuryTax
    case Boardwalk
    case Unplaced
}

enum Group: String {
    case Safe
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

struct Square {
    var order: Order
    var group: Group
    var price: Int = 0
    var rents: [Int]
    
    var hotelRent: Int {
        return rents[5]
    }
    var improvements: Int {
        switch group {
        case .DarkPurple, .LightBlue:
            return 50
        case .Purple, .Orange:
            return 100
        case .Red, .Yellow:
            return 150
        case .Green, .Blue:
            return 200
        default:
            return 0
        }
    }
    var mortgage: Int {
        return price / 2
    }
    
    var name: String {
        let names: [String] = [
            "Go", "Mediterranean Ave.", "Community Chest", "Baltic Ave.", "Income Tax",
            "Reading Railroad", "Oriental Ave.", "Chance", "Vermont Ave.", "Connecticutt Ave.",
            "Just Visiting/Jail", "St. Charles Place", "Electric Company", "State Ave.", "Virginia Ave.",
            "Pennsylvania Railroad", "St. James Place", "Community Chest", "Tennessee Ave.", "New York Ave.",
            "Free Parking", "Kentucky Ave.", "Chance", "Indiana Ave.", "Illinois Ave.",
            "B & O Railroad", "Atlantic Ave.", "Ventnor Ave.", "Water Works", "Marvin Gardens",
            "Go to Jail", "Pacific Ave.", "North Carolina Ave.", "Community Chest", "Pennsylvania Ave.",
            "Short Line Railroad", "Chance", "Park Place", "Luxury Tax", "Boardwalk" ]
        return names[order.rawValue]
    }
    var description: String {
        switch group {
        case .Movement, .Safe, .CommunityChest, .Chance, .LuxuryTax, .Jail, .Tax:
            return "\(order.rawValue): \(name)"
        case .DarkPurple, .LightBlue, .Purple, .Orange,
             .Red, .Yellow, .Green, .Blue:
            return "\(order.rawValue): \(name) [\(group.rawValue)] price: $\(price), basic: $\(rents[0]), 1 house: $\(rents[1]), 2 houses: $\(rents[2]), 3 houses: $\(rents[3]), 4 houses: $\(rents[4]), hotel: $\(rents[5]) mtg. $\(mortgage)"
        case .Railroad:
            return "\(order.rawValue): \(name) [\(group.rawValue)] price: $\(price), 1 RR: $\(rents[1]), 2 RRs: $\(rents[2]), 3 RRs: $\(rents[3]), 4 RRs: $\(rents[4]), mtg. $\(mortgage)"
        case .Utility:
            return "\(order.rawValue): \(name) [\(group.rawValue)] price: $\(price), 1 utility: $\(rents[1]) X dice roll, 2 utilities: $\(rents[2]) X dice roll, mtg. $\(mortgage)"
        }
    }

    init(order: Order, group: Group, price: Int, rents: [Int]) {
        self.order = order
        self.group = group
        self.price = price
        self.rents = rents
    }
    
    init(order: Order, group: Group) {
        self.order = order
        self.group = group
        self.price = 0
        self.rents = Array<Int>()
    }
    
    func rent(withMonopoly: Bool) -> Int {
        return withMonopoly ? 2 * rents[0] : rents[0]
    }
    
    func rent(forHouses: Int) -> Int {
        return rents[forHouses]
    }
    
    func rent(forHotel: Bool) -> Int {
        return forHotel ? rents[5] : rents[0]
    }
}

var theBoard: [Square] = [
    Square(order: .Go, group: .Safe),
    Square(order: .MediterraneanAve, group: .DarkPurple, price: 60, rents: [2, 10, 30, 90, 160, 250]),
    Square(order: .CommunityChest1, group: .CommunityChest),
    Square(order: .BalticAve, group: .DarkPurple, price: 60,        rents: [4, 20, 60, 180, 320, 45]),
    Square(order: .IncomeTax, group: .Tax),
    
    Square(order: .ReadingRR, group: .Railroad, price: 200,         rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .OrientalAve, group: .LightBlue, price: 100,      rents: [6, 30, 90, 270, 400, 550]),
    Square(order: .Chance1, group: .Chance),
    Square(order: .VermontAve, group: .LightBlue, price: 100,       rents: [6, 30, 90, 270, 400, 550]),
    Square(order: .ConnecticuttAve, group: .LightBlue, price: 120,  rents: [8, 40, 100, 300, 450, 600]),
    
    Square(order: .Jail, group: .Jail),
    Square(order: .StCharlesPlace, group: .Purple, price: 140,      rents: [10, 50, 150, 450, 625, 750]),
    Square(order: .ElectricCo, group: .Utility, price: 150,         rents: [0, 4, 11, 0, 0, 0]),
    Square(order: .StateAve, group: .Purple, price: 140,            rents: [10, 50, 150, 450, 625, 750]),
    Square(order: .VirginiaAve, group: .Purple, price: 160,         rents: [12, 60, 180, 500, 700, 900]),
    
    Square(order: .PennsylvaniaRR, group: .Railroad, price: 200,    rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .StJamesPlace, group: .Orange, price: 180,        rents: [14, 60, 180, 500, 700, 900]),
    Square(order: .CommunityChest2, group: .CommunityChest),
    Square(order: .TennesseeAve, group: .Orange, price: 180,        rents: [14, 60, 180, 500, 700, 900]),
    Square(order: .NewYorkAve, group: .Orange, price: 200,          rents: [16, 80, 220, 600, 800, 1000]),
    
    Square(order: .FreeParking, group: .Safe),
    Square(order: .KentuckyAve, group: .Red, price: 220,            rents: [18, 90, 250, 700, 875, 1050]),
    Square(order: .Chance2, group: .Chance),
    Square(order: .IndianaAve, group: .Red, price: 220,             rents: [18, 90, 250, 700, 875, 1050]),
    Square(order: .IllinoisAve, group: .Red, price: 240,            rents: [20, 100, 300, 750, 925, 1100]),
    
    Square(order: .BandORR, group: .Railroad, price: 200,           rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .AtlanticAve, group: .Yellow, price: 260,         rents: [22, 110, 330, 800, 975, 1150]),
    Square(order: .VentnorAve, group: .Yellow, price: 260,          rents: [22, 110, 330, 800, 975, 1150]),
    Square(order: .WaterWorks, group: .Utility, price: 150,         rents: [0, 4, 11, 0, 0, 0]),
    Square(order: .MarvinGardens, group: .Yellow, price: 280,       rents: [24, 120, 360, 850, 1025, 1200]),
    
    Square(order: .GoToJail, group: .Movement),
    Square(order: .PacificAve, group: .Green, price: 300,           rents: [26, 130, 390, 900, 1100, 1275]),
    Square(order: .NorthCarolinaAve, group: .Green, price: 300,     rents: [26, 130, 390, 900, 1100, 1275]),
    Square(order: .CommunityChest3, group: .CommunityChest),
    Square(order: .PennsylvaniaAve, group: .Green, price: 320,      rents: [28, 150, 450, 1000, 1200, 1400]),
    
    Square(order: .ShortLineRR, group: .Railroad, price: 200,       rents: [0, 25, 50, 100, 200, 0]),
    Square(order: .Chance3, group: .Chance),
    Square(order: .ParkPlace, group: .Blue, price: 350,             rents: [35, 175, 500, 1100, 1300, 1500]),
    Square(order: .LuxuryTax, group: .Tax),
    Square(order: .Boardwalk, group: .Blue, price: 400,             rents: [50, 200, 600, 1400, 1700, 2000]),
]

enum CardKind: String {
    case Assessments
    case Back3Spaces
    case CollectFromEachPlayer
    case GoAndCollect
    case GoTo
    case NearestRR
    case NearestUtility
    case OutOfJail
    case PayBank
    case PayEachPlayer
    case ReceiveFromBank
}

enum Cards: Int {
    case ccAdvanceToGo
    case ccBankErrorInYourFavorCollect$200
    case ccCollect$50FromEveryPlayer
    case ccDoctorsFeePay$50
    case ccFromSaleOfStockYouGet$45
    case ccGetOutOfJailFree
    case ccGoToJail
    case ccIncomeTaxRefundCollect$20
    case ccLifeInsuranceMaturesCollect$100
    case ccPayHospital$100
    case ccPaySchoolTaxOf$150
    case ccReceiveForServices$25
    case ccXMasFundMaturesCollect$100
    case ccYouAreAssessedForStreetRepairs$40PerHouse$115PerHotel
    case ccYouHaveWonSecondPrizeInABeautyContestCollect$10
    case ccYouInherit$100
    case AdvanceToGo
    case AdvanceToIllinoisAve
    case AdvanceToStCharlesPlace
    case AdvanceTokenToNearestUtility
    case AdvanceTokenToTheNearestRailroad
    case BankPaysYouDividendOf$50
    case GetOutOfJailFree
    case GoBack3Spaces
    case GoToJail
    case MakeGeneralRepairsOnAllYourProperty
    case PayPoorTaxOf$15
    case TakeATripToReadingRailroad
    case TakeAWalkOnTheBoardwalk
    case YouHaveBeenElectedChairmanOfTheBoard
    case YourBuildingAndLoanMatures
}

struct Card {
    var card: Cards
    var kind: CardKind
    var square: Order = .Unplaced
    var amount: Int = 0
    var perHouse: Int = 0
    var perHotel: Int = 0
    
    var text: String {
        let cardText: [String] = [
            "Advance to Go (Collect $200)",
            "Bank error in your favor. Collect $200.",
            "Grand opeara opening.  Collect $50 from every player",
            "Doctor's fee. Pay $50.",
            "From sale of stock you get $45.",
            "Get Out of Jail Free",
            "Go to Jail. Go directly to jail. Do not pass Go. Do not collect $200",
            "Income tax refund. Collect $20.",
            "Life insurance matures. Collect $100.",
            "Pay hospital $100.",
            "Pay school tax of $150.",
            "Receive for services $25.",
            "Xmas fund matures. Collect $100.",
            "You are assessed for street repairs of $40 per house, $115 per hotel.",
            "You have won second prize in a beauty contest. Collect $10.",
            "You inherit $100.",
            
            "Advance to Go.  Collect $200.",
            "Advance to Illinois Ave",
            "Advance to St. Charles Place. If you pass Go, collect $200.",
            "Advance token to nearest utility. If unowned, you may buy it from the bank.",
            "Advance token to the nearest railroad and pay the owner twice the rental to which he is otherwise entitled. If unowned, you may buy it from the bank.",
            "Bank pays you dividend of $50.",
            "Get out of jail free.",
            "Go back 3 spaces.",
            "Go to jail.",
            "Make general repairs on all your property.  $25 per house. $100 per hotel",
            "Pay poor tax of $15.",
            "Take a ride on the Reading.  If you pass Go, collect $200.",
            "Take a walk on the Boardwalk.  Advance token to Boardwalk.",
            "You have been elected Chairman of the Board.  Pay each player $50",
            "Your building and loan matures. Collect $150.",
        ]
        return cardText[card.rawValue]
    }
    
    var description: String {
        switch self.kind {
        case .Assessments:
            return "\"\(self.text)\" \(self.kind.rawValue)! Pay banker per house: $\(perHouse), per hotel: $\(perHotel)"
        case .Back3Spaces:
            return "\"\(self.text)\"  Back 3 spaces."
        case .CollectFromEachPlayer:
            return "\"\(self.text)\"  Collect $\(self.amount) from each player."
        case .GoAndCollect:
            return "\"\(self.text)\"  Go to \(theBoard[self.square.rawValue].name). Collect $\(self.amount)."
        case .GoTo:
            return "\"\(self.text)\"  Go to \(theBoard[self.square.rawValue].name)"
        case .NearestRR:
            return "\"\(self.text)\"  Nearest RR."
        case .NearestUtility:
            return "\"\(self.text)\"  Nearest utility."
        case .OutOfJail:
            return "\"\(self.text)\"  Out of jail."
        case .PayBank:
            return "\"\(self.text)\"  Pay banker $\(self.amount)."
        case .PayEachPlayer:
            return "\"\(self.text)\"  Pay each player $\(self.amount)."
        case .ReceiveFromBank:
            return "\"\(self.text)\"  Receive from banker $\(self.amount)."
        }
    }
    
    init(card: Cards, kind: CardKind, square: Order) {
        self.card = card
        self.kind = kind
        self.square = square
    }
    
    init(card: Cards, kind: CardKind, square: Order, amount: Int) {
        self.card = card
        self.kind = kind
        self.square = square
        self.amount = amount
    }
    
    init(card: Cards, kind: CardKind, amount: Int ) {
        self.card = card
        self.kind = kind
        self.amount = amount
    }
    
    init(card: Cards, kind: CardKind) {
        self.card = card
        self.kind = kind
    }
    
    init(card: Cards, kind: CardKind, perHouse: Int, perHotel: Int) {
        self.card = card
        self.kind = kind
        self.perHouse = perHouse
        self.perHotel = perHotel
    }
}

var chanceCards: [Card] = [         // 16 cards; nearest railroad is duped.  Use shuffle to rearrange.
    Card(card: .AdvanceToGo, kind: .GoAndCollect, square: .Go, amount: 200),
    Card(card: .AdvanceToIllinoisAve, kind: .GoTo, square: .IllinoisAve),
    Card(card: .AdvanceToStCharlesPlace, kind: .GoAndCollect, square: .StCharlesPlace, amount: 200),
    Card(card: .AdvanceTokenToNearestUtility, kind: .NearestUtility),
    Card(card: .AdvanceTokenToTheNearestRailroad, kind: .NearestRR),
    Card(card: .AdvanceTokenToTheNearestRailroad, kind: .NearestRR),
    Card(card: .BankPaysYouDividendOf$50, kind: .ReceiveFromBank, amount: 50),
    Card(card: .GetOutOfJailFree, kind: .OutOfJail),
    Card(card: .GoBack3Spaces, kind: .Back3Spaces),
    Card(card: .GoToJail, kind: .GoTo, square: .Jail),
    Card(card: .MakeGeneralRepairsOnAllYourProperty, kind:.Assessments, perHouse: 25, perHotel: 100),
    Card(card: .PayPoorTaxOf$15, kind: .PayBank, amount: 15),
    Card(card: .TakeATripToReadingRailroad, kind: .GoTo, square: .ReadingRR),
    Card(card: .TakeAWalkOnTheBoardwalk, kind: .GoTo, square: .Boardwalk),
    Card(card: .YouHaveBeenElectedChairmanOfTheBoard, kind: .PayEachPlayer, amount: 50),
    Card(card: .YourBuildingAndLoanMatures, kind: .ReceiveFromBank, amount: 100),
]

var communityChestCards: [Card] = [
    Card(card: .ccAdvanceToGo, kind: .GoAndCollect, square: .Go, amount: 200),
    Card(card: .ccBankErrorInYourFavorCollect$200, kind: .ReceiveFromBank, amount: 200),
    Card(card: .ccDoctorsFeePay$50, kind: .PayBank, amount: 50),
    Card(card: .ccFromSaleOfStockYouGet$45, kind: .ReceiveFromBank, amount: 45),
    Card(card: .ccGetOutOfJailFree, kind: .OutOfJail),
    Card(card: .ccGoToJail, kind: .GoTo, square: .Jail),
    Card(card: .ccCollect$50FromEveryPlayer, kind: .CollectFromEachPlayer, amount: 50),
    Card(card: .ccIncomeTaxRefundCollect$20, kind: .ReceiveFromBank, amount: 20),
    Card(card: .ccLifeInsuranceMaturesCollect$100, kind: .ReceiveFromBank, amount: 100),
    Card(card: .ccPayHospital$100, kind: .PayBank, amount: 100),
    Card(card: .ccPaySchoolTaxOf$150, kind: .PayBank, amount: 150),
    Card(card: .ccReceiveForServices$25, kind: .ReceiveFromBank, amount: 25),
    Card(card: .ccXMasFundMaturesCollect$100, kind: .ReceiveFromBank, amount: 100),
    Card(card: .ccYouAreAssessedForStreetRepairs$40PerHouse$115PerHotel, kind: .Assessments, perHouse: 40, perHotel: 115),
    Card(card: .ccYouHaveWonSecondPrizeInABeautyContestCollect$10, kind: .ReceiveFromBank, amount: 10),
    Card(card: .ccYouInherit$100, kind: .ReceiveFromBank, amount: 100),
]
