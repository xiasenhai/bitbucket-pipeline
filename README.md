# bitbucket-pipeline
Docker image for use with Bitbucket pipelines

# sample bitbucket-pipelines.yml
```
pipelines:
  default:
    - step:
       script:
          - yarn install
          # Generating an optimized JavaScript application with Webpack
          - yarn run webpack:build
          # build package in prod mode
          - ./gradlew -Pprod bootRepackage
        artifacts:
          - build/libs/**
    - step:
        name: Deploy to test
        deployment: test   # can be test, staging or production
        # trigger: manual  # uncomment to make manual deployment
        script:
          - echo "Deploying to test environment"
