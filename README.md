# Hexagonal Architecture Showcase

Projeto demonstrando experiências recentes com uso de arquitetura hexagonal em uma stack Elixir + PostgreSQL.

## Setup de ambiente local

### Requisitos

  * Elixir 1.13+, Erlang 22+
  * Docker, Docker Compose

https://hexdocs.pm/phoenix/installation.html  
https://hexdocs.pm/phoenix/installation.html#elixir-1-12-or-later  
https://hexdocs.pm/phoenix/installation.html#phoenix  
https://docs.docker.com/get-docker/  
https://docs.docker.com/compose/install/

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