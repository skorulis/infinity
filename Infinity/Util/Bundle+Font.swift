//Created by Alexander Skorulis on 13/3/2024.

import Foundation
import SwiftUI

public extension Bundle {
    
    static var fontFullNames: [String: String] = [:]
    
    func registerFont(name: String, ext: String) {
        guard let url = url(forResource: name, withExtension: ext) else {
            fatalError("Could not load font file \(name).\(ext)")
        }
        guard let data = try? Data(contentsOf: url),
              let dataRef = CGDataProvider(data: data as CFData),
              let font = CGFont(dataRef) else {
            fatalError("Could not create font for \(name).\(ext)")
        }
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print(error!.takeUnretainedValue())
        }
        
        guard let full = font.fullName as? String else { return }
        Self.fontFullNames[name] = full
        
    }
    
}

enum FontName: String, CaseIterable {
    
    case mono = "properhitboxglobal"
    
    public func font(_ size: CGFloat) -> Font {
        _ = FontName.registerFontsOnce
        return Font.custom(rawValue, size: size)
    }
    
    var ext: String {
        return "otf"
    }
    
    var name: String { rawValue }
    
}

private extension FontName {
    
    private static let registerFontsOnce: () = {
    #if canImport(UIKit)
        _ = UIFont.familyNames
    #endif
        
        for font in allCases {
            Bundle.main.registerFont(name: font.rawValue, ext: font.ext)
        }
    }()
    
}
