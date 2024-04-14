//  Created by Alexander Skorulis on 14/4/2024.

import Foundation

public struct EntityList {
    
    private let ids: [EntityID]
    private var dictionary: [EntityID: Entity]
    
    init(entities: [Entity]) {
        self.ids = entities.map { $0.id }
        self.dictionary = Dictionary(grouping: entities, by: {$0.id}).mapValues { $0[0] }
    }
    
    var list: [Entity] {
        return ids.map { id in
            return dictionary[id]!
        }
    }
    
    func other(id: EntityID) -> Entity {
        assert(ids.count == 2, "Other only works with 2 entities")
        let otherID = ids.first(where: { $0 != id })!
        return self[otherID]
    }
    
    subscript(id: EntityID) -> Entity {
        return dictionary[id]!
    }
    
    mutating func update(entities: [EntityID: Entity]) {
        self.dictionary = entities
    }
    
    mutating func forEach(_ body: (inout Entity) -> Void) {
        var result: [EntityID: Entity] = [:]
        dictionary.forEach { key, value in
            var entity = self[key]
            body(&entity)
            result[key] = entity
        }
        dictionary = result
    }
}
