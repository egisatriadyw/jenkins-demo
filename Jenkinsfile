pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'sudo docker build -t jenkinsdemo:1.0.0 .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Cek apakah kontainer dengan nama 'jenkinsdemo' sudah berjalan
                    def existingContainerId = sh(script: 'sudo docker ps -q -f name=jenkinsdemo', returnStdout: true).trim()

                    // Hapus kontainer jika sudah berjalan
                    if (existingContainerId) {
                        sh "sudo docker rm -f ${existingContainerId}"
                    }
                    // Run the Docker container
                    sh 'sudo docker run --name jenkinsdemo -p 5000:3000 -d jenkinsdemo:1.0.0'
                }
            }
        }
    }
}
