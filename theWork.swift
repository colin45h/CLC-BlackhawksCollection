import UIKit

struct Player {
    var name : String
    var height : String
    var dob : String
    var birthplace : String
    
    var weight : Int
    
    var shoots : String?
    var position : String?
}

// 29, 19, 23, 21, 24
// 116 / 5 = 23.2 --> 23.2

var daName : [String] = ["Ryan Carpenter", "Kirby Dach", "Alex DaBrincat", "MachKenzie Entwistle", "Matthew Highmore"]
var daNumber : [Int] = [22, 77, 12, 58, 36]
var daHeight : [String] = ["6' 0", "6' 4", "5' 7", "6' 3", "5' 4"]
var daDob : [String] = ["Jan 18, 1991", "Jan 21, 2001", "Dec 18, 1997", "Jul 14, 1999", "Feb 27, 1996"]
var daBirth : [String] = ["Oviedo, FL, USA", "Fort Saskatchewan, AB, CAN", "Farmington Hills, MI, USA", "Georgetown, ON, CAN", "Hailfax, NS, CAN"]
var daWeight : [Int] = [200, 197, 165, 184, 188]
var daShoot : [String] = ["R", "R", "R", "R", "L"]
var daPosition : [String] = ["C", "C", "LW", "RW", "C"]

var yerList = [Player]()
var daHawks : [Int : Player]
for index in 0...4 {
    let thisGuy = Player(name: daName[index], height: daHeight[index], dob: daDob[index], birthplace: daBirth[index], weight: daWeight[index], shoots: daShoot[index], position: daPosition[index])
    yerList.append(thisGuy)
}

daHawks = Dictionary(uniqueKeysWithValues: zip(daNumber, yerList))

// print(daHawks)

/*
1. Store all players from dictionary into an array (inputList)
2. Flip through all the players, compare years of birth F.E 1985, 1997 (largest # --> youngest player, smallest # --> oldest player)
3. Sort the array in order of age
4. Return it

*/

func ageSort (inputDict : [Int : Player]) -> [Player] {
    var returnList = [Player]()

    
    for playa in daHawks.values {
        returnList.append(playa)
    }
    
    
    returnList.sort { (Int)($0.dob.suffix(4))! < (Int)($1.dob.suffix(4))! }
    
    return returnList
}

func countrySort (inputDict : [Int : Player]) -> [Player] {
    var returnList = [Player]()
    
    for playa in daHawks.values {
        returnList.append(playa)
    }
    
    returnList.sort { ($0.birthplace.suffix(3)) < ($1.birthplace.suffix(3)) }
    
    return returnList
}

func averageAge (inputDict : [Int : Player]) -> Int {
    var returnNum = 0
    
    for playa in daHawks.values {
        let ageString = (String)(playa.dob.suffix(4))
        let theAge = 2020 - ((Int)(ageString) ?? 0)
        
        returnNum = returnNum + theAge
    }
    
    return returnNum / daHawks.count
}

//    let store = input.components(separatedBy: CharacterSet.decimalDigits.inverted)
//    for value in store {
//        if(value != ""){
//            sum = (Int(value) ?? 0) + sum

func averageHeight (inputDict : [Int : Player]) -> String {
    var returnHeight = ""
    var heightNum = 0
    var tempString = ""
    
    for playa in daHawks.values {
        tempString = ""
        let heightString = playa.height.components(separatedBy: CharacterSet.decimalDigits.inverted)
        for value in heightString {
            if value != "" {
                tempString = tempString + value
            }
        }
        heightNum = heightNum + ((Int)(tempString) ?? 0)
    }
    
    heightNum = heightNum / daHawks.count
    tempString = (String)(heightNum)
    let digits = tempString.compactMap{ $0.wholeNumberValue }
    
    returnHeight = "\(digits[0]) feet, \(digits[1]) inches"
    
    return returnHeight
}

func averageMonth (inputDict : [Int : Player]) -> String {
    var returnMonth = ""
    var monthTimes = 0
    
    for playa in daHawks.values {
        var tempTimes = 0
        
        for playaCheck in daHawks.values {
            if playa.dob.prefix(3) == playaCheck.dob.prefix(3) {
                tempTimes = tempTimes + 1
            }
        }
        if tempTimes > monthTimes {
            returnMonth = (String)(playa.dob.prefix(3))
            monthTimes = tempTimes
        }
    }
    
    return returnMonth
}

print(averageHeight(inputDict: daHawks))
