//
//  Gender.swift
//  loveMyPet
//
//  Created by userext on 30/05/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    
    case male = "Macho"
    case female = "Fêmea"
    case none = "Nenhum"
}