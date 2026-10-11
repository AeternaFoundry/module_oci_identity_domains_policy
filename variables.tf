variable "identity_domains_policies" {
  description = <<EOT
Map of identity_domains_policies, attributes below
Required:
    - idcs_endpoint
    - name
    - schemas
    - policy_type (block):
        - value (required)
Optional:
    - active
    - attribute_sets
    - attributes
    - authorization
    - description
    - external_id
    - ocid
    - policy_groovy
    - resource_type_schema_version
    - rules (block):
        - sequence (required)
        - value (required)
    - tags (block):
        - key (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    idcs_endpoint                = string
    name                         = string
    schemas                      = list(string)
    active                       = optional(bool)
    attribute_sets               = optional(list(string))
    attributes                   = optional(string)
    authorization                = optional(string)
    description                  = optional(string)
    external_id                  = optional(string)
    ocid                         = optional(string)
    policy_groovy                = optional(string)
    resource_type_schema_version = optional(string)
    policy_type = object({
      value = string
    })
    rules = optional(list(object({
      sequence = number
      value    = string
    })))
    tags = optional(list(object({
      key   = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

