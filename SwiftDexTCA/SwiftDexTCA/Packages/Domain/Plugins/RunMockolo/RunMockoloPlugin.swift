//
//  RunMockoloPlugin.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/21.
//

import PackagePlugin

@main struct RunMockoloPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let generatedSourcePath = context.pluginWorkDirectory.appending("PokemonMocks.swift")
        let packageRoot = context.package.directory

        return [
            .prebuildCommand(
                displayName: "Run mockolo",
                executable: try context.tool(named: "mockolo").path,
                arguments: [
                    "-s", packageRoot.appending("Sources", "UseCase").string,
                    "-d", generatedSourcePath
                ],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}
