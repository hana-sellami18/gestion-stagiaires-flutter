pipeline {
    agent any

    environment {
        FLUTTER = 'C:\\flutter\\bin\\flutter.bat'
        // Identifiants Firebase App Distribution
        FIREBASE_APP_ID = '1:961979269271:android:271c1823366a57f23829d2'
        GOOGLE_APPLICATION_CREDENTIALS = 'C:\\firebase\\firebase-key.json'
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

        stage('Distribute to Firebase') {
            steps {
                // Envoie l'APK aux testeurs via Firebase App Distribution
                bat """firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk ^
                    --app %FIREBASE_APP_ID% ^
                    --release-notes \"Build automatique depuis Jenkins\" ^
                    --testers \"hanasellami18@gmail.com\""""
            }
        }
    }

    post {
        success {
            echo 'Build mobile reussi - APK archive et distribue via Firebase.'
        }
        failure {
            echo 'Build mobile echoue - verifier les logs.'
        }
    }
}