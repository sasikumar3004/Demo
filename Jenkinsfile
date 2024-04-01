pipeline {
    agent any
    tools {
      terraform 'Terraform'
    }

parameters {
        choice(
            choices: ['plan', 'apply', 'show', 'preview-destroy', 'destroy'],
            description: 'Terraform action to apply',
            name: 'action')
}

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'PROD', poll: false, url: 'https://github.com/sasikumar3004/Demo.git'
                }
       }
        stage('Init') {
            steps {
                bat 'terraform init'
            }
}
        stage('plan') {
            when {
                expression { params.action == 'plan' || params.action == 'apply' }
            }
                steps {
                bat 'terraform plan -no-color -input=false -out=tfplan --var-file=C:\\terraform\\PlanOutput.vars'
            }
        }         

            stage('Apply') {
            steps {
                bat 'terraform apply'
            }
}
}
}
