package(
    default_visibility = ["//visibility:public"],
)

cc_library(
    name = "SQLite3",
    srcs = ["sqlite-amalgamation-3330000/sqlite3.c"],
    hdrs = [
        "sqlite-amalgamation-3330000/sqlite3.h",
        "sqlite-amalgamation-3330000/sqlite3ext.h",
    ],
    copts = ["-fPIC"],
    defines = [
        "HAVE_USLEEP",
        "SQLITE_DQS=0",
        "SQLITE_DEFAULT_CACHE_SIZE=128",
        "SQLITE_DEFAULT_CKPTFULLFSYNC",
        "SQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=32768",
        "SQLITE_DEFAULT_PAGE_SIZE=4096",
        "SQLITE_DEFAULT_SYNCHRONOUS=2",
        "SQLITE_DEFAULT_WAL_SYNCHRONOUS=1",
        "SQLITE_ENABLE_API_ARMOR",
        "SQLITE_ENABLE_COLUMN_METADATA",
        "SQLITE_ENABLE_DBSTAT_VTAB",
        "SQLITE_ENABLE_FTS3",
        "SQLITE_ENABLE_FTS3_PARENTHESIS",
        "SQLITE_ENABLE_FTS3_TOKENIZER",
        "SQLITE_ENABLE_FTS4",
        "SQLITE_ENABLE_FTS5",
        "SQLITE_ENABLE_JSON1",
        "SQLITE_ENABLE_PREUPDATE_HOOK",
        "SQLITE_ENABLE_RTREE",
        "SQLITE_ENABLE_SESSION",
        "SQLITE_ENABLE_SNAPSHOT",
        "SQLITE_ENABLE_STMT_SCANSTATUS",
        "SQLITE_ENABLE_UNKNOWN_SQL_FUNCTION",
        "SQLITE_ENABLE_UPDATE_DELETE_LIMIT",
        "SQLITE_HAS_CODEC_RESTRICTED",
        "SQLITE_HAVE_ISNAN",
        "SQLITE_MAX_LENGTH=2147483645",
        "SQLITE_MAX_MMAP_SIZE=20971520",
        "SQLITE_MAX_VARIABLE_NUMBER=500000",
        "SQLITE_OMIT_AUTORESET",
        "SQLITE_OMIT_DEPRECATED",
        "SQLITE_OMIT_PROGRESS_CALLBACK",
        "SQLITE_OMIT_LOAD_EXTENSION",
        "SQLITE_STMTJRNL_SPILL=131072",
        "SQLITE_SUBSTR_COMPATIBILITY",
        "SQLITE_THREADSAFE=2",
        "SQLITE_USE_URI",
    ],
    includes = ["sqlite-amalgamation-3330000"],
    tags = ["swift_module=SQLite3"],
)
