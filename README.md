# Como subir a Lambda

## Configurando a AWS CLI

Faça o download da [AWS CLI](https://aws.amazon.com/cli/) e, após instalar, configure-a executando o seguinte comando:

```bash
aws configure
```

Mais informações de como configurar corretamente estão na [documentação da AWS](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-quickstart.html)

## Instalando as dependências da lambda

A partir do diretório raíz, execute o seguinte comando:

```bash
pip install -r app/requirements.txt -t ./app
```

## Subindo os recursos com o terraform

Então, troque para a pasta da infra:

```bash
cd infra
```

E, a partir da infra, execute os comandos do terraform:

```bash
terraform init
```

```bash
terraform plan
```

```bash
terraform apply -auto-approve
```

## Destruindo o conteúdo gerado

Para destruir o que foi construído pelo terraform, execute o seguinte comando:

```bash
terraform destroy -auto-approve
```
