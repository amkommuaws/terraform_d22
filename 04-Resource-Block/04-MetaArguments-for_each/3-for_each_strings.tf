# Requirement : I want to create some users in AWS 



resource "aws_iam_user" "tf-user-new" {
   for_each = toset([ "maha", "krishna" ])
  name = each.key
  #name = each.value
}



# If u are using for_each set of strings then each.key = each.value