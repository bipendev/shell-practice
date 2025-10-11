# #!/bin/bash

# # Create instance
# INSTANCE=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-02236654aa239ac1b --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ansible}]' --query 'Instances[0].InstanceId' --output text)
# echo "Launched instance ID: $INSTANCE"


AMI_ID="ami-09c813fb71547fc4f"
SECURITY_GROUP="sg-02236654aa239ac1b"
INSTANCE_TYPE="t3.micro"
TAG_NAME="ansible"


NUM_INSTANCES=$1

if [ -z "$NUM_INSTANCES" ] || ! [[ "$NUM_INSTANCES" =~ ^[0-9]+$ ]] || [ "$NUM_INSTANCES" -le 0 ]; then
    echo "Usage: $0 <number of instances>"
    exit 1
fi

#creating instance
INSTANCE_IDS=$(aws ec2 run-instances --image-id $AMI_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" --query 'Instances[0].InstanceId' --output text)

if [ -z "$INSTANCE_IDS" ]; then
    echo "Failed to launch instances."
    exit 1
fi

echo "launched instance ID's: $INSTANCE_IDS"

echo "Waiting for instances to be in running state..."

aws ec2 wait instance-running --instance-ids "$INSTANCE_IDS"

echo "ALL Instances are now running!"


