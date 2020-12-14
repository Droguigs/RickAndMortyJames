//
//  CharacterCellViewSpec.swift
//  RickyAndMortyJamesTests
//
//  Created by Douglas Schiavi on 14/12/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickyAndMortyJames

class CharacterCellViewSpec: QuickSpec {
    override func spec() {
        var sut: CharacterCellView!
        
        describe("CharacterCellView") {
            beforeEach {
                sut = CharacterCellView()
            }
            
            context("When presenting on screen") {
                it("must be equal to") {
                    expect(sut).to(recordSnapshot(named: "CharacterCellView"))
                }
                
            }
            
        }
        
    }
    
}
