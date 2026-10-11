variable "kibana_osquery_saved_queries" {
  description = <<EOT
Map of kibana_osquery_saved_queries, attributes below
Required:
    - interval
    - query
    - saved_query_id
Optional:
    - description
    - ecs_mapping
    - platform
    - removed
    - snapshot
    - space_id
    - timeouts
    - version
    - kibana_connection (block):
        - api_key (optional)
        - bearer_token (optional)
        - ca_certs (optional)
        - endpoints (optional)
        - insecure (optional)
        - password (optional)
        - username (optional)
EOT

  type = map(object({
    interval       = number
    query          = string
    saved_query_id = string
    description    = optional(string)
    ecs_mapping = optional(map(object({
      field  = optional(string)
      value  = optional(string)
      values = optional(set(string))
    })))
    platform = optional(set(string))
    removed  = optional(bool)
    snapshot = optional(bool)
    space_id = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    version = optional(string)
    kibana_connection = optional(list(object({
      api_key      = optional(string)
      bearer_token = optional(string)
      ca_certs     = optional(list(string))
      endpoints    = optional(list(string))
      insecure     = optional(bool)
      password     = optional(string)
      username     = optional(string)
    })))
  }))
}

