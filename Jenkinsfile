@Library('shared-library') _

import org.downtimecrew.template.terraformCD.Terraform  // <-- This line is required

node {
    // Set environment variables
    env.GIT_BRANCH = 'main'
    env.GIT_REPO_URL = 'https://github.com/duggu7055/Terraform-static-code.git'
    env.GIT_CREDS_ID = 'downtime_github'

    // Directory where your Terraform code exists
    def terraformDirectory = 'Network-skelton/VPC'

    // Instantiate and use the shared class
    def terraformPipeline = new Terraform()

    terraformPipeline.call(
        env.GIT_REPO_URL,
        env.GIT_BRANCH,
        env.GIT_CREDS_ID,
        terraformDirectory
    )
}
