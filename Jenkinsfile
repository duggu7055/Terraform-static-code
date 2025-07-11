@Library('shared-library') _

pipeline {
    agent any

    parameters {
        booleanParam(
            name: 'DESTROY_INFRA',
            defaultValue: false,
            description: 'Check to destroy infrastructure'
        )
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
                script {
                    // Instantiate shared library class from src/org/downtimecrew/Wrapper.groovy
                    def wrapper = new org.downtimecrew.Wrapper(this)

                    wrapper.init()
                    wrapper.validate()
                    wrapper.plan()

                    // Proceed only if working on main branch
                    if (env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'main' || env.GIT_BRANCH == 'origin/main') {
                        if (params.DESTROY_INFRA) {
                            input message: 'Are you sure you want to destroy the infrastructure?'
                            wrapper.destroy()
                        } else {
                            wrapper.applyTerraform()
                        }
                    } else {
                        echo "Skipping apply/destroy since branch is not 'main'"
                    }
                }
            }
        }
    }
}
