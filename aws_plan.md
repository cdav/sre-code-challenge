# Flask app Deployment

- Github commit triggers source pull by codepipeline
- codebuild uses buildspec.yml to build image and push to ecr
- ecs task definition configured with image in ecr
  - env vars set by values in systems manager parameter store (how does this trigger?)





# Best Practices  

- Use builder images to remove dependencies on dockerhub and pypi
- Create separate pipelines for develop and master deployments

mysql 
codepipeline > rds

routes
public for endpoint
private for flask>rds