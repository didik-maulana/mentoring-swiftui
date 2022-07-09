//
//  Game+Dummy.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 09/07/22.
//

extension Game {
    static var dummyData: Game {
        Game(
            id: 1,
            slug: "grand-theft-auto-v",
            name: "Grand Theft Auto V",
            description: """
            Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \nSimultaneous storytelling from three unique perspectives: \nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.
            """,
            image: "gta",
            genre: "Action • Adventure",
            rating: 4.4
        )
    }
}
