#!groovy

@Library('github.com/teecke/jenkins-pipeline-library@v3.4.1') _

// Initialize global config
cfg = jplConfig('devcontrol', 'bash', '', [email: env.CITEECKE_NOTIFY_EMAIL_TARGETS])

pipeline {
    agent { label 'docker' }

    stages {
        stage ('Initialize') {
            steps  {
                jplStart(cfg)
            }
        }
        stage ('Test') {
            steps  {
                sh 'bin/test.sh'
            }
        }
        stage ('Make release') {
            when { branch 'release/new' }
            steps {
                jplMakeRelease(cfg, true)
            }
        }
    }

    post {
        always {
            jplPostBuild(cfg)
        }
    }

    options {
        timestamps()
        ansiColor('xterm')
        buildDiscarder(logRotator(artifactNumToKeepStr: '20',artifactDaysToKeepStr: '30'))
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'MINUTES')
    }
}
