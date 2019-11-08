# Flask app Deployment

- Github commit triggers source pull by codepipeline
- codebuild uses buildspec.yml to build image, push to ecr
- another codepipeline with ecr as a source and ecs as a deployment target 


- ecs task definition configured with image in ecr
  - env vars set by values in systems manager parameter store 
- ecs service definition for network config 

# MYSQL Deployment

- RDS instance
  - defined with cloudformation or terraform
  - uses the same ssm parameter store values for db config


# Best Practices  

- Use builder images to remove dependencies on dockerhub and pypi
- Create separate pipelines for develop and master deployments
- autoscaling service definition

    