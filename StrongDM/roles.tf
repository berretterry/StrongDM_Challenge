# Create StrongDM Role

resource "sdm_role" "bt_role" {
  name = "bt-role"
  tags = {
      owner = "Berret"
    }

  access_rules = jsonencode([
    {"tags": {
      "owner": "Berret"
      }
    }
  ])
}
