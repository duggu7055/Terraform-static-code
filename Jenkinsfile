@Library('shared-library') _  // ✅ Your Jenkins shared library name

node {
    // 🔧 Set environment variables
    env.GIT_BRANCH     = 'main'
    env.GIT_REPO_URL   = 'https://github.com/snaatak-Downtime-Crew/Terraform-static-code.git'
    env.GIT_CREDS_ID   = 'downtime_github'
    env.AWS_CRED_ID    = 'terraform-aws-creds'
    env.TERRAFORM_DIR  = 'module/ec2'
    env.VAR_FILE       = 'terraform.tfvars'
    env.ACTION         = 'apply'  // or 'destroy'

    // 🔧 Instantiate and call your shared library class
    def terraformCD = new org.downtimecrew.template.terraformCD.Terraform()
    terraformCD.call([
        gitBranch    : env.GIT_BRANCH,
        gitRepoUrl   : env.GIT_REPO_URL,
        gitCredsId   : env.GIT_CREDS_ID,
        awsCredId    : env.AWS_CRED_ID,
        terraformDir : env.TERRAFORM_DIR,
        var_file     : env.VAR_FILE,
        action       : env.ACTION
    ])
}
