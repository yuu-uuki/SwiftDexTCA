// The Swift Programming Language
// https://docs.swift.org/swift-book

import Dependencies
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public protocol PokemonListDataStore: Sendable {
    func execute(input: Operations.pokemon_list.Input) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary]
}

public struct PokemonListDataStoreImpl: PokemonListDataStore {

    let client = Client(
        serverURL: try! Servers.Server1.url(),
        transport: URLSessionTransport()
    )

    public func execute(input: Operations.pokemon_list.Input) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary] {
        do {
            let response = try await self.client.pokemon_list(input)
            switch response {
            case let .ok(data):
                return try data.body.json.results ?? []
            default:
                throw ApplicationError.network(.invalidResponse)
            }
        } catch let error as ApplicationError {
            throw error
        } catch {
            throw ApplicationError.network(.api(error))
        }
    }
}

extension PokemonListDataStoreImpl: DependencyKey {
    public static var liveValue: PokemonListDataStore {
        PokemonListDataStoreImpl()
    }
}

extension DependencyValues {
    public var pokemonListDataStore: PokemonListDataStore {
        get { self[PokemonListDataStoreImpl.self] }
        set { self[PokemonListDataStoreImpl.self] = newValue }
    }
}
