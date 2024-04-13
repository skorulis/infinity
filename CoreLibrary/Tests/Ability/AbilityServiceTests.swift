//Created by Alexander Skorulis on 27/3/2024.

@testable import CoreLibrary
import XCTest

final class AbilityServiceTests: XCTestCase {
    
    private let random = FakeRandomService()
    private lazy var service = AbilityService(random: random)
    private let entityFactory = EntityFactory(bodyPartFactory: .init())
    
    private lazy var entity1 = entityFactory.human
    private lazy var entity2 = entityFactory.human
    
    func test_mainAttack() {
        let result = service.use(ability: .unarmed(.hands), source: entity1, target: entity2)
        XCTAssertEqual(result.effects.count, 1)
        XCTAssertEqual(result.events, [.hit(2)])
        
        let e2 = result.entity(id: entity2.id)
        XCTAssertEqual(e2.health, 18)
    }
    
    func test_mainAttackMiss() {
        random.nextInts = [10]
        let result = service.use(ability: .unarmed(.hands), source: entity1, target: entity2)
        XCTAssertEqual(result.effects.count, 0)
        XCTAssertEqual(result.events, [.miss])
    }
    
    func test_hitBonus() {
        var entity = entityFactory.human
        let weapon = entity.biology[.hands]?.weapon
        XCTAssertEqual(
            service.hitBonus(source: entity, weapon: weapon!),
            2
        )
        entity.skills.set(skill: .dexterity, level: 5)
        XCTAssertEqual(
            service.hitBonus(source: entity, weapon: weapon!),
            6
        )
    }
    
    func test_damageBonus() {
        var entity = entityFactory.human
        let weapon = entity.biology[.hands]?.weapon
        XCTAssertEqual(
            service.damageBonus(source: entity, weapon: weapon!),
            0
        )
        entity.skills.set(skill: .dexterity, level: 5)
        entity.skills.set(skill: .strength, level: 5)
        XCTAssertEqual(
            service.damageBonus(source: entity, weapon: weapon!),
            2
        )
    }
    
}
