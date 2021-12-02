
library(DBI)
library(RODBC)
library(odbc)
 
 ------------------------------------------------------------------------------
 #Conexão local
 conexao1 <- DBI::dbConnect(odbc::odbc(),
                            driver = 'MYSQl ODBC 8.0 ANSI Driver',
                            server = 'localhost',
                            user= 'root',
                            password ='1988',
                            database = 'dbinfox',
                            trusted_connection = 'yes',
                            port='3306')

 tbusuarios <- dbGetQuery (conexao1, "select * from tbusuarios")
 
--------------------------------------------------------------------------------
#Conexão com servidor Google Cloud
 conexao2 <- DBI::dbConnect(RMySQL::MySQL(),
                            host = '35.198.42.248',
                            username= 'root',
                            password ='dbbjxj26dHsuciar',
                            db = 'dbinfox')
 
 df1 <-  dbGetQuery (conexao2, "select * from tbusuarios")
 
 df2 <- dbGetQuery (conexao2,"select
                    O.os, equipamento, defeito, servico, valor,
                    C.nomecli, fonecli
                    from tbos as O
                    inner join tbclientes as C
                    on (O.idcli = C.idcli)")
 
