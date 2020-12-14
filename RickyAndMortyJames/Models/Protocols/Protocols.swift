//
//  Protocols.swift
//  RickyAndMortyJames
//
//  Created by Douglas Schiavi on 08/12/20.
//

import Foundation
import UIKit

// MARK: View Code
protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    func setupAdditionalConfiguration() { }
}

// MARK: Reusable
public protocol Reusable {
    static var reusableIdentifier: String { get }
}

public extension Reusable {
    static var reusableIdentifier: String {
        return "\(Self.self)"
    }
}

// MARK: Table View
public protocol TableViewSection {
    var numberOfRows: Int { get }
    func registerCells(in tableView: UITableView)
    func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath)
    func tableViewSectionHeader(_ tableView: UITableView) -> UIView?
    func tableViewSectionFooter(_ tableView: UITableView) -> UIView?
    func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat
    func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat
}

public extension TableViewSection {
    
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return nil
    }
    
    func TableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return nil
    }
    
}

public protocol TableViewCellBuilder {
    
    var cellHeight: CGFloat { get }
    
    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)
    
}

public extension TableViewCellBuilder {
    func tableViewDidSelectCell(_ tableView: UITableView) { }
}

public protocol ContentCellConvertible {
    associatedtype Configuration = Void
    
    static var cellHeight: CGFloat { get }
    static var cellInsets: UIEdgeInsets { get }
    
    init()
    
    func setup(with data: Configuration)
}

extension ContentCellConvertible where Configuration == Void {
    public func setup(with data: Configuration) {}
}

public extension ContentCellConvertible {
    static var cellHeight: CGFloat { return UITableView.automaticDimension }
    static var cellInsets: UIEdgeInsets { return .zero }
}

// MARK: Collection View

// MARK: API
public protocol APIClient {
    func request(params: RequestParams, callback: @escaping (Result<APIResponse>) -> Void)
    func requestDecodable<T: Decodable>(params: RequestParams, callback: @escaping (Result<T>) -> Void)
}

public extension APIClient {
    func requestDecodable<T: Decodable>(params: RequestParams, callback: @escaping (Result<T>) -> Void) {
        request(params: params) { resp in
            switch resp {
            case.success(let response):
                Parser.parse(from: response.data, callback: callback)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

public protocol RickyAndMortyCharacterServiceProtocol {
    func getAllCharacters(_ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getSingleCharacter(id: Int,
                            _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getMultipleCharacters(ids: [Int],
                               _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func filterCharacters(queryItems: [URLQueryItem],
                          _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
}

public protocol RickyAndMortyLocationServiceProtocol {
    func getAllLocations(_ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getSingleLocation(id: Int,
                           _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getMultipleLocations(ids: [Int],
                              _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func filterLocations(queryItems: [URLQueryItem],
                         _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
}

public protocol RickyAndMortyEpisodeServiceProtocol {
    func getAllEpisodes(_ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getSingleEpisode(id: Int,
                           _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getMultipleEpisodes(ids: [Int],
                             _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func filterEpisodes(queryItems: [URLQueryItem],
                        _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
}

public protocol RickyAndMortyCharacterAPIProtocol {
    func getAllCharacters(_ params: RequestParams,
                          _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getSingleCharacter(_ params: RequestParams,
                            _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func getMultipleCharacters(_ params: RequestParams,
                               _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
    func filterCharacters(_ params: RequestParams,
                          _ callback: @escaping (Result<RickyAndMortyCharacterServiceResponse>) -> Void)
}

public protocol RickyAndMortyLocationAPIProtocol {
    func getAllLocations(_ params: RequestParams,
                         _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getSingleLocation(_ params: RequestParams,
                           _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func getMultipleLocations(_ params: RequestParams,
                              _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
    func filterLocations(_ params: RequestParams,
                         _ callback: @escaping (Result<RickyAndMortyLocationServiceResponse>) -> Void)
}

public protocol RickyAndMortyEpisodeAPIProtocol {
    func getAllEpisodes(_ params: RequestParams,
                        _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getSingleEpisode(_ params: RequestParams,
                           _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func getMultipleEpisodes(_ params: RequestParams,
                             _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
    func filterEpisodes(_ params: RequestParams,
                        _ callback: @escaping (Result<RickyAndMortyEpisodeServiceResponse>) -> Void)
}
