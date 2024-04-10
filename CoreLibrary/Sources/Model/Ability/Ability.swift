//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public enum Ability: Equatable, Codable {
    case mainHandAttack
    case secondHandAttack
    case unarmed(BodyPart)
}
