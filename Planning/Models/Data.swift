//
//  Data.swift
//  Planning
//
//  Created by Sandy Lee on 10/2/22.
//

import Foundation

extension Data {
    static func fromJSONFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print("Couldn't read JSON file.", error)
        }
        return nil
    }
}
