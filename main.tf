resource "oci_identity_domains_policy" "identity_domains_policies" {
  for_each = var.identity_domains_policies

  idcs_endpoint                = each.value.idcs_endpoint
  name                         = each.value.name
  schemas                      = each.value.schemas
  active                       = each.value.active
  attribute_sets               = each.value.attribute_sets
  attributes                   = each.value.attributes
  authorization                = each.value.authorization
  description                  = each.value.description
  external_id                  = each.value.external_id
  ocid                         = each.value.ocid
  policy_groovy                = each.value.policy_groovy
  resource_type_schema_version = each.value.resource_type_schema_version

  policy_type {
    value = each.value.policy_type.value
  }

  dynamic "rules" {
    for_each = each.value.rules != null ? each.value.rules : []
    content {
      sequence = rules.value.sequence
      value    = rules.value.value
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

