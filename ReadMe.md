# Development Environment Setup

```docker-compose up```

# Deployments

The environment vars in the images should be changed before deploying anywhere. 
They can also be overriden when starting up the container.

# Improvements

## local build

- Mount flask and mysql directories into respective containers
  - No need to run docker-compose for code updates.
  - Flask will reload whenever code is saved
  - mysql data can persist between builds 