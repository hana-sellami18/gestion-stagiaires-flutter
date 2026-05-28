pipeline {
    agent any

    environment {
        FLUTTER = 'C:\\flutter\\bin\\flutter.bat'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/hana-sellami18/gestion-stagiaires-flutter.git'
            }
        }

        stage('Config') {
            steps {
                // On ne garde que la plateforme Android (evite l'erreur de symlink Windows)
                bat "${FLUTTER} config --no-enable-windows-desktop --no-enable-linux-desktop --no-enable-macos-desktop"
            }
        }

        stage('Dependencies') {
            steps {
                bat "${FLUTTER} pub get"
            }
        }

        stage('Build APK') {
            steps {
                bat "${FLUTTER} build apk --release"
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk',
                                 fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Build mobile reussi - APK archive dans Jenkins.'
        }
        failure {
            echo 'Build mobile echoue - verifier les logs.'
        }
    }
}