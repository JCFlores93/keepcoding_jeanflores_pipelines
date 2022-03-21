pipeline {
    agent {
        label("python")
    }
    stages {
        stage("Build") {
            steps {
                dir("python-app-example") {
                    sh 'pip install -r requirements.txt'
                }
            }
        }
        
        stage("Unit Test") {
            steps {
                dir("python-app-example") {
                    sh 'python -m coverage run -m pytest -s -v'
                }
            }
        }
    }
}
