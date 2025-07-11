@Library('shared-library') _

pipeline {
    agent any

    parameters {
        booleanParam(name: 'DESTROY_INFRA', defaultValue: false, description: 'Check to destroy infrastructure')
    }

    environment {
        TF_IN_AUTOMATION = 'true'
    }

    stages {
        stage('Debug Branch') {
            steps {
                echo "Branch Info - BRANCH_NAME: ${env.BRANCH_NAME}, GIT_BRANCH: ${env.GIT_BRANCH}"
            }
        }

        stage('Terraform Actions') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-keys',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    script {
                        def tf = new org.downtimecrew.Wrapper(this)

                        tf.init()
                        tf.validate()
                        tf.plan()

                        if (env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'main' || env.GIT_BRANCH == 'origin/main') {
                            tf.apply()
                        }

                        if (params.DESTROY_INFRA) {
                            input message: "Are you sure you want to destroy the infrastructure?"
                            tf.destroy()
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Terraform pipeline completed successfully!"
        }
        failure {
            echo "Terraform pipeline failed."
        }
    }
}
