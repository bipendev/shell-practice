# RUNNING=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)
# echo "Instances Running: $RUNNING"

# DELETE=$(aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text))
# echo "Deleted Instances and current running instances are: $RUNNING"

#!/bin/bash

# Get all running instances
RUNNING=$(aws ec2 describe-instances \
    --filters "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text)

if [ -z "$RUNNING" ]; then
    echo "No running instances found."
    exit 0
fi

echo "Instances to be terminated: $RUNNING"

# Terminate instances
aws ec2 terminate-instances --instance-ids $RUNNING

# Wait until instances are terminated
echo "Waiting for instances to terminate..."
aws ec2 wait instance-terminated --instance-ids $RUNNING

# Verify
TERMINATED=$(aws ec2 describe-instances \
    --filters "Name=instance-state-name,Values=terminated" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text)

echo "Terminated instances: $TERMINATED"
