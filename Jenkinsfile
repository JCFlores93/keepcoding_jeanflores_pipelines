node {
    stage("Say Hello") {
        echo "Hola Mundo"
        steps{
            echo "====++++executing A++++===="
        }
        post{
            always{
                echo "====++++always++++===="
            }
            success{
                echo "====++++A executed successfully++++===="
            }
            failure{
                echo "====++++A execution failed++++===="
            }
        }
    }
}