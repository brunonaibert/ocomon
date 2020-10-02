# OcoMon - versão 2.0
## Data: Julho de 2020
## Autor: Flávio Ribeiro (flaviorib@gmail.com)

## Licença: GPL <br><br>


IMPORTANTE:
-----------

Se você deseja instalar o OcoMon por conta própria, é necessário que saiba o que é um servidor WEB e conheça o processo genérico de instalação de sistemas WEB. 

Para instalar o OcoMon é necessário ter uma conta com permissão de criação de databases no MySQL ou MariaDB e acesso à pasta pública do seu servidor web.

Antes de iniciar o processo de instalação, leia esse arquivo até o final.<br><br>


REQUISITOS:
-----------

- Servidor web com PHP + Apache + MySQL (ou MariaDB):
    - PHP a partir da versão 5.x 
        - Biblioteca GD
    - MySQL a partir da versão 5.x:
        - Nas versões mais recentes do MySQL, a diretiva SQL_MODE vem com a chave “ONLY_FULL_GROUP_BY” definida por padrão. Para que o OcoMon funcione adequadamente é necessário remover essa chave da diretiva. Para tanto:

        - Adicione as seguintes linhas ao final do seu my.cnf (arquivo de configuração do MySQL):
            
                [mysqld]
                sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION


INSTALAÇÃO EM AMBIENTE DE PRODUÇÃO:
-----------------------------------

### Primeira instalação:

O processo de instalação é bastante simples e pode ser realizado seguindo 3 passos:

1. **Instalar os scripts do sistema:**

    Descompacte o contéudo do pacote do OcoMon_2.0 no diretório público do seu servidor web (*o caminho pode variar dependendo da distribuição ou configuração, mas de modo geral costuma ser **/var/www/html/***).

    As permissões dos arquivos podem ser as padrão do seu servidor, apenas o diretório */includes/logs* precisa ter permissão de escrita para o usuário de execução do httpd, pois é o diretório onde são gravados alguns arquivos de log do sistema. Caso prefira não alterar a permissão para esse diretório, não se preocupe, pois essa configuração não é obrigatória para o bom funcionamento do sistema.<br><br>

2. **Criação da base de dados:**
    
    Para a criação de toda a base do OcoMon, você precisa importar um único arquivo de instruções SQL:
    
    O arquivo é:
    
- 01-DB_OCOMON_2.0-FRESH_INSTALL_STRUCTURE_AND_BASIC_DATA.sql (em ocomon_2.0/install/2.0/).

    Linha de comando:
        
        mysql -u root -p < /caminho/para/o/ocomon_2.0/install/2.0/01-DB_OCOMON_2.0-FRESH_INSTALL_STRUCTURE_AND_BASIC_DATA.sql
        
    O sistema irá solicitar a senha do usuário root (ou de qualquer outro usuário que tenha sido fornecido ao invés de root no comando acima) do MySQL.

    O comando acima irá criar o usuário "ocomon_2" com a senha padrão "senha_ocomon_mysql", e o banco "ocomon_2".

    **É importante alterar essa senha do usuário "ocomon_2" no MySQL logo após a instalação do sistema.**

    Você também pode realizar a importação do arquivo SQL utilizando qualquer gerenciador de banco de dados de sua preferência.


    Caso queira que a base tenha outro nome (ao invés de "ocomon_2"), edite diretamente no arquivo (*identifique as entradas relacionadas ao nome do banco e também à senha de usuário no início do arquivo*) :

    "01-DB_OCOMON_2.0-FRESH_INSTALL_STRUCTURE_AND_BASIC_DATA.sql"

    antes de realizar a importação do mesmo. Utilize essas mesmas informações no arquivo de configurações do sistema (passo **3**).
    
    **Após a importação, é recomendável a exclusão da pasta "install".**
    <br><br>


3. **Criar o arquivo de configurações:**

    Faça uma cópia do arquivo config.inc.php-dist (/includes/) e renomeie para config.inc.php. Nesse novo arquivo, confira as informações relacionadas à conexão com o banco de dados.<br><br>


INSTALAÇÃO EM AMBIENTE DE TESTES:
--------------------------------

Você pode realizar uma instalação já com alguns dados fictícios populados no sistema, facilitando a compreensão dos processos e fluxos bem como da integração entre ocorrências e inventário.

Para tanto, o processo de instalação é o mesmo citado para a instalação de produção bastando apenas alterar o arquivo SQL a ser importado para:

02-DB_OCOMON_2.0-FULL_DEMO_STRUCTURE_AND_DATA.sql
<br><br>

CONFIGURAÇÕES GERAIS DO SISTEMA
-------------------------------

O OcoMon possui duas áreas para configurações diversas do sistema:

- arquivo de configuração: /includes/config.inc.php
        - nesse arquivo estão as informações de conexão com o banco, paths padrão e configuração de carga horária padrão para atendimento;

- As demais configurações do sistema são todas acessíveis por meio do menu de administração diretamente na interface do sistema. 
<br><br>

ATUALIZAÇÃO:
-----------

**IMPORTANTE:** até a versão 2.0RC6 os scripts do OcoMon eram codificados no charset **ISO-8859-1**. A partir da versão 2.0 os scripts passaram a utilizar a codificação **UTF-8**, portanto, **não é mais necessário** configurar o PHP e nem o Apache para utilizarem o charset ISO-8859-1 por padrão. Certifique-se de remover essas configurações para utilizar o OcoMon 2.0.

Para atualizar a partir da versão 2.0RC6, basta sobrescrever os scripts da sua pasta do OcoMon pelos scripts da nova versão e importar para o MySQL o arquivo de atualização: DB_UPDATE_FROM_RC6.sql (em ocomon_2.0/install/2.0/).

**IMPORTANTE:** é fortemente recomendado que se realize um backup tanto da sua base do OcoMon quanto dos scripts (caso tenham sofrido alguma personalização ao longo do tempo podem deixar de funcionar após a atualização).
<br><br>





PRIMEIROS PASSOS
----------------

ACESSO
    
    usuário: admin
    
    senha: admin (Não esqueça de alterar esse senha tão logo tenha acesso ao sistema!!)

Novos usuários podem ser criados no menu Admin::Usuários
<br><br>


### IMPORTANTE!!

CONFIGURAÇÃO PARA ABERTURA DE CHAMADOS PELO USUÁRIO FINAL:

Para a abertura de chamados funcionar adequadamente é necessário observar os seguintes pontos:

1. Cadastre uma nova área de atendimento, e desmarque a opção "Presta atendimento". Essa área será criada
		especificamente pára abertura de chamados. O e-mail dessa área não precisa ser um e-mail válido pois
		não será utilizado pelo sistema.

2. Configure a área criada como "Área de nível somente abertura".

3. Para cadastrar usuários como somente abertura de chamados, utilize o auto-cadastro na tela de login do sistema.
Se for cadastrar manualmente cada usuário de abertura observe que o nível deve ser definido como "**Somente abertura**" e a área deve ser a área criada para abertura de chamados sem definições de áreas secundárias.
<br><br>

### AGENDAMENTO DE CHAMADOS:

Para o controle de SLAs funcionar adequadamente, é necessário a criação de mais dois STATUS (*menu Admin::Ocorrências::Status*) específicos, um para ser utilizado automaticamente no agendamento de chamados na abertura dos mesmos e outro para ser utilizado automaticamente no agendamento de chamados já abertos(na edição).

- O status a ser criado para agendamento na abertura deverá, OBRIGATORIAMENTE, ter dependência igual a "SERVIÇO DE TERCEIROS" ou
	"A ÁREA TÉCNICA".

- O status a ser criado para agendamento na edição deverá, OBRIGATORIAMENTE, ter dependência igual a "INDEPENDENTE" ou
	"AO USUÁRIO".

Os status criados deverão ser utilizados no menu: Admin::Configurações::Configurações gerais::Agendamento de chamados <br><br>



DOCUMENTAÇÃO:
-------------

Toda a documentação do OcoMon está disponível no site do projeto:

- Site do projeto: https://ocomonphp.sourceforge.io/



<br><br>Espero que esse sistema lhe seja útil e lhe ajude no seu gerenciamento de suporte e equipamentos de informática
da mesma forma que já ajuda uma série de empresas no Brasil.

Bom uso!! :)

Flávio Ribeiro
flaviorib@gmail.com

