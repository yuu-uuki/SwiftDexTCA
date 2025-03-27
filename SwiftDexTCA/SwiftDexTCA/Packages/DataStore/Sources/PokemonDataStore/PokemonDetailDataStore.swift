//
//  PokemonDetailDataStore.swift
//  DataStore
//
//  Created by 田中裕貴 on 2025/03/26.
//

import Dependencies
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public protocol PokemonDetailDataStore: Sendable {
    func execute(input: Operations.pokemon_retrieve.Input) async throws(ApplicationError) -> Components.Schemas.PokemonDetail
}

private struct PokemonDetailDataStoreImpl: PokemonDetailDataStore {

    let client = Client(
        serverURL: try! Servers.Server1.url(),
        transport: URLSessionTransport()
    )

    func execute(input: Operations.pokemon_retrieve.Input) async throws(ApplicationError) -> Components.Schemas.PokemonDetail {
        do {
            let response = try await self.client.pokemon_retrieve(input)
            switch response {
            case let .ok(data):
                return try data.body.json
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

extension PokemonDetailDataStoreImpl: DependencyKey {
    public static var liveValue: PokemonDetailDataStore {
        PokemonDetailDataStoreImpl()
    }
}

extension DependencyValues {
    public var pokemonDetailDataStore: PokemonDetailDataStore {
        get { self[PokemonDetailDataStoreImpl.self] }
        set { self[PokemonDetailDataStoreImpl.self] = newValue }
    }
}
