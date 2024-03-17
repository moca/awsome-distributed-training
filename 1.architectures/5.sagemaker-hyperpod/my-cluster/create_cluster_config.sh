source env_vars
cat > cluster-config.json << EOL
{
    "ClusterName": "ml-cluster",
    "InstanceGroups": [
      {
        "InstanceGroupName": "controller-machine",
        "InstanceType": "ml.g5.2xlarge",
        "InstanceCount": 1,
        "LifeCycleConfig": {
          "SourceS3Uri": "s3://${BUCKET}/LifecycleScripts/base-config/",
          "OnCreate": "on_create.sh"
        },
        "ExecutionRole": "${ROLE}",
        "ThreadsPerCore": 1
      },
      {
        "InstanceGroupName": "compute-nodes",
        "InstanceType": "ml.g5.12xlarge",
        "InstanceCount": 2,
        "LifeCycleConfig": {
          "SourceS3Uri": "s3://${BUCKET}/LifecycleScripts/base-config/",
          "OnCreate": "on_create.sh"
        },
        "ExecutionRole": "${ROLE}",
        "ThreadsPerCore": 1
      }
    ],
    "VpcConfig": {
      "SecurityGroupIds": ["$SECURITY_GROUP"],
      "Subnets":["$SUBNET_ID"]
    }
}
EOL