import boto3

ec2_client = boto3.client('ec2', region_name="eu-north-1")
ec2_resource = boto3.resource('ec2', region_name="eu-north-1")
new_vpc = ec2_resource.create_vpc(
    CidrBlock="10.0.0.0/16" 
)
new_vpc.create_subnet(
    CidrBlock="10.0.1.0/24"
)
new_vpc.create_subnet(
    CidrBlock="10.0.2.0/24"
)
new_vpc.create_tags(
    Tags=[
        {
            'Key': 'Name',
            'Value': 'my-vpc'
        }
    ]
)


all_available__vpcs = ec2_client.describe_vpcs()
vpcs = all_available__vpcs["Vpcs"]

for vpc in vpcs:
    print(vpc["VpcId"])
    cide_block_assoc_setes = vpc["CidrBlockAssociationSet"]
    for assoc_set in cide_block_assoc_setes:
        print(assoc_set["CidrBlockState"])
