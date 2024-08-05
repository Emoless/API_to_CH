ATTACH TABLE _ UUID '4a39b752-2ab1-4ee8-9f12-5861cf706280'
(
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
    `memory_usage` Int64,
    `peak_memory_usage` Int64,
    `thread_name` String,
    `thread_id` UInt64,
    `master_thread_id` UInt64,
    `current_database` String,
    `query` String,
    `normalized_query_hash` UInt64,
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
    `ProfileEvents` Map(String, UInt64),
    `ProfileEvents.Names` Array(String) ALIAS mapKeys(ProfileEvents),
    `ProfileEvents.Values` Array(UInt64) ALIAS mapValues(ProfileEvents)
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192
