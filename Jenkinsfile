@Library('shared-library') _  // ✅ Use the correct library name from Jenkins

import org.downtimecrew.template.terraformCD.Terraform  // ✅ Correct class import based on your structure

node {
    // Set required environment variables
    env.GIT_BRANCH     = 'main'
    env.GIT_REPO_URL   = 'https://github.com/snaatak-Downtime-Crew/Terraform-static-code.git'
    env.GIT_CREDS_ID   = 'downtime_github'
    env.AWS_CRED_ID    = 'aws-central-account-creds'
    env.TERRAFORM_DIR  = 'module/ec2'
    env.VAR_FILE       = 'terraform.tfvars'
    env.ACTION         = 'apply' // or 'destroy'

    stage('Run Terraform CD Template') {
        script {
            def pipeline = new Terraform()
            pipeline.call([
                gitBranch    : env.GIT_BRANCH,
                gitRepoUrl   : env.GIT_REPO_URL,
                gitCredsId   : env.GIT_CREDS_ID,
                awsCredId    : env.AWS_CRED_ID,
                terraformDir : env.TERRAFORM_DIR,
                var_file     : env.VAR_FILE,
                action       : env.ACTION
            ])
        }
    }
}
