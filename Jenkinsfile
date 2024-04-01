pipeline {
    agent any
    tools {
      terraform 'Terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'PROD', poll: false, url: 'https://github.com/sasikumar3004/Demo.git'
                }
       }
        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
}

            stage('Terraform Apply') {
            steps {
                bat 'terraform apply --auto-approve'
            }
}
}
}
