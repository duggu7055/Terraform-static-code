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
                script {
                    def wrapper = new org.downtimecrew.Wrapper(this)  // ✅ instantiate inside script block

                    wrapper.init()
                    wrapper.validate()
                    wrapper.plan()

                    if (env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'main' || env.GIT_BRANCH == 'origin/main') {
                        if (!params.DESTROY_INFRA) {
                            wrapper.applyTerraform()
                        }

                        if (params.DESTROY_INFRA) {
                            input message: 'Are you sure you want to destroy the infrastructure?'
                            wrapper.destroy()
                        }
                    }
                }
            }
        }
    }
}
