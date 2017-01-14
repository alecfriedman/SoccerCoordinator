 //: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Start code
 
 let teamList = [
    "Sharks",
    "Dragons",
    "Raptors"
 ]
 
 let players: [[String: Any]] = [
    [
        "name": "Joe Smith",
        "height": 42,
        "exp": "YES",
        "guardians": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": 36,
        "exp": "YES",
        "guardians": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": 43,
        "exp": "YES",
        "guardians": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": 45,
        "exp": "NO",
        "guardians": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": 40,
        "exp": "NO",
        "guardians": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": 41,
        "exp": "NO",
        "guardians": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": 45,
        "exp": "NO",
        "guardians": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": 42,
        "exp": "YES",
        "guardians": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": 44,
        "exp": "YES",
        "guardians": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": 41,
        "exp": "NO",
        "guardians": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": 39,
        "exp": "NO",
        "guardians": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": 44,
        "exp": "NO",
        "guardians": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": 41,
        "exp": "YES",
        "guardians": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": 47,
        "exp": "NO",
        "guardians": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": 43,
        "exp": "NO",
        "guardians": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": 44,
        "exp": "YES",
        "guardians": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": 42,
        "exp": "YES",
        "guardians": "Wynonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": 45,
        "exp": "YES",
        "guardians": "Hyman and Rachel Krustofski"
    ]
 ]
 
 func distributePlayers(playerGroups: [[[String: Any]]], league: [[String: Any]]) -> [[String: Any]] {
    var distLeague = league
    
    for group in playerGroups {
        var round: Int = 1
        var playerIndex: Int = 0;
        
        while round <= group.count / league.count {
            
            for index in 0..<distLeague.count {
                let player: [String: Any] = group[playerIndex]
                
                var list = distLeague[index]["players"] as! [[String: Any]]
                
                list.append(player)
                
                distLeague[index]["players"] = list
                
                playerIndex += 1
            }
            
            round += 1
        }
    }
    //print(distLeague)
    return distLeague
 }
 
 func formLeague(players: [[String: Any]], teams: [String]) -> [[String: Any]] {
    var allTeams = [[String: Any]]()
    var experiencedPlayers = [[String: Any]]()
    var inExperiencedPlayers = [[String: Any]]()
    
    for team in teams {
        allTeams.append(["teamName": team, "players": [[String: Any]]()])
    }
    
    for player in players {
        let exp = player["exp"] as! String
        
        if exp == "YES" {
            experiencedPlayers.append(player)
        } else {
            inExperiencedPlayers.append(player)
        }
    }
    
    return distributePlayers (playerGroups: [experiencedPlayers, inExperiencedPlayers], league: allTeams)
    //    return allTeams
 }
 
 func sendLetters(league: [[String: Any]]) {
    for team in league {
        var practiceDate: String
        let teamName = team["teamName"] as! String
        let players = team["players"] as! [[String: Any]]
        
        switch teamName {
        case "Dragons":
            practiceDate = "March 17, 1pm"
        case "Sharks":
            practiceDate = "March 17, 3pm"
        case "Raptors":
            practiceDate = "March 18, 1pm"
        default:
            practiceDate = "Not Available"
        }
        
        for player in players {
            print("Dear \(player["guardians"] as! String),\n\n\(player["name"] as! String) has been placed on the \(teamName) soccer team. The team's first practice date is \(practiceDate).\nAppropriate team name-related costume is required. Hope to see you there!\n\n\n")
        }
    }
 }
 // Array of Dictionaries for entire league
 let soccerLeague = formLeague(players: players, teams: teamList)
 sendLetters(league: soccerLeague)