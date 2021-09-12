// # rules defined in file matching "rules/.+"
// prometheus "production" {
//   uri     = "https://prometheus.domain.tld"
//   timeout = "30s"

//   paths = [
//     "rules/.+",
//   ]
// }

rule {
  # Disallow spaces in label/annotation keys, they're only allowed in values.
  reject ".* +.*" {
    label_keys      = true
    annotation_keys = true
  }

  # Disallow URLs in labels, they should go to annotations.
  reject "https?://.+" {
    label_keys   = true
    label_values = true
  }
}

rule {
  # This block will apply to all alerting rules.
  match {
    kind = "alerting"
  }

  # Each alert must have a 'summary' annotation on every alert.
  annotation "summary" {
    severity = "bug"
    required = true
  }

  # Each alert must have a 'description' annotation on every alert.
  annotation "description" {
    severity = "bug"
    required = true
  }

  # Each alert must have a 'severity' annotation that's either 'critical' or 'warning'.
  label "severity" {
    severity = "bug"
    value    = "(info|warning|critical)"
    required = true
  }

  # Check how many times each alert would fire in the last 1d.
  alerts {
    range   = "1d"
    step    = "1m"
    resolve = "5m"
  }

  # Check if '{{ $value }}'/'{{ .Value }}' is used in labels
  # https://www.robustperception.io/dont-put-the-value-in-alert-labels
  value {}

  # Check that comparison operators will not send unlimited alerts.
  comparison {
    severity = "bug"
  }
}

rule {
  # This block will apply to all recording rules.
  match {
    kind = "recording"
  }

  # Ensure that all aggregations are preserving "job" label.
  aggregate ".+" {
    severity = "bug"
    keep     = ["job"]
  }

  # Enable series check that will warn if alert rules are using time series
  # not present in any of configured Prometheus servers.
  series {}

  # Enable cost checks that will print the number of returned time series and try
  # to estimate total memory usage assuming that each series require 4KB of memory.
  cost {
    bytesPerSample = 4096
  }
}
