pipeline {
    agent {
        label("base")
    }
    stages {
        stage("Test") {
            steps {
                sh 'echo hola'
            }
        }
        
        stage("Is there any python?") {
            steps {
                sh 'python --version'
            }
        }
    }
}
