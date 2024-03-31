//Created by Alexander Skorulis on 27/3/2024.

@testable import CoreLibrary
import XCTest

final class AbilityServiceTests: XCTestCase {
    
    private let random = FakeRandomService()
    private lazy var service = AbilityService(random: random)
    
    private let entity1 = Entity(health: .init(current: 50, max: 50))
    private let entity2 = Entity(health: .init(current: 50, max: 50))
    
    func test_mainAttack() {
        let result = service.use(ability: .mainHandAttack, source: entity1, target: entity2)
        XCTAssertEqual(result.effects.count, 1)
        
        let e2 = result.entity(id: entity2.id)
        XCTAssertEqual(e2.health.current, 44)
    }
    
    func test_mainAttackMiss() {
        random.nextInts = [10]
        let result = service.use(ability: .mainHandAttack, source: entity1, target: entity2)
        XCTAssertEqual(result.effects.count, 0)
    }
    
}
