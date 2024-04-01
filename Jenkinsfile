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
                bat 'terraform plan -no-color -input=false -out=tfplan'
            }
        }    
        stage('approval') {
            when {
                expression { params.action == 'apply' }
            }
                steps {
                bat 'terraform show -no-color tfplan > tfplan.txt'
                    script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }         
          stage('apply') {
            when {
                expression { params.action == 'apply' }
            }
            steps {
                bat 'terraform apply -no-color -input=false tfplan'
            }
        }
        stage('show') {
            when {
                expression { params.action == 'show' }
            }
            steps {
                bat 'terraform show -no-color'
            }
        }
        stage('preview-destroy') {
            when {
                expression { params.action == 'preview-destroy' || params.action == 'destroy'}
            }
            steps {
                bat 'terraform plan -no-color -destroy -out=tfplan'
                bat 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('destroy') {
            when {
                expression { params.action == 'destroy' }
            }
            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Delete the stack?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
                bat 'terraform destroy -no-color -force'
            }
        }
}
}
