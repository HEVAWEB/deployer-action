# Deployer Action

## Usage

```yml
name: Deploying app
on: [push, pull_request]
jobs:
  deploy:
    name: Deploy with Deployer
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Deploying
        uses: HEVAWEB/deployer-action@master
        with:
          task: 'deploy'
          env: 'production'
```
