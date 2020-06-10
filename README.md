### Terraform

基礎操作流程
terraform init：啟始整個環境，下載必要的檔案，大部分是plugin。

terraform plan：根據遠端環境的情況，對照你的設定檔，提供出Terraform將會做的改變，把計畫呈現給你作參考和對照。
這動作並不會做任何改變，只是列出會增加或刪除的遠端環境設定。

terraform apply：執行所有的環境設定，如果環境已經跟設定檔的情況一樣，就不會有動作。

terraform destroy：刪除取消所有的環境設定，還原到apply之前的狀況。


###aws環境建置



# 設置terraform.tfvars.example
terraform.tfvars.example
編譯相對目錄下的terraform.tfvars.example --> terraform.tfvars

aws_access_key = "<你的 AWS KEY>"
aws_secret_key = "<你的 AWS Secret>"


