pipeline {
  agent any

  environment {
    ENV_NAME = "prod"
    AWS_REGION = "ap-south-1"
  }

  triggers {
    githubPush()
  }

  stages {
    stage('Checkout') {
      steps {
        echo "Checking out the prod branch code..."
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        echo "Initializing Terraform for ${ENV_NAME}..."
        dir("landing_zone/${ENV_NAME}") {
          withCredentials([usernamePassword(
            credentialsId: 'aws-access-key',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )]) {
            sh 'terraform init'
          }
        }
      }
    }

    stage('Terraform Validate') {
      steps {
        echo "Validating Terraform config for ${ENV_NAME}..."
        dir("landing_zone/${ENV_NAME}") {
          sh 'terraform validate'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        echo "Planning Terraform changes for ${ENV_NAME}..."
        dir("landing_zone/${ENV_NAME}") {
          withCredentials([usernamePassword(
            credentialsId: 'aws-access-key',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )]) {
            sh 'terraform plan -out=tfplan'
          }
        }
      }
    }

    stage('Approval') {
      steps {
        echo "Awaiting manual approval for Terraform apply on ${ENV_NAME}..."
        input message: "Proceed with Terraform Apply for ${ENV_NAME}?"
      }
    }

    stage('Terraform Apply') {
      steps {
        echo "Applying Terraform changes for ${ENV_NAME}..."
        dir("landing_zone/${ENV_NAME}") {
          withCredentials([usernamePassword(
            credentialsId: 'aws-access-key',
            usernameVariable: 'AWS_ACCESS_KEY_ID',
            passwordVariable: 'AWS_SECRET_ACCESS_KEY'
          )]) {
            sh 'terraform apply -auto-approve tfplan'
          }
        }
      }
    }
  }

  post {
    success {
      echo "✅ Terraform apply successful for ${ENV_NAME}."
    }
    failure {
      echo "❌ Terraform deployment failed for ${ENV_NAME}."
    }
    always {
      echo "Pipeline completed for ${ENV_NAME}."
    }
  }
}
