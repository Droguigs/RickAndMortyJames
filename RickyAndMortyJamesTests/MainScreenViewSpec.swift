//
//  MainScreenViewSpec.swift
//  RickyAndMortyJamesTests
//
//  Created by Douglas Schiavi on 08/12/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickyAndMortyJames

class MainScreeViewSpec: QuickSpec {
    override func spec() {
        describe("It") {
            it("should be equal to") {
                let frame = CGRect(x: 0, y: 0, width: 250, height: 300)
                let view = MainScreenView(frame: frame)
                expect(view) == recordSnapshot("MainScreenView")
            }
        }
    }
}
