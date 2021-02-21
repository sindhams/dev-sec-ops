# Password Generator App

In this project, I am trying to make a password generator in which a user can create custom strong passwords and copy them in order to use them other websites or platforms.

<p align="center">
  <img src="assets/pass-generator.gif" width="600">
</p>

## Idea
- Get All Symbol Characters ( @#$½§ etc.) - true-false
- Get All Numbers ( 1265 etc. ) - true-false
- Get Characters ( abcABC etc. ) - true-false
- Get Length of the password ( 17 etc. ) - required
- At least one option must be selected if not toast error message
- Add All Include Characters to Array
- Loop to That length
  - Get Random Index between 0-(length-1)
  - Using That Index get that character characters[index]
  - add that character to new password
- Copy That Password To Clipboard


## CI/CD of the Infrastructure and Application

CI/CD is carried out using the 2 github actions under .github/workflows directory.

The two workflows are 
1. Terraform
2. deployment


Terraform:

Runs automatically for every PR or merge to master on the files in terraform/* directory

Terraform is configured with the backend as Terraform cloud to store the state. This terraform automation creates the required aws infra like vpc and eks.

Terraform github actions gets triggered for both PRs and merges to master. For a PR, it runs for format check, terraform init and posts the results on the PR and after the PR is merged, the actual terraform apply is run bringing the infrastructure to the desired state. 


deployment:

Runs automatically for every merge to master except for the files in terraform/* directory

This github action builds the application code as per the dockerfile, pushes the image to docker registry and deploys the image to eks cluster.


Changes to be made to make this repo work for you:
1. edit the file terraform/main.tf to add your own Terraform cloud workspace name and token.
2. edit the file k8s/demoapp-deployment.yaml to add your dockerhub registry and image name for the key 'image'.
3. add the below secrets to your repo as per your values.
    - AWS_ACCESS_KEY_ID
    - AWS_REGION
    - AWS_SECRET_ACCESS_KEY
    - DOCKERHUB_TOKEN
    - DOCKERHUB_USERNAME
    - TF_API_TOKEN


