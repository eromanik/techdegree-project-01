//: SoccerCoordinator Playground

// Create array of dictionaries for all players

var players: [[String: Any]] = [
    [
        "name": "Joe Smith",
        "heightInInches": 42,
        "soccerExperience": true,
        "guardianNames": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "heightInInches": 36,
        "soccerExperience": true,
        "guardianNames": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "heightInInches": 43,
        "soccerExperience": true,
        "guardianNames": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "heightInInches": 45,
        "soccerExperience": false,
        "guardianNames": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "heightInInches": 40,
        "soccerExperience": false,
        "guardianNames": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "heightInInches": 41,
        "soccerExperience": false,
        "guardianNames": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "heightInInches": 45,
        "soccerExperience": false,
        "guardianNames": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "heightInInches": 42,
        "soccerExperience": true,
        "guardianNames": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "heightInInches": 44,
        "soccerExperience": true,
        "guardianNames": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "heightInInches": 41,
        "soccerExperience": false,
        "guardianNames": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "heightInInches": 39,
        "soccerExperience": false,
        "guardianNames": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "heightInInches": 44,
        "soccerExperience": false,
        "guardianNames": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "heightInInches": 41,
        "soccerExperience": true,
        "guardianNames": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "heightInInches": 47,
        "soccerExperience": false,
        "guardianNames": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "heightInInches": 43,
        "soccerExperience": false,
        "guardianNames": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "heightInInches": 44,
        "soccerExperience": true,
        "guardianNames": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "heightInInches": 42,
        "soccerExperience": true,
        "guardianNames": "Wynona Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "heightInInches": 45,
        "soccerExperience": true,
        "guardianNames": "Hyman and Rachel Krustofski"
    ]
]

// Reorder player array by height for extra credit

var orderedPlayersByHeight: [[String: Any]] = []
var minimumHeight: Int
var shortestPlayer: [String: Any] = players[0]
var shortestPlayerIndex: Int = 0

while players.count > 0 {
    minimumHeight = 100
    for (index, player) in players.enumerated() {
        let playerHeight: Int = player["heightInInches"] as! Int
        if playerHeight <= minimumHeight {
            shortestPlayer = player
            minimumHeight = playerHeight
            shortestPlayerIndex = index
        }
    }
    orderedPlayersByHeight.append(shortestPlayer)
    players.remove(at:shortestPlayerIndex)
}

// Create empty arrays of players for each team

var dragons: [[String: Any]] = []
var sharks: [[String: Any]] = []
var raptors: [[String: Any]] = []

// Function to count number of experienced players in a team

func experiencedPlayers(in players: [[String : Any]]) -> Int {
    var playerCount = 0
    for player in players {
        let isExperienced = player["soccerExperience"] as! Bool
        if isExperienced {
            playerCount += 1
        }
    }
    return playerCount
}

// Iterate through players and append to team arrays

for player in orderedPlayersByHeight {
    if let experienced = player["soccerExperience"] as? Bool {
        if experienced == true {
            let dragonsExperienced = experiencedPlayers(in: dragons)
            let sharksExperienced = experiencedPlayers(in: sharks)
            let raptorsExperienced = experiencedPlayers(in: raptors)
            if dragonsExperienced <= sharksExperienced && dragonsExperienced <= raptorsExperienced {
                dragons.append(player)
            } else if sharksExperienced <= dragonsExperienced && sharksExperienced <= raptorsExperienced{
                sharks.append(player)
            } else {
                raptors.append(player)
            }
        } else {
            if dragons.count <= sharks.count && dragons.count <= raptors.count {
                dragons.append(player)
            } else if sharks.count <= dragons.count && sharks.count <= raptors.count {
                sharks.append(player)
            } else {
                raptors.append(player)
            }
        }
    }
}

// Print letters

// Create empty array for all letters

var letters: Array<String> = []

// Function for generating letters

func generateLetter(for player: [String: Any], assignedToTeam team: String, onDate date: String){
    let guardians: String = player["guardianNames"] as! String
    let playerName: String = player["name"] as! String
    let letter = "Dear \(guardians), your child, \(playerName), has been assigned to the \(team) team, which will hold its first practice on \(date)."
    letters.append(letter)
}

// Generate letters for each team and print

for player in dragons {
    generateLetter(for: player, assignedToTeam: "Dragons", onDate: "March 17 at 1pm")
}

for player in sharks {
    generateLetter(for: player, assignedToTeam: "Sharks", onDate: "March 17 at 3pm")
}

for player in raptors {
    generateLetter(for: player, assignedToTeam: "Raptors", onDate: "March 18 at 1pm")
}

print(letters)

// Calculate average height for each team

func averageHeight(team: [[String: Any]]) -> Double {

    var heightArray: Array<Int> = []
    var heightSum = 0
    for player in team {

        let height = player["heightInInches"]
        heightArray.append(height as! Int)
    }
    for playerHeight in heightArray {
        heightSum += playerHeight
    }
    
    return Double(heightSum) / Double(heightArray.count)
}

let averageDragonHeight = averageHeight(team: dragons)
print("Average Height of Dragons:")
print(averageDragonHeight)

let averageSharkHeight = averageHeight(team: sharks)
print("Average Height of Sharks:")
print(averageSharkHeight)

let averageRaptorHeight = averageHeight(team: raptors)
print("Average Height of Raptors:")
print(averageRaptorHeight)







