pipeline:
  agent any

  environment:
    TF_VAR_environment: "${env.ENVIRONMENT}"

  parameters:
    - string:
        name: ENVIRONMENT
        default: 'management'
        description: 'Select environment (management, prod, preprod, etc)'

  stages:
    - stage: Checkout
      steps:
        - checkout scm

    - stage: Init
      steps:
        - dir("landing_zone/${ENVIRONMENT}") {
            sh 'terraform init'
          }

    - stage: Validate
      steps:
        - dir("landing_zone/${ENVIRONMENT}") {
            sh 'terraform validate'
          }

    - stage: Plan
      steps:
        - dir("landing_zone/${ENVIRONMENT}") {
            sh 'terraform plan -out=tfplan'
          }

    - stage: Approval
      steps:
        - input:
            message: "Do you want to proceed with Terraform Apply for ${ENVIRONMENT}?"
            ok: "Yes, Apply"

    - stage: Apply
      steps:
        - dir("landing_zone/${ENVIRONMENT}") {
            sh 'terraform apply -auto-approve tfplan'
          }

  post:
    always:
      steps:
        - echo 'Pipeline finished'
