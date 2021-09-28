# Trabalhando com remote state

Podemos usar alguns recursos como backend, mas nesse exemplo vamos usar o s3.

## Outras formas de usar um backend para guardar remote state

Vamos usar o comando terraform init -backend=true --backend-config=path.

É mais trabalhoso, mas é uma forma de iniciar um backend para o terraform.

Ficaria assim:

```yml
terraform init -backend=true -backend-config="bucket=tfstate-553783382292" \
-backend-config="key=dev/01-usando-remote-state/terraform-tfstate" \
-backend-config="region=us-east-1" \
-backend-config="profile=pessoal"
```

Usando o arquivo backend.hcl para pegar as informações do remote state.

```yml
terraform init -backend-true -backend-config="backend.hcl"
```

O bucket tfstate-553783382292 já existe e está versionando. Só estou referenciando.
