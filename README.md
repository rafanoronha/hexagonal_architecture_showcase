# Hexagonal Architecture Showcase

Projeto demonstrando experiências recentes com uso de arquitetura hexagonal em uma stack Elixir + PostgreSQL.

## Arquitetura

[Encontre aqui](docs/adr) informações sobre decisões de arquitetura relacionadas a esta aplicação.

### Registrando novas decisões de arquitetura

1. [Instale](https://github.com/npryce/adr-tools/blob/master/INSTALL.md) a ferramenta `adr-tools`.  
2. Utilize o comando `adr help new` para aprender mais sobre como utilizar o comando `adr new`
3. Crie a nova ADR com o comando `adr new` e edite o arquivo de maneira que documente a decisão de arquitetura em questão.

## Setup de ambiente local

### Requisitos

  * Elixir 1.13+, Erlang 22+
  * Docker, Docker Compose

https://hexdocs.pm/phoenix/installation.html  
https://hexdocs.pm/phoenix/installation.html#elixir-1-12-or-later  
https://hexdocs.pm/phoenix/installation.html#phoenix  
https://docs.docker.com/get-docker/  
https://docs.docker.com/compose/install/

### Subindo ambiente Docker
```
docker-compose up
```

### Instalando dependências
```
mix deps.get
```

### Rodando em modo interativo
```
iex -S mix
```

### Rodando em modo não interativo
```
mix run --no-halt
```

### Executando testes de unidade
```
mix test
```

### Executando testes de unidade continuamente
```
mix test.watch
```