import paramiko
import urllib
import os

def handler(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    obj_key = urllib.unquote_plus(event['Records'][0]['s3']['object']['key'])

    key = paramiko.RSAKey.from_private_key_file('kp.pem')
    print('Key Found')
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy)
    host = os.environ['HOST']
    print("Connecting to host")
    client.connect(hostname=host, username='ec2-user', pkey=key)
    print("Connected to host")
    file_path = bucket + "/" + obj_key
    std_in, std_out, std_err = client.exec_command("sh /home/ec2-user/code.sh {}".format(file_path) + ' > /dev/null 2>&1 &')
    print(std_out.read())
    print(std_err.read())
   
    print(bucket)
    print(obj_key)
    print(bucket + "/" + obj_key)
    
    return {
        'message': 'completed'
    }

