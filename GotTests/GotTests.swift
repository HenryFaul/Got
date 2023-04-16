//
//  GotTests.swift
//  GotTests
//
//  Created by Henry Faul on 2023/04/14.
//

import XCTest

final class GotTests: XCTestCase {
    
    private var sutHouseModel: HouseModel!
    private var sutBookModel: BookModel!
    private var sutCharacterModel: CharacterModel!
    private var sutViewModelCharacter: ViewModelCharacter!
    
    
    override func setUpWithError() throws {
        sutHouseModel = HouseModel()
        sutBookModel = BookModel()
        sutCharacterModel = CharacterModel()
        sutViewModelCharacter = ViewModelCharacter()
    }
    
    override func tearDownWithError() throws {
        
        sutHouseModel = nil
        sutBookModel = nil
        sutCharacterModel = nil
        sutViewModelCharacter = nil
    }
    
    
    func testHouseSearch()  {
        
        let houseName = "House Algood"
        
        self.sutHouseModel.testSearchHouse(toFind: houseName) { success, data in
            
            if success {
                
                
                XCTAssertEqual(houseName, data?.first?.name)
                
            } else {
                XCTAssertFalse(true,"House API Failed")
            }
            
        }
    }
    
    
    func testHouseSearchLord()  {
        
        let houseName = "House Arryn of the Eyrie"
        let lordToFind = "Robert Arryn"
        
        self.sutHouseModel.testSearchHouse(toFind: houseName) { success, data in
            
            if success {
                
                let lord = data?.first?.currentLord
                
                self.sutViewModelCharacter.testFetch(character_url: lord!){ success, data in
                    
                    if success {
                        
                        
                        XCTAssertEqual(lordToFind, data?.name)
                        
                    } else {
                        XCTAssertFalse(true,"House API Failed")
                    }
                    
                }
                
                
                
            } else {
                XCTAssertFalse(true,"House API Failed")
            }
            
        }
    }
    
    func testBookCount()  {
        
        self.sutBookModel.tesLoad(){ success, data in
            
            if success {
                
                let size = data?.count
                
                XCTAssertGreaterThan(size!, 3)
                
            } else {
                XCTAssertFalse(true,"House API Failed")
            }
            
        }
        
    }
    
    func testCharacterCount()  {
        
        self.sutCharacterModel.tesLoad(){ success, data in
            
            if success {
                
                let size = data?.count
                
                XCTAssertGreaterThan(size!, 100)
                
            } else {
                XCTAssertFalse(true,"House API Failed")
            }
            
        }
        
    }
    
    
}
