source env_vars
CLUSTER_NAME="ml-cluster"
echo "Deployment region is ${AWS_REGION}"

if aws sagemaker list-clusters | grep ${CLUSTER_NAME}; then
    echo "ml-cluster already exists. Deleting it."
    aws sagemaker delete-cluster --cluster-name ml-cluster --region ${AWS_REGION}
fi

aws sagemaker create-cluster  --cli-input-json file://cluster-config.json --region ${AWS_REGION}
