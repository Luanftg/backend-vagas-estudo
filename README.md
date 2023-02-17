# :computer: Backend em Dart para Aplicação: Vagas

**Backend** desenvolvido em *Dart* para servir tanto ao **App Mobile** - acesso do Cliente, quanto a **página Web** - acesso do recrutador e administrador.

## Passos da Implementação

- Criação do Servidor
  - ![Alt text](assets/server_inicial.jpg)
- Criação da Api
  - Rotas
  - ![Alt text](assets/router.jpg)
    - GET '/'
      - ![Alt text](assets/first_router.jpg)
    - POST '/login'
- Passagem de Dados com Query e Router Parms
  - Router param
    - obter parâmetro diretamente da url.Exemplo:  `http://localhost:8080/<variavel>`
  - Query parms
    - busca pelo parametro na url atraves da estrutura
      - ``String? nome = req.url.queryParameters['nome]``
      - Passagem por  ``http://localhost:8080/query?nome=Luan``
      - ![Alt text](assets/params-QueryAndRouter.jpg)
- [Mime Type](https://developer.mozilla.org/en-US/docs/WebHTTP/Basics_of_HTTP/MIME_types/Common_types) - inseridos no headers da *Response* na chave `content-type`
  - *Exemplos*
  - ``content-type: application/json``
  - ``content-type: text/html``
- Cascade e PipeLine
  - [Builder - Pattern](https://refactoring.guru/
  - ![Alt text](https://refactoring.guru/images/patterns/diagrams/builder/structure.png?id%3Dfe9e23559923ea0657aa5fe75efef333)design-patterns/builder)
- DotEnv
- Model Layer
- Service Layer
  - Isolamento da camada Service
- Middlewares
- Segurança
  - JWT
  - Encapsulamento da Segurança - Handler
- Injetor de Dependência
- Banco de Dados MySql
- Docker
- Conectar projeto DArt ao banco de dados
  - criação da abstração da conexão com o banco
  - Maperar modelos da consulta
- DAO Pattern - Isolando as consultas
- CRUD
- API -ponta a ponta
- Hash nas senhas
- Integração do Login
- CORS
- Deploy
