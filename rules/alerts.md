# Alerts

## Rule Groups

* [blackbox-exporter](#blackbox-exporter)
* [blocky](#blocky)
* [cert-manager](#cert-manager)
* [coredns](#coredns)
* [discord-stock-ticker](#discord-stock-ticker)
* [flux](#flux)
* [lidarr](#lidarr)
* [loki](#loki)
* [minio](#minio)
* [nut-exporter](#nut-exporter)
* [postgres-exporter](#postgres-exporter)
* [promtail](#promtail)
* [qbittorrent-exporter](#qbittorrent-exporter)
* [radarr](#radarr)
* [redis-exporter](#redis-exporter)
* [snmp-exporter](#snmp-exporter)
* [sonarr](#sonarr)
* [speedtest-exporter](#speedtest-exporter)
* [thanos-bucket-replicate](#thanos-bucket-replicate)
* [thanos-compact](#thanos-compact)
* [thanos-query](#thanos-query)
* [thanos-receive](#thanos-receive)
* [thanos-ruler](#thanos-ruler)
* [thanos-sidecar](#thanos-sidecar)
* [thanos-store](#thanos-store)
* [traefik](#traefik)

## blackbox-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|BlackboxExporterDown|Blackbox Exporter is down.|Blackbox Exporter has disappeared from Prometheus target discovery.|critical||
|BlackboxProbeFailed|Blackbox probe failed.|Blackbox probe failed on {{ $labels.target }}|critical||
|BlackboxSlowProbe|Blackbox slow probe.|Blackbox probe took more than 1s to complete on {{ $labels.target }}|warning||
|BlackboxProbeHttpFailure|Blackbox probe HTTP failure.|HTTP status code is not 200-399 on {{ $labels.target }}|critical||
|BlackboxProbeSlowHttp|Blackbox probe slow HTTP response|HTTP request took more than 1s to complete on {{ $labels.target }}|warning||
|BlackboxProbeSlowPing|Blackbox probe slow ping.|Blackbox ping took more than 1s to complete on {{ $labels.target }}|warning||

## blocky

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|BlockyAbsent|Blocky is down.|Blocky has disappeared from Prometheus service discovery.|critical||
|BlockyDisabled|Blocky is disabled.|Blocky's ad blocking has been disabled for 15min. Please re-enable protection.|critical||

## cert-manager

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|CertManagerAbsent|Cert Manager has dissapeared from Prometheus service discovery.|New certificates will not be able to be minted, and existing ones can't be renewed until cert-manager is back.|critical|[https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagerabsent](https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagerabsent)|
|CertManagerCertExpirySoon|The cert {{ $labels.name }} is {{ $value | humanizeDuration }} from expiry, it should have renewed over a week ago.|The domain that this cert covers will be unavailable after {{ $value  humanizeDuration }}. Clients using endpoints that this cert protects will start to fail in {{ $value  humanizeDuration }}.|warning|[https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagercertexpirysoon](https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagercertexpirysoon)|
|CertManagerCertNotReady|The cert {{ $labels.name }} is not ready to serve traffic.|This certificate has not been ready to serve traffic for at least 10m. If the cert is being renewed or there is another valid cert, the ingress controller _may_ be able to serve that instead.|critical|[https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagercertnotready](https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagercertnotready)|
|CertManagerHittingRateLimits|Cert manager hitting LetsEncrypt rate limits.|Depending on the rate limit, cert-manager may be unable to generate certificates for up to a week.|critical|[https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagerhittingratelimits](https://gitlab.com/uneeq-oss/cert-manager-mixin/-/blob/master/RUNBOOK.md#certmanagerhittingratelimits)|

## coredns

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|CoreDNSAbsent|CoreDNS is down.|CoreDNS has disappeared from Prometheus target discovery.|critical|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsdown](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsdown)|
|CoreDNSPanicCount|CoreDNS encountering panics.|CoreDNS is encountering {{ $value }} panics.|critical||
|CoreDNSLatencyHigh|CoreDNS is experiencing latency.|CoreDNS has 99th percentile latency of {{ $value }} seconds for server {{ $labels.server }} zone {{ $labels.zone }}.|critical|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednslatencyhigh](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednslatencyhigh)|
|CoreDNSErrorsHigh|CoreDNS is returning SERVFAIL.|CoreDNS is returning SERVFAIL for {{ $value  humanizePercentage }} of requests.|critical|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednserrorshigh](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednserrorshigh)|
|CoreDNSForwardLatencyHigh|CoreDNS high forward latency.|CoreDNS has 99th percentile latency of {{ $value }} seconds forwarding requests to {{ $labels.to }}.|critical|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwardlatencyhigh](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwardlatencyhigh)|
|CoreDNSForwardErrorsHigh|CoreDNS high forward errors.|CoreDNS is returning SERVFAIL for {{ $value  humanizePercentage }} of forward requests to {{ $labels.to }}.|critical|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwarderrorshigh](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwarderrorshigh)|
|CoreDNSForwardHealthcheckFailureCount|CoreDNS upstream server health failures.|CoreDNS health checks have failed to upstream server {{ $labels.to }}.|warning|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwardhealthcheckfailurecount](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwardhealthcheckfailurecount)|
|CoreDNSForwardHealthcheckBrokenCount|CoreDNS upstream servers health failed.|CoreDNS health checks have failed for all upstream servers.|critical|[https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwardhealthcheckbrokencount](https://github.com/povilasv/coredns-mixin/tree/master/runbook.md#alert-name-corednsforwardhealthcheckbrokencount)|

## discord-stock-ticker

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|DiscordStockTickerAbsent|Discord Stock Ticker is down.|Discord Stock Ticker has disappeared from Prometheus service discovery.|critical||
|ZeroTickers|Bot has 0 tickers.|Discord Stock Ticker did not receive the payload to the api.|critical||

## flux

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|FluxComponentAbsent|Flux component is down.|Flux component has disappeared from Prometheus target discovery.|critical||
|FluxReconciliationFailure|Flux reconciliation failure.|{{ $labels.kind }} {{ $labels.namespace }}/{{ $labels.name }} reconciliation has been failing for more than ten minutes.|critical||

## lidarr

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ExportarrAbsent|Exportarr is down.|Lidarr Exportarr has disappeared from Prometheus service discovery.|critical||
|LidarrDown|Lidarr is down.|Lidarr service is down.|critical||

## loki

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|LokiAbsent|Loki is down.|Loki has disappeared from Prometheus service discovery.|critical||
|LokiRequestErrors|Loki high error rate.|Loki is experiencing {{ $value  humanizePercentage }} of errors on {{ $labels.job }} {{ $labels.route }}.|critical||
|LokiRequestPanics|Loki request panics.|Loki is experiencing {{ $value  humanizePercentage }} increase of panics on {{ $labels.job }}.|critical||
|LokiRequestLatency|Loki request latency.|Loki is experiencing {{ $value }}s 99th percentile latency on {{ $labels.job }} {{ $labels.route }}.|critical||

## minio

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|MinioAbsent|MinIO component has disappeared.|MinIO component has dissapeared from Prometheus service discovery.|critical||
|MinioDiskOffline|MinIO disk(s) offline.|MinIO is reporting {{ $value }} disk(s) offline on server {{ $labels.server }}|critical||
|MinioNodeOffline|MinIO node is offline.|MinIO is reporting that node {{ $labels.server }} is offline.|critical||
|MinioClusterUsage|MinIO cluster is low on capacity.|MinIO cluster is reporting less than 10% storage free. {{ $value  humanizePercentage }} of cluster storage is available.|warning||
|MinioNodeDiskUsage|MinIO node is low on disk space.|MinIO node is reporting less than 10% disk space available. {{ $value  humanizePercentage }} of disk space available on node {{ $labels.server }}|warning||

## nut-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|NutExporterAbsent|NUT Exporter is down.|NUT Exporter has disappeared from Prometheus target discovery.|critical||
|UpsStatusUnknown|UPS status unknown.|UPS {{ $labels.ups }} is reporting a status of unknown.|critical||
|UpsOnBattery|UPS is running on battery.|UPS {{ $labels.ups }} has lost power and is running on battery.|critical||
|UpsLowBattery|UPS battery is low.|UPS {{ $labels.ups }} battery is low and the system is getting ready to shutdown.|critical||

## postgres-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|PostgresqlExporterAbsent|Postgresql Exporter is down.|Postgresql Exporter has disappeared from Prometheus target discovery.|critical||
|PostgreSQLMaxConnectionsReached|{{ $labels.instance }} has maxed out Postgres connections.|{{ $labels.instance }} is exceeding the currently configured maximum Postgres connection limit (current value: {{ $value }}s). Services may be degraded - please take immediate action (you probably need to increase max_connections in the Docker image and re-deploy.|critical||
|PostgreSQLHighConnections|{{ $labels.instance }} is over 80% of max Postgres connections.|{{ $labels.instance }} is exceeding 80% of the currently configured maximum Postgres connection limit (current value: {{ $value }}s). Please check utilization graphs and confirm if this is normal service growth, abuse or an otherwise temporary condition or if new resources need to be provisioned (or the limits increased, which is mostly likely).|critical||
|PostgreSQLDown|PostgreSQL is not processing queries: {{ $labels.instance }}|{{ $labels.instance }} is rejecting query requests from the exporter, and thus probably not allowing DNS requests to work either. User services should not be effected provided at least 1 node is still alive.|critical||
|PostgreSQLSlowQueries|PostgreSQL high number of slow on {{ $labels.cluster }} for database {{ $labels.datname }}|PostgreSQL high number of slow queries {{ $labels.cluster }} for database {{ $labels.datname }} with a value of {{ $value }} |critical||
|PostgreSQLQPS|PostgreSQL high number of queries per second {{ $labels.cluster }} for database {{ $labels.datname }}|PostgreSQL high number of queries per second on {{ $labels.cluster }} for database {{ $labels.datname }} with a value of {{ $value }}|critical||
|PostgreSQLCacheHitRatio|PostgreSQL low cache hit rate on {{ $labels.cluster }} for database {{ $labels.datname }}|PostgreSQL low on cache hit rate on {{ $labels.cluster }} for database {{ $labels.datname }} with a value of {{ $value }}|critical||

## promtail

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|PromtailAbsent|Promtail is down.|Promtail has disappeared from Prometheus target discovery.|critical||
|PromtailRequestsErrors|Promtail request errors.|Promtail host {{ $labels.host }} is experiencing {{ $value  humanizePercentage }} errors.|critical||
|PromtailRequestLatency|Promtail request high latency.|Promtail host {{ $labels.host }} is experiencing {{ $value }}s 99th percentile latency.|critical||
|PromtailFileLagging|Promtail file lagging.|Log file for {{ $labels.instance }} {{ $labels.job }} {{ $labels.path }} has been lagging by more than 1MB for more than 15m.|warning||
|PromtailFileMissing|Promtail file missing.|Log file for {{ $labels.instance }} {{ $labels.job }} {{ $labels.path }} matches the glob but is not being tailed.|critical||

## qbittorrent-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|qBittorrentExporterAbsent|qBittorrent Exporter is down.|qBittorrent Exporter has disappeared from Prometheus service discovery.|critical||
|qBittorrentDown|qBittorrent is down.|qBittorrent service is down.|critical||

## radarr

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ExportarrAbsent|Exportarr is down.|Radarr Exportarr has disappeared from Prometheus service discovery.|critical||
|RadarrDown|Radarr is down.|Radarr service is down.|critical||

## redis-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|RedisExporterAbsent|Redis Exporter is down.|Redis Exporter has disappeared from Prometheus target discovery.|critical||
|RedisDown|Redis is down.|Redis service is down.|critical||
|RedisMissingMaster|Redis missing master.|Redis cluster has no node marked as master.|critical||
|RedisTooManyMasters|Redis too many masters.|Redis cluster has too many nodes marked as master.|critical||
|RedisDisconnectedSlaves|Redis disconnected slaves.|Redis not replicating for all slaves. Consider reviewing the redis replication status.|critical||
|RedisReplicationBroken|Redis replication broken.|Redis instance lost a slave.|critical||
|RedisClusterFlapping|Redis cluster flapping.|Changes have been detected in Redis replica connection. This can occur when replica nodes lose connection to the master and reconnect (a.k.a flapping).|critical||
|RedisMissingBackup|Redis missing backup.|Redis has not been backuped for 24 hours.|critical||
|RedisOutOfSystemMemory|Redis out of system memory.|Redis is running out of system memory (> 90%).|warning||
|RedisOutOfConfiguredMaxmemory|Redis out of configured maxmemory.|Redis is running out of configured maxmemory (> 90%).|warning||
|RedisTooManyConnections|Redis too many connections.|Redis instance has too many connections.|warning||
|RedisNotEnoughConnections|Redis not enough connections.|Redis instance should have more connections (> 5).|warning||
|RedisRejectedConnections|Redis rejected connections.|Some connections to Redis has been rejected.|critical||
|RedisKeyEviction|Redis instance {{ $labels.instance }} has evicted keys.|Redis instance {{ $labels.instance }} has evicted {{ $value }} keys in the last 5 minutes.|warning||

## snmp-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|SnmpExporterAbsent|SNMP Exporter is down.|SNMP Exporter has disappeared from Prometheus target discovery.|critical||
|SnmpExporterScrapeSlow|SNMP Exporter slow scraping.|SNMP Exporter is experiencing slow scraping of {{ $labels.job }} with a duration of {{ $value }} seconds.|critical||

## sonarr

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ExportarrAbsent|Exportarr is down.|Sonarr Exportarr has disappeared from Prometheus service discovery.|critical||
|SonarrDown|Sonarr is down.|Sonarr service is down.|critical||

## speedtest-exporter

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|SpeedtestExporterAbsent|Speedtest Exporter is down.|Speedtest Exporter has disappeared from Prometheus target discovery.|critical||
|SpeedtestSlowInternetDownload|SpeedTest slow internet download.|Internet download speed is averaging {{ humanize $value }} Mbps.|warning||
|SpeedtestSlowInternetUpload|SpeedTest slow internet upload.|Internet upload speed is averaging {{ humanize $value }} Mbps.|warning||
|SpeedtestHighPingLatency|SpeedTest high ping latency.|Internet ping latency is averaging {{ humanize $value }} ms.|warning||
|SpeedtestHighJitterLatency|SpeedTest high jitter latency.|Internet jitter latency is averaging {{ humanize $value }} ms.|warning||

## thanos-bucket-replicate

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosBucketReplicateIsDown|Thanos component has disappeared.|ThanosBucketReplicate has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosbucketreplicateisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosbucketreplicateisdown)|
|ThanosBucketReplicateErrorRate|Thanose Replicate is failing to run.|Thanos Replicate is failing to run, {{$value  humanize}}% of attempts failed.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosbucketreplicateerrorrate](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosbucketreplicateerrorrate)|
|ThanosBucketReplicateRunLatency|Thanos Replicate has a high latency for replicate operations.|Thanos Replicate {{$labels.job}} has a 99th percentile latency of {{$value}} seconds for the replicate operations.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosbucketreplicaterunlatency](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosbucketreplicaterunlatency)|

## thanos-compact

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosCompactIsDown|Thanos component has disappeared.|ThanosCompact has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompactisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompactisdown)|
|ThanosCompactMultipleRunning|Thanos Compact has multiple instances running.|No more than one Thanos Compact instance should be running at once. There are {{$value}} instances running.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompactmultiplerunning](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompactmultiplerunning)|
|ThanosCompactHalted|Thanos Compact has failed to run ans is now halted.|Thanos Compact {{$labels.job}} has failed to run and now is halted.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompacthalted](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompacthalted)|
|ThanosCompactHighCompactionFailures|Thanos Compact is failing to execute compactions.|Thanos Compact {{$labels.job}} is failing to execute {{$value  humanize}}% of compactions.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompacthighcompactionfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompacthighcompactionfailures)|
|ThanosCompactBucketHighOperationFailures|Thanos Compact Bucket is having a high number of operation failures.|Thanos Compact {{$labels.job}} Bucket is failing to execute {{$value  humanize}}% of operations.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompactbuckethighoperationfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompactbuckethighoperationfailures)|
|ThanosCompactHasNotRun|Thanos Compact has not uploaded anything for last 24 hours.|Thanos Compact {{$labels.job}} has not uploaded anything for 24 hours.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompacthasnotrun](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanoscompacthasnotrun)|

## thanos-query

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosQueryIsDown|Thanos component has disappeared.|ThanosQuery has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryisdown)|
|ThanosQueryHttpRequestQueryErrorRateHigh|Thanos Query is failing to handle requests.|Thanos Query {{$labels.job}} is failing to handle {{$value  humanize}}% of "query" requests.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryhttprequestqueryerrorratehigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryhttprequestqueryerrorratehigh)|
|ThanosQueryHttpRequestQueryRangeErrorRateHigh|Thanos Query is failing to handle requests.|Thanos Query {{$labels.job}} is failing to handle {{$value  humanize}}% of "query_range" requests.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryhttprequestqueryrangeerrorratehigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryhttprequestqueryrangeerrorratehigh)|
|ThanosQueryGrpcServerErrorRate|Thanos Query is failing to handle requests.|Thanos Query {{$labels.job}} is failing to handle {{$value  humanize}}% of requests.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosquerygrpcservererrorrate](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosquerygrpcservererrorrate)|
|ThanosQueryGrpcClientErrorRate|Thanos Query is failing to send requests.|Thanos Query {{$labels.job}} is failing to send {{$value  humanize}}% of requests.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosquerygrpcclienterrorrate](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosquerygrpcclienterrorrate)|
|ThanosQueryHighDNSFailures|Thanos Query is having high number of DNS failures.|Thanos Query {{$labels.job}} have {{$value  humanize}}% of failing DNS queries for store endpoints.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryhighdnsfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryhighdnsfailures)|
|ThanosQueryInstantLatencyHigh|Thanos Query has high latency for queries.|Thanos Query {{$labels.job}} has a 99th percentile latency of {{$value}} seconds for instant queries.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryinstantlatencyhigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryinstantlatencyhigh)|
|ThanosQueryRangeLatencyHigh|Thanos Query has high latency for queries.|Thanos Query {{$labels.job}} has a 99th percentile latency of {{$value}} seconds for range queries.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryrangelatencyhigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosqueryrangelatencyhigh)|

## thanos-receive

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosReceiveIsDown|Thanos component has disappeared.|ThanosReceive has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceiveisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceiveisdown)|
|ThanosReceiveHttpRequestErrorRateHigh|Thanos Receive is failing to handle requests.|Thanos Receive {{$labels.job}} is failing to handle {{$value  humanize}}% of requests.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehttprequesterrorratehigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehttprequesterrorratehigh)|
|ThanosReceiveHttpRequestLatencyHigh|Thanos Receive has high HTTP requests latency.|Thanos Receive {{$labels.job}} has a 99th percentile latency of {{ $value }} seconds for requests.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehttprequestlatencyhigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehttprequestlatencyhigh)|
|ThanosReceiveHighReplicationFailures|Thanos Receive is having high number of replication failures.|Thanos Receive {{$labels.job}} is failing to replicate {{$value  humanize}}% of requests.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehighreplicationfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehighreplicationfailures)|
|ThanosReceiveHighForwardRequestFailures|Thanos Receive is failing to forward requests.|Thanos Receive {{$labels.job}} is failing to forward {{$value  humanize}}% of requests.|info|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehighforwardrequestfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehighforwardrequestfailures)|
|ThanosReceiveHighHashringFileRefreshFailures|Thanos Receive is failing to refresh hasring file.|Thanos Receive {{$labels.job}} is failing to refresh hashring file, {{$value  humanize}} of attempts failed.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehighhashringfilerefreshfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivehighhashringfilerefreshfailures)|
|ThanosReceiveConfigReloadFailure|Thanos Receive has not been able to reload configuration.|Thanos Receive {{$labels.job}} has not been able to reload hashring configurations.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceiveconfigreloadfailure](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceiveconfigreloadfailure)|
|ThanosReceiveNoUpload|Thanos Receive has not uploaded latest data to object storage.|Thanos Receive {{$labels.instance}} has not uploaded latest data to object storage.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivenoupload](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivenoupload)|
|ThanosReceiveTrafficBelowThreshold|Thanos Receive is experiencing low avg. 1-hr ingestion rate relative to avg. 12-hr ingestion rate.|At Thanos Receive {{$labels.job}} in {{$labels.namespace}} , the average 1-hr avg. metrics ingestion rate  is {{$value  humanize}}% of 12-hr avg. ingestion rate.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivetrafficbelowthreshold](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosreceivetrafficbelowthreshold)|

