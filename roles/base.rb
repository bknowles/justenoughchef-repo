name "base"
description "Default run_list for Just Enough Chef Tutorial"
run_list(
  "recipe[base]"
  )

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["ubuntu"],
      "passwordless" => fales
    }
  }
  )
