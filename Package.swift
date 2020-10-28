// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Dflat",
  platforms: [.macOS(.v10_14), .iOS(.v11)],
  products: [
    .library(name: "Dflat", type: .static, targets: ["Dflat"]),
    .library(name: "SQLiteDflat", type: .static, targets: ["SQLiteDflat"]),
  ],
  dependencies: [
    .package(name: "FlatBuffers", url: "https://github.com/mustiikhalil/flatbuffers.git", from: "0.8.0"),
    .package(url: "https://github.com/apple/swift-atomics.git", from: "0.0.1"),
  ],
  targets: [
    .target(
      name: "Dflat",
      dependencies: ["FlatBuffers", .product(name: "Atomics", package: "swift-atomics")],
      path: "src",
      sources: [
        "Atom.swift",
        "ChangeRequest.swift",
        "Expr.swift",
        "FetchedResult.swift",
        "Publisher.swift",
        "QueryBuilder.swift",
        "TransactionContext.swift",
        "Workspace.swift",
        "exprs/Addition.swift",
        "exprs/Field.swift",
        "exprs/In.swift",
        "exprs/LessThan.swift",
        "exprs/Not.swift",
        "exprs/Or.swift",
        "exprs/And.swift",
        "exprs/IsNotNull.swift",
        "exprs/LessThanOrEqualTo.swift",
        "exprs/NotEqualTo.swift",
        "exprs/Subtraction.swift",
        "exprs/EqualTo.swift",
        "exprs/IsNull.swift",
        "exprs/Mod.swift",
        "exprs/NotIn.swift",
        "exprs/Value.swift"
      ]),
    .target(
      name: "_SQLiteDflatOSShim",
      path: "src/sqlite",
      sources: [
        "os.c",
      ],
      publicHeadersPath: "include"),
    .target(
      name: "SQLiteDflat",
      dependencies: ["Dflat", "SQLiteDflatObjC"],
      path: "src/sqlite",
      sources: [
        "SQLiteAtom.swift",
        "SQLiteConnection.swift",
        "SQLiteConnectionPool.swift",
        "SQLiteExpr.swift",
        "SQLiteFetchedResult.swift",
        "SQLiteObjectRepository.swift",
        "SQLitePersistenceToolbox.swift",
        "SQLitePublisher.swift",
        "SQLiteQueryBuilder.swift",
        "SQLiteResultPublisher.swift",
        "SQLiteTableSpace.swift",
        "SQLiteTableState.swift",
        "SQLiteTransactionContext.swift",
        "SQLiteWorkspace.swift",
        "SQLiteWorkspaceState.swift",
        "exprs/SQLiteAddition.swift",
        "exprs/SQLiteField.swift",
        "exprs/SQLiteIn.swift",
        "exprs/SQLiteLessThan.swift",
        "exprs/SQLiteNot.swift",
        "exprs/SQLiteOr.swift",
        "exprs/SQLiteAnd.swift",
        "exprs/SQLiteIsNotNull.swift",
        "exprs/SQLiteLessThanOrEqualTo.swift",
        "exprs/SQLiteNotEqualTo.swift",
        "exprs/SQLiteSubtraction.swift",
        "exprs/SQLiteEqualTo.swift",
        "exprs/SQLiteIsNull.swift",
        "exprs/SQLiteMod.swift",
        "exprs/SQLiteNotIn.swift",
        "exprs/SQLiteValue.swift"
      ]),
    .testTarget(
      name: "Tests",
      dependencies: ["SQLiteDflat"],
      path: "src/tests",
      sources: [
        "ConcurrencyTests.swift",
        "ExprTests.swift",
        "FetchTests.swift",
        "namespace.swift",
        "monster_generated.swift",
        "monster_data_model_generated.swift",
        "monster_mutating_generated.swift",
        "monster_query_generated.swift",
        "orb_weapon_generated.swift",
        "orb_weapon_data_model_generated.swift",
        "orb_weapon_mutating_generated.swift",
        "monster_v2_generated.swift",
        "monster_v2_data_model_generated.swift",
        "monster_v2_mutating_generated.swift",
        "monster_v2_query_generated.swift",
        "ObjectRepositoryTests.swift",
        "SchemaUpgradeTests.swift",
        "SQLiteWorkspaceCRUDTests.swift",
        "SubscribeTests.swift",
      ])
  ]
)
