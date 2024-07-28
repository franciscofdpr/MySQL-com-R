# README - Conexão com Banco de Dados MySQL

Este documento fornece instruções para configurar e usar conexões com bancos de dados MySQL locais e hospedados no Google Cloud. Utilizamos as bibliotecas R `DBI`, `RODBC`, `odbc` e `RMySQL` para realizar estas conexões e executar consultas SQL.

## Bibliotecas Necessárias

Certifique-se de ter as seguintes bibliotecas instaladas no R:

```R
install.packages("DBI")
install.packages("RODBC")
install.packages("odbc")
install.packages("RMySQL")
```

## Conexão Local

Para conectar-se a um banco de dados MySQL local, use a função `dbConnect` da biblioteca `DBI` com o driver ODBC. Aqui está o código para configurar a conexão e realizar uma consulta:

```R
# Carregar as bibliotecas necessárias
library(DBI)
library(odbc)

# Estabelecer a conexão com o banco de dados local
conexao1 <- dbConnect(odbc::odbc(),
                      driver = 'MYSQL ODBC 8.0 ANSI Driver',
                      server = 'localhost',
                      user= 'root',
                      password = '1988',
                      database = 'dbinfox',
                      trusted_connection = 'yes',
                      port = '3306')

# Executar uma consulta SQL e armazenar os resultados em um data frame
tbusuarios <- dbGetQuery(conexao1, "SELECT * FROM tbusuarios")

# Fechar a conexão
dbDisconnect(conexao1)
```

## Conexão com Servidor Google Cloud

Para conectar-se a um banco de dados MySQL hospedado no Google Cloud, utilizamos a biblioteca `RMySQL`. Abaixo está o código para configurar a conexão e realizar consultas:

```R
# Carregar a biblioteca necessária
library(DBI)
library(RMySQL)

# Estabelecer a conexão com o banco de dados no Google Cloud
conexao2 <- dbConnect(RMySQL::MySQL(),
                      host = '35.198.42.248',
                      username = 'root',
                      password = 'dbbjxj26dHsuciar',
                      dbname = 'dbinfox')

# Executar uma consulta SQL e armazenar os resultados em um data frame
df1 <- dbGetQuery(conexao2, "SELECT * FROM tbusuarios")

# Executar outra consulta SQL com JOIN e armazenar os resultados em um data frame
df2 <- dbGetQuery(conexao2, "SELECT 
                             O.os, equipamento, defeito, servico, valor, 
                             C.nomecli, fonecli 
                             FROM tbos AS O 
                             INNER JOIN tbclientes AS C 
                             ON O.idcli = C.idcli")

# Fechar a conexão
dbDisconnect(conexao2)
```

## Notas Importantes

- **Segurança**: Nunca compartilhe suas credenciais de banco de dados publicamente. O código fornecido aqui contém informações fictícias e deve ser ajustado com suas próprias credenciais de maneira segura.
- **Dependências**: Verifique se todas as bibliotecas necessárias estão instaladas e carregadas corretamente.
- **Conexão**: Certifique-se de que os parâmetros de conexão, como `host`, `username`, `password` e `dbname`, estão corretos e que o servidor está acessível a partir de sua rede.

## Autor

Este script foi criado para fins de aprendizado e demonstração. Ajuste conforme necessário para atender às suas necessidades específicas.

---
