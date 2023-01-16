import boto3
AWS_REGION = "eu-central-1" # Frankfurt
KEY_PAIR_NAME = 'Keys'
AMI_ID = 'ami-0039da1f3917fa8e3' # Ubuntu 22.04 LTS
SUBNET_ID = 'subnet-04ce51406bdc76d9a' # Main subnet
SECURITY_GROUP_ID = 'sg-0fd202a6d453e5816' # Security group for nginx

EC2_RESOURCE = boto3.resource('ec2', region_name=AWS_REGION)
EC2_CLIENT = boto3.client('ec2', region_name=AWS_REGION)
instances = EC2_RESOURCE.create_instances(
    ImageId=AMI_ID,
    InstanceType='t2.micro',
    KeyName=KEY_PAIR_NAME,
    SecurityGroupIds = [SECURITY_GROUP_ID],
    SubnetId=SUBNET_ID,
    MinCount = 1,
    MaxCount = 1
)

for instance in instances:
    print(f'EC2 instance "{instance.id}" has been launched')
    
    instance.wait_until_running()
    print(f'EC2 instance "{instance.id}" has been started')

    reservations = EC2_CLIENT.describe_instances(InstanceIds=[instance.id])
    for reservation in reservations['Reservations']:
        for instanceInfo in reservation['Instances']:
            print("Image Id: " + instanceInfo.get("ImageId"))
            print("Operating system: " + instanceInfo.get("PlatformDetails"))
            print("Instance type: " + instanceInfo.get("InstanceType"))
            print("Private Ip Address: " + instanceInfo.get("PrivateIpAddress"))
            print("Public Ip Address: " + instanceInfo.get("PublicIpAddress"))

            for volume in instanceInfo['BlockDeviceMappings']:
                volumeId = volume['Ebs']['VolumeId']
            
            volume = EC2_RESOURCE.Volume(volumeId)
            print("Volume Id: {0}\nVolume size: {1} GiB\nVolume state: {2}".format(volume.id, volume.size, volume.state))
