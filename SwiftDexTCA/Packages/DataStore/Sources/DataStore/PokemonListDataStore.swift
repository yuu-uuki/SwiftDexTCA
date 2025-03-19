// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public enum PokemonListDataStoreProvider {

    public static func provide() -> PokemonListDataStore {
        return PokemonListDataStoreImpl(
            client: Client(
                serverURL: try! Servers.Server1.url(),
                transport: URLSessionTransport()
            )
        )
    }
}

public protocol PokemonListDataStore: Sendable {
    func execute(input: Operations.pokemon_list.Input) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary]
}

private struct PokemonListDataStoreImpl: PokemonListDataStore {

    let client: Client

    func execute(input: Operations.pokemon_list.Input) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary] {
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