## thanos-ruler

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosRuleIsDown|Thanos component has disappeared.|ThanosRule has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosruleisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosruleisdown)|
|ThanosRuleQueueIsDroppingAlerts|Thanos Rule is failing to queue alerts.|Thanos Rule {{$labels.instance}} is failing to queue alerts.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulequeueisdroppingalerts](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulequeueisdroppingalerts)|
|ThanosRuleSenderIsFailingAlerts|Thanos Rule is failing to send alerts to alertmanager.|Thanos Rule {{$labels.instance}} is failing to send alerts to alertmanager.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulesenderisfailingalerts](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulesenderisfailingalerts)|
|ThanosRuleHighRuleEvaluationFailures|Thanos Rule is failing to evaluate rules.|Thanos Rule {{$labels.instance}} is failing to evaluate rules.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulehighruleevaluationfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulehighruleevaluationfailures)|
|ThanosRuleHighRuleEvaluationWarnings|Thanos Rule has high number of evaluation warnings.|Thanos Rule {{$labels.instance}} has high number of evaluation warnings.|info|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulehighruleevaluationwarnings](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulehighruleevaluationwarnings)|
|ThanosRuleRuleEvaluationLatencyHigh|Thanos Rule has high rule evaluation latency.|Thanos Rule {{$labels.instance}} has higher evaluation latency than interval for {{$labels.rule_group}}.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosruleruleevaluationlatencyhigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosruleruleevaluationlatencyhigh)|
|ThanosRuleGrpcErrorRate|Thanos Rule is failing to handle grpc requests.|Thanos Rule {{$labels.job}} is failing to handle {{$value  humanize}}% of requests.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulegrpcerrorrate](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulegrpcerrorrate)|
|ThanosRuleConfigReloadFailure|Thanos Rule has not been able to reload configuration.|Thanos Rule {{$labels.job}} has not been able to reload its configuration.|info|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosruleconfigreloadfailure](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosruleconfigreloadfailure)|
|ThanosRuleQueryHighDNSFailures|Thanos Rule is having high number of DNS failures.|Thanos Rule {{$labels.job}} has {{$value  humanize}}% of failing DNS queries for query endpoints.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulequeryhighdnsfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulequeryhighdnsfailures)|
|ThanosRuleAlertmanagerHighDNSFailures|Thanos Rule is having high number of DNS failures.|Thanos Rule {{$labels.instance}} has {{$value  humanize}}% of failing DNS queries for Alertmanager endpoints.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulealertmanagerhighdnsfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulealertmanagerhighdnsfailures)|
|ThanosRuleNoEvaluationFor10Intervals|Thanos Rule has rule groups that did not evaluate for 10 intervals.|Thanos Rule {{$labels.job}} has {{$value  humanize}}% rule groups that did not evaluate for at least 10x of their expected interval.|info|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulenoevaluationfor10intervals](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosrulenoevaluationfor10intervals)|
|ThanosNoRuleEvaluations|Thanos Rule did not perform any rule evaluations.|Thanos Rule {{$labels.instance}} did not perform any rule evaluations in the past 10 minutes.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosnoruleevaluations](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosnoruleevaluations)|

