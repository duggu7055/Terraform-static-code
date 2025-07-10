@Library('shared-library') _  // Replace with the actual name of your Jenkins shared library

node {
    properties([
        parameters([
            choice(name: 'action', choices: ['apply', 'destroy'], description: 'Terraform action to perform'),
            string(name: 'tfVarsFile', defaultValue: 'terraform.tfvars', description: 'Path to .tfvars file (optional)')
        ])
    ])

    def config = [
        gitRepoUrl   : 'https://github.com/your-org/your-repo.git',  // Replace with your repo URL
        gitBranch    : 'main',                                       // Or your feature branch
        gitCredsId   : 'github-token',                               // Replace with Jenkins credential ID
        awsCredId    : 'aws-central-account-creds',                  // Replace with AWS credentials ID
        terraformDir : 'module/ec2',                                 // This is your Terraform module path
        var_file     : params.tfVarsFile,
        action       : params.action
    ]

    stage("Terraform CD for EC2 Module") {
        script {
            org.downtimecrew.template.terraformCD.call(config)
        }
    }
}
