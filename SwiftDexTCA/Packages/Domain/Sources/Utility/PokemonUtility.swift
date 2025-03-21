//
//  PokemonAPIUtility.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/20.
//

import Foundation

enum PokemonUtility {

    /// 指定されたURL文字列からポケモンのIDを抽出する
    /// - Parameter url: ポケモンAPIのURL
    /// - Returns: ポケモンのID（数値）、取得できなければ `nil`
    static func extractPokemonID(from url: String) -> Int? {
        let components = url.split(separator: "/").compactMap { Int($0) }
        return components.last
    }

    /// デフォルトのスプライト画像URLを取得
    static func getSpriteImageURL(from pokemonURL: String) -> URL? {
        guard let id = extractPokemonID(from: pokemonURL) else { return nil }
        return URL(string: getSpriteImageURL(from: id))
    }

    /// 公式アートワーク画像URLを取得
    static func getOfficialArtworkURL(from pokemonURL: String) -> URL? {
        guard let id = extractPokemonID(from: pokemonURL) else { return nil }
        return URL(string: getOfficialArtworkURL(from: id))
    }

    /// ポケモンのIDをもとにデフォルトのスプライト画像URLを作成
    static func getSpriteImageURL(from id: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }

    /// ポケモンのIDをもとに公式アートワーク画像URLを作成
    static func getOfficialArtworkURL(from id: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}
