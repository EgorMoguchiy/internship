import boto3
AWS_REGION = "eu-central-1" # Frankfurt
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
key_pair = EC2_RESOURCE.create_key_pair(
    KeyName='my-ssh-key-pair'
)

print(f'SSH key fingerprint: {key_pair.key_fingerprint}')
print(f'Private SSH key: {key_pair.key_material}')