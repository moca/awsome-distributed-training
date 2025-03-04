source env_vars
cat > provisioning_parameters.json << EOL
{
  "version": "1.0.0",
  "workload_manager": "slurm",
  "controller_group": "controller-machine",
  "worker_groups": [
    {
      "instance_group_name": "compute-nodes",
      "partition_name": "dev"
    }
  ],
  "fsx_dns_name": "${FSX_ID}.fsx.${AWS_REGION}.amazonaws.com",
  "fsx_mountname": "${FSX_MOUNTNAME}"
}
EOL
cp provisioning_parameters.json ../LifecycleScripts/base-config/provisioning_parameters.json