import boto3
AWS_REGION = "eu-central-1" # Frankfurt
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
INSTANCE_ID = 'i-0164e8bece75cb407'
instance = EC2_RESOURCE.Instance(INSTANCE_ID)
instance.terminate()
print(f'Terminating EC2 instance: {instance.id}')
    
instance.wait_until_terminated()
print(f'EC2 instance "{instance.id}" has been terminated')