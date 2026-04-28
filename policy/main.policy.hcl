resource_policy "*" "enforce_length" {
  filter = meta.type == "random_string"
  locals {
    # bytes = core::getresources("random_bytes", {})
  }
  enforce {
    # condition = attrs.length >= local.bytes[0].length
    condition = attrs.length >= 12
    error_message = "random_string length must be at least 12"
    info_message = "this is a policy for random_string length enforcement"
  }
}

module_policy "./modules" "source_check" {
  enforce {
    condition     = core::try(attrs.source, "") != "some/other/source"
    error_message = "Module source cannot be some/other/source"
    info_message  = "This is a policy to check module source"
  }
}