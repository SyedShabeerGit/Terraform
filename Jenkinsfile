pipeline {
   agent any

   stages {
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
