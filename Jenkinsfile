pipeline {
   agent any

   stages {
      stage('TF Plan') {
        steps {
           dir('.'){
                //bat 'terraform init'
                //bat 'terraform plan -out myplan'
            }
        }
     }
     stage('Create Packer AMI') {
        steps {
          dir('infrastructure/packer/jenkins_aws/') {
            
            // Download packer and build AMI
            bat 'wget -c https://releases.hashicorp.com/packer/1.1.0/packer_1.1.0_linux_amd64.zip'
            bat 'unzip -o packer_1.1.0_linux_amd64.zip'
            bat './packer build -color=false jenkins_agent_ami.json'

            // Update AMI in Jenkins EC2 plugin
            //sh 'wget -c https://raw.githubusercontent.com/burukuru/jenkins-update-ec2-ami/master/jenkins-update-ec2-ami.py'
            //sh 'pip install requests boto'
            //sh 'JENKINS_AUTH_USER="packer" JENKINS_AUTH_PASSWORD="SECRETPASSWORD" EC2_CLOUD_INSTANCE=ec2 AMI_PROFILE_NAME="aws-jenkins-agent" AWS_REGION="eu-west-1" python jenkins-update-ec2-ami.py'
        }
      }
    }
  }
}
