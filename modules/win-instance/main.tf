# Terraform module to create a Watchmaker Windows instance using a CloudFormation cfn.json
# Assumes that watchmaker-win-instance.cfn.json is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-win-instance" {
  template_body = "${file("${path.module}/watchmaker-win-instance.template.cfn.yaml")}"

  name               = "${var.Name}"
  capabilities       = "${var.Capabilities}"
  disable_rollback   = "${var.DisableRollback}"
  iam_role_arn       = "${var.IamRoleArn}"
  notification_arns  = "${var.NotificationArns}"
  on_failure         = "${var.OnFailureAction}"
  policy_body        = "${var.PolicyBody}"
  policy_url         = "${var.PolicyUrl}"
  tags               = "${var.StackTags}"
  timeout_in_minutes = "${var.TimeoutInMinutes}"

  parameters {
    AmiId                  = "${var.AmiId}"
    AppScriptParams        = "${var.AppScriptParams}"
    AppScriptUrl           = "${var.AppScriptUrl}"
    AppVolumeDevice        = "${var.AppVolumeDevice}"
    AppVolumeSize          = "${var.AppVolumeSize}"
    AppVolumeType          = "${var.AppVolumeType}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    CloudWatchAgentUrl     = "${var.CloudWatchAgentUrl}"
    CloudWatchAppLogs      = "${join(",", var.CloudWatchAppLogs)}"
    InstanceRole           = "${var.InstanceRole}"
    InstanceType           = "${var.InstanceType}"
    KeyPairName            = "${var.KeyPairName}"
    NoPublicIp             = "${var.NoPublicIp}"
    NoReboot               = "${var.NoReboot}"
    PatchGroup             = "${var.PatchGroup}"
    PrivateIp              = "${var.PrivateIp}"
    PypiIndexUrl           = "${var.PypiIndexUrl}"
    PythonInstaller        = "${var.PythonInstaller}"
    SecurityGroupIds       = "${var.SecurityGroupIds}"
    SubnetId               = "${var.SubnetId}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
    WatchmakerAdminGroups  = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers   = "${var.WatchmakerAdminUsers}"
    WatchmakerBootstrapper = "${var.WatchmakerBootstrapper}"
    WatchmakerComputerName = "${var.WatchmakerComputerName}"
    WatchmakerConfig       = "${var.WatchmakerConfig}"
    WatchmakerEnvironment  = "${var.WatchmakerEnvironment}"
    WatchmakerExtraArgs    = "${var.WatchmakerExtraArgs}"
    WatchmakerOuPath       = "${var.WatchmakerOuPath}"
  }
}