## thanos-sidecar

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosSidecarIsDown|Thanos component has disappeared.|ThanosSidecar has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarisdown)|
|ThanosSidecarPrometheusDown|Thanos Sidecar cannot connect to Prometheus|Thanos Sidecar {{$labels.instance}} cannot connect to Prometheus.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarprometheusdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarprometheusdown)|
|ThanosSidecarBucketOperationsFailed|Thanos Sidecar bucket operations are failing|Thanos Sidecar {{$labels.instance}} bucket operations are failing|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarbucketoperationsfailed](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarbucketoperationsfailed)|
|ThanosSidecarNoConnectionToStartedPrometheus|Thanos Sidecar cannot access Prometheus, even though Prometheus seems healthy and has reloaded WAL.|Thanos Sidecar {{$labels.instance}} is unhealthy.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarnoconnectiontostartedprometheus](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanossidecarnoconnectiontostartedprometheus)|

## thanos-store

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|ThanosStoreIsDown|Thanos component has disappeared.|ThanosStore has disappeared. Prometheus target for the component cannot be discovered.|critical|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoreisdown](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoreisdown)|
|ThanosStoreGrpcErrorRate|Thanos Store is failing to handle qrpcd requests.|Thanos Store {{$labels.job}} is failing to handle {{$value  humanize}}% of requests.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoregrpcerrorrate](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoregrpcerrorrate)|
|ThanosStoreSeriesGateLatencyHigh|Thanos Store has high latency for store series gate requests.|Thanos Store {{$labels.job}} has a 99th percentile latency of {{$value}} seconds for store series gate requests.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoreseriesgatelatencyhigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoreseriesgatelatencyhigh)|
|ThanosStoreBucketHighOperationFailures|Thanos Store Bucket is failing to execute operations.|Thanos Store {{$labels.job}} Bucket is failing to execute {{$value  humanize}}% of operations.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstorebuckethighoperationfailures](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstorebuckethighoperationfailures)|
|ThanosStoreObjstoreOperationLatencyHigh|Thanos Store is having high latency for bucket operations.|Thanos Store {{$labels.job}} Bucket has a 99th percentile latency of {{$value}} seconds for the bucket operations.|warning|[https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoreobjstoreoperationlatencyhigh](https://github.com/thanos-io/thanos/tree/main/mixin/runbook.md#alert-name-thanosstoreobjstoreoperationlatencyhigh)|

## traefik

|Name|Summary|Description|Severity|Runbook|
|---|---|---|---|---|
|TraefikAbsent|Traefik is down.|Traefik has disappeared from Prometheus service discovery.|critical||
|TraefikConfigError|Traefik config error.|Traefik has failed to load the config file. Check Traefik logs for exact parsing error.|critical||
|TraefikHighHttp4xxErrorRateService|Traefik has a high HTTP 4xx error rate.|Traefik is reporting {{ $value  humanizePercentage }} of 4xx errors on {{ $labels.service }}.|critical||
|TraefikHighHttp5xxErrorRateService|Traefik has a high HTTP 5xx error rate.|Traefik is reporting {{ $value  humanizePercentage }} of 5xx errors on {{ $labels.service }}.|critical||
|TraefikTooManyRequest|Traefik has too many open connections.|Traefik is reporting {{ $value }} of open connections on entrypoint {{ $labels.entrypoint }}.|critical||
