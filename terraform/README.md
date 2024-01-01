# Documentation

## How to run it

To set up the project, it is needed to run terraform twice. First to just set up the actual project, 
then manually go into the project and upgrade the project to the `Blaze` plan, then running terraform again
to set up the database, cloud storage, etc.

For the first run, the `create_only_project` variable needs to be set to `true` and
for the second run it needs to be set to `false`.

`terraform plan -out terraform.plan && terraform apply "terraform.plan"`

## Manual set up 

### Blaze plan 

### Authentication

### Remote config
