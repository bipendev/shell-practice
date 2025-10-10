RUNNING=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)
echo "Instances Running: $RUNNING"

DELETE=$(aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text))
echo "Deleted Instances and current running instances are: $RUNNING"

