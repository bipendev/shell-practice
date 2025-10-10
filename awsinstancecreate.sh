INSTANCE=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-02236654aa239ac1b --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ansible}]' --query 'Instances[0].InstanceId' --output text)
echo "Launched instance ID: $INSTANCE"
