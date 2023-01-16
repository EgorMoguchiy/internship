import boto3
AWS_REGION = "eu-central-1" # Frankfurt
EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
KEY_PAIR_NAME = 'my-ssh-key-pair'
key_pair = EC2_RESOURCE.KeyPair(KEY_PAIR_NAME)
key_pair.delete()
print(f'SSH key "{KEY_PAIR_NAME}" successfully deleted')