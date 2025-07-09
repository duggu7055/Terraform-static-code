@Library('shared-library') _

node {
    // Set environment variables
    env.GIT_BRANCH = 'main'
    env.GIT_REPO_URL = 'https://github.com/duggu7055/Terraform-static-code.git'
    env.GIT_CREDS_ID = 'downtime_github'  // Update this if your credentials ID is different

    // Directory where your Terraform code exists
    def terraformDirectory = 'Network-skelton/VPC'

    // Use the shared library's Terraform class
    def terraformPipeline = new org.downtimecrew.template.terraformCD.Terraform()

    // Execute pipeline steps
    terraformPipeline.call(
        env.GIT_REPO_URL,
        env.GIT_BRANCH,
        env.GIT_CREDS_ID,
        terraformDirectory
    )
}
