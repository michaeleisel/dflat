workspace(name = "dflat")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

git_repository(
    name = "build_bazel_rules_apple",
    commit = "b5ea324a8aa8d5fd5843a9ad3e663a2d54898fc4",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    shallow_since = "1601006876 -0700",
)

git_repository(
    name = "build_bazel_rules_swift",
    commit = "b7a269355fc9852a885c5becbdeb1497cf787164",
    remote = "https://github.com/bazelbuild/rules_swift.git",
    shallow_since = "1600724082 -0700",
)

git_repository(
    name = "build_bazel_apple_support",
    commit = "2583fa0bfd6909e7936da5b30e3547ba13e198dc",
    remote = "https://github.com/bazelbuild/apple_support.git",
    shallow_since = "1600371270 -0700",
)

git_repository(
    name = "bazel_skylib",
    commit = "528e4241345536c487cca8b11db138104bb3bd68",
    remote = "https://github.com/bazelbuild/bazel-skylib.git",
    shallow_since = "1601067301 +0200",
)

new_git_repository(
    name = "flatbuffers",
    build_file = "flatbuffers.BUILD",
    commit = "0bdf2fa156f5133b09ddac7beb326b942d524b38",
    remote = "https://github.com/google/flatbuffers.git",
    shallow_since = "1601319419 -0700",
)

new_git_repository(
    name = "swift-atomics",
    build_file = "swift-atomics.BUILD",
    commit = "ccce007d5d5462860cf0cb7839a233307424c61c",
    remote = "https://github.com/apple/swift-atomics.git",
    shallow_since = "1603395818 -0700",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@com_google_protobuf//:protobuf_deps.bzl",
    "protobuf_deps",
)

protobuf_deps()

http_file(
    name = "xctestrunner",
    executable = 1,
    sha256 = "298846d5ad7607eba33e786149c2b642ffe39508d4a99468a8280871d902fe5d",
    urls = ["https://github.com/google/xctestrunner/releases/download/0.2.14/ios_test_runner.par"],
)

http_archive(
    name = "sqlite3",
    build_file = "sqlite3.BUILD",
    sha256 = "b34f4c0c0eefad9a7e515c030c18702e477f4ef7d8ade6142bdab8011b487ac6",
    urls = ["https://www.sqlite.org/2020/sqlite-amalgamation-3330000.zip"],
)

# Internal tools

new_git_repository(
    name = "SwiftArgumentParser",
    build_file = "swift-argument-parser.BUILD",
    commit = "4273ad222e6c51969e8585541f9da5187ad94e47",
    remote = "https://github.com/apple/swift-argument-parser.git",
    shallow_since = "1607637753 -0600",
)

new_git_repository(
    name = "SwiftSyntax",
    build_file = "swift-syntax.BUILD",
    commit = "844574d683f53d0737a9c6d706c3ef31ed2955eb",
    remote = "https://github.com/apple/swift-syntax.git",
    shallow_since = "1600388447 -0700",
)

new_git_repository(
    name = "SwiftFormat",
    build_file = "swift-format.BUILD",
    commit = "12089179aa1668a2478b2b2111d98fa37f3531e3",
    remote = "https://github.com/apple/swift-format.git",
    shallow_since = "1600489295 -0700",
)

# buildifier is written in Go and hence needs rules_go to be built.
# See https://github.com/bazelbuild/rules_go for the up to date setup instructions.

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d1ffd055969c8f8d431e2d439813e42326961d0942bdf734d2c95dc30c369566",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

git_repository(
    name = "com_github_bazelbuild_buildtools",
    commit = "174cbb4ba7d15a3ad029c2e4ee4f30ea4d76edce",
    remote = "https://github.com/bazelbuild/buildtools.git",
    shallow_since = "1607975103 +0100",
)
