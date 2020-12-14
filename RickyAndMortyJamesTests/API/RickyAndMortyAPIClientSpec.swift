//
//  RickyAndMortyAPIClientSpec.swift
//  RickyAndMortyJamesTests
//
//  Created by Douglas Schiavi on 13/12/20.
//

import Quick
import Nimble
import Alamofire

@testable import RickyAndMortyJames

class RickyAndMortyAPIClientSpec: QuickSpec {
    override func spec() {
        
        describe("RickyAndMortyAPIClientSpec") {
            
            context("when requesting the singleton instance") {
                
                it("must return an instance of RickyAndMortyAPIClientSpec") {
                    expect(RickyAndMortyAPIClient.sharedClient).to(beAnInstanceOf(RickyAndMortyAPIClient.self))
                }
                
            }
            
            context("when requesting an specific path") {
                describe(".getAllCharacters") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getAllCharacters)).toEventually(contain("character"))
                    }
                }
                describe(".getSingleCharacter") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getSingleCharacter(1))).toEventually(contain("character/1"))
                    }
                }
                describe(".getMultipleCharacters") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getMultipleCharacters([1,2]))).toEventually(contain("character/1,2"))
                    }
                }
                describe(".filterCharacters") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for:
                                    .filterCharacters([URLQueryItem(name: "name", value: "Ricky"),
                                                       URLQueryItem(name: "status", value: "alive")])))
                                                       .toEventually(contain("character/?name=Ricky&status=alive"))
                    }
                }
                describe(".getAllLocations") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getAllLocations)).toEventually(contain("location"))
                    }
                }
                describe(".getSingleLocation") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getSingleLocation(1))).toEventually(contain("location/1"))
                    }
                }
                describe(".getMultipleLocations") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getMultipleLocations([1,2]))).toEventually(contain("location/1,2"))
                    }
                }
                describe(".filterLocations") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for:
                                    .filterLocations([URLQueryItem(name: "name", value: "Citadel of Ricks"),
                                                      URLQueryItem(name: "dimension", value: "unknown")])))
                                                      .toEventually(contain("location/?name=Citadel%20of%20Ricks&dimension=unknown"))
                    }
                }
                describe(".getAllEpisodes") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getAllEpisodes)).toEventually(contain("episode"))
                    }
                }
                describe(".getSingleEpisodes") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getSingleEpisodes(1))).toEventually(contain("episode/1"))
                    }
                }
                describe(".getMultipleEpisodes") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for: .getMultipleEpisodes([1,2]))).toEventually(contain("episode/1,2"))
                    }
                }
                describe(".filterEpisodes") {
                    it("must be a valid route") {
                        expect(try! RickyAndMortyAPIClient.sharedClient.urlPath(for:
                                    .filterEpisodes([URLQueryItem(name: "name", value: "The Ricklantis Mixup"),
                                                     URLQueryItem(name: "episode", value: "S03E07")])))
                                                    .toEventually(contain("episode/?name=The%20Ricklantis%20Mixup&episode=S03E07"))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
