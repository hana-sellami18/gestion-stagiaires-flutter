pipeline {
    agent any

    environment {
        // Chemin absolu vers Flutter (le service Jenkins voit le PATH systeme,
        // mais on force le chemin pour eviter tout probleme "flutter not recognized")
        FLUTTER = 'C:\\flutter\\bin\\flutter.bat'
    }

    stages {

        stage('Checkout') {
            steps {
                // Recupere le code depuis GitHub
                git branch: 'main',
                    url: 'https://github.com/hana-sellami18/gestion-stagiaires-flutter.git'
            }
        }

        stage('Dependencies') {
            steps {
                // Telecharge les packages (flutter_bloc, dio, auto_route, etc.)
                bat "${FLUTTER} pub get"
            }
        }

        stage('Build APK') {
            steps {
                // Compile l'APK de production
                bat "${FLUTTER} build apk --release"
            }
        }

        stage('Archive') {
            steps {
                // Attache l'APK genere au build Jenkins (telechargeable depuis l'interface)
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