//
//  ViewController.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 08/12/20.
//

import UIKit

class ViewController: UIViewController {

    let mainView: MainScreenView
    var dataSource: TableViewDataSource?
    let service: RickyAndMortyCharacterServiceProtocol
    var response: RickyAndMortyCharacterServiceResponse?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters()
    }

    init(service: RickyAndMortyCharacterServiceProtocol = RickyAndMortyCharacterService()) {
        self.service = service
        self.mainView = MainScreenView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadCharacters() {
        service.getAllCharacters { result in
            switch result {
            case .success(let response):
                self.response = response
            case .failure(let error):
                print(error)
            }
        }
    }

    private func buildTableView(characters: RickyAndMortyCharacterServiceResponse) {
        let sections = createSections(characters: characters)
        dataSource = TableViewDataSource(sections: sections, tableView: mainView.tableView)
        
        mainView.tableView.dataSource = dataSource
        mainView.tableView.delegate = dataSource
        
        mainView.tableView.reloadData()
        mainView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                                       at: .top,
                                       animated: true)
    }
    
    private func createSections(characters: RickyAndMortyCharacterServiceResponse) -> [TableViewSection] {
        var sections = [TableViewSection]()
        
        sections.append(contentsOf: createCharactersSection(characters: characters))
        
        return sections
    }
    
    private func createCharactersSection(characters: RickyAndMortyCharacterServiceResponse) -> [TableViewSection] {
        var builders = [TableViewCellBuilder]()
        
        for character in characters.results {
//            builders.append(<#T##newElement: TableViewCellBuilder##TableViewCellBuilder#>)
        }
        return [TableViewSection]()
    }
    
}

