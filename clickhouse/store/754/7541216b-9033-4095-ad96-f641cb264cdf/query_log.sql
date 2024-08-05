ATTACH TABLE _ UUID 'c9962275-a39a-4efc-9188-5f048084617a'
(
    `type` Enum8('QueryStart' = 1, 'QueryFinish' = 2, 'ExceptionBeforeStart' = 3, 'ExceptionWhileProcessing' = 4),
    `event_date` Date,
    `event_time` DateTime,
    `event_time_microseconds` DateTime64(6),
    `query_start_time` DateTime,
    `query_start_time_microseconds` DateTime64(6),
    `query_duration_ms` UInt64,
    `read_rows` UInt64,
    `read_bytes` UInt64,
    `written_rows` UInt64,
    `written_bytes` UInt64,
    `result_rows` UInt64,
    `result_bytes` UInt64,
    `memory_usage` UInt64,
    `current_database` String,
    `query` String,
    `formatted_query` String,
    `normalized_query_hash` UInt64,
    `query_kind` LowCardinality(String),
    `databases` Array(LowCardinality(String)),
    `tables` Array(LowCardinality(String)),
    `columns` Array(LowCardinality(String)),
    `projections` Array(LowCardinality(String)),
    `views` Array(LowCardinality(String)),
    `exception_code` Int32,
    `exception` String,
    `stack_trace` String,
    `is_initial_query` UInt8,
    `user` String,
    `query_id` String,
    `address` IPv6,
    `port` UInt16,
    `initial_user` String,
    `initial_query_id` String,
    `initial_address` IPv6,
    `initial_port` UInt16,
    `initial_query_start_time` DateTime,
    `initial_query_start_time_microseconds` DateTime64(6),
    `interface` UInt8,
    `os_user` String,
    `client_hostname` String,
    `client_name` String,
    `client_revision` UInt32,
    `client_version_major` UInt32,
    `client_version_minor` UInt32,
    `client_version_patch` UInt32,
    `http_method` UInt8,
    `http_user_agent` String,
    `http_referer` String,
    `forwarded_for` String,
    `quota_key` String,
    `revision` UInt32,
    `log_comment` String,
    `thread_ids` Array(UInt64),
    `ProfileEvents` Map(String, UInt64),
    `Settings` Map(String, String),
    `used_aggregate_functions` Array(String),
    `used_aggregate_function_combinators` Array(String),
    `used_database_engines` Array(String),
    `used_data_type_families` Array(String),
    `used_dictionaries` Array(String),
    `used_formats` Array(String),
    `used_functions` Array(String),
    `used_storages` Array(String),
    `used_table_functions` Array(String),
    `ProfileEvents.Names` Array(String) ALIAS mapKeys(ProfileEvents),
    `ProfileEvents.Values` Array(UInt64) ALIAS mapValues(ProfileEvents),
    `Settings.Names` Array(String) ALIAS mapKeys(Settings),
    `Settings.Values` Array(String) ALIAS mapValues(Settings)
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192
