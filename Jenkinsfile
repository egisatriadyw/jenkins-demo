pipeline {
    agent any

    stage('Build') {
        steps {
            echo 'Building Docker image...'
                script {
                    sh 'sudo docker build -t jenkinsdemo:1.0.0 .'
                    if (currentBuild.resultIsBetterOrEqualTo("FAILURE")) {
                        error 'Build failed, stopping deployment'
                }
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
                    sh 'sudo docker run --name jenkinsdemo -p 5008:3000 -d jenkinsdemo:1.0.0'
                }
            }
        }
    }
}
