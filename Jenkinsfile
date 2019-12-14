pipeline {
   agent any

   stages {
      stage('Set Terraform path') {
	  steps {
		script {
			def tfHome = tool name: 'TF'
			env.PATH = "${tfHome}:${env.PATH}"
		}	
	  } 
      }
      stage('TF Plan') {
        steps {
           dir('dev'){
                bat 'terraform init'
                bat 'terraform plan -out myplan'
            }
        }
     }
   }
}
