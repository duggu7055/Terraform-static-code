pipeline {
    agent any
    stages {
        stage('Wrapper Test') {
            steps {
                script {
                    def wrapper = new org.downtimecrew.Wrapper(this)
                    wrapper.init()  // this will echo and run `terraform init`
                }
            }
        }
    }
}
