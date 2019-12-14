pipeline {
   agent any

   stages {
      stage('Set Terraform path') {
	  steps {
		script {
			def tfHome = tool name: 'TF'
			env.PATH = "${tfHome}:${env.PATH}"
		}
		bat 'terraform — version'
	  } 
      }
      stage('TF Plan') {
        steps {
           dir('.'){
                bat 'terraform init'
                bat 'terraform plan -out myplan'
            }
        }
     }
   }
}
