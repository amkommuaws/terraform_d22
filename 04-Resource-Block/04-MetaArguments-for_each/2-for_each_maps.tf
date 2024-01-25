# Thsi block of code will represent for_each with Maps

# 3 buckets 

#Environments: 3 ==== dev, test, stage
#Clinet: boutiqueproject


#buckets : dev-boutiqueproject, test-boutiqueproject, stage-boutiqueproject


resource "aws_s3_bucket" "tf-bucket" {
    for_each = {
      "dev" = "boutiqueproject" 
      "test" = "boutiqueproject"
      "stage" = "boutiqueproject"
    }
    bucket = "${each.key}-${each.value}"
    tags = {
        Environment = each.key
  }
}

