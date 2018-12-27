# Desafio de programação

A ideia deste desafio é nos permitir avaliar melhor as habilidades de candidatos à vagas de programador, de vários níveis.

Este desafio deve ser feito por você em sua casa. Gaste o tempo que você quiser, porém normalmente você não deve precisar de mais do que algumas horas.

## Instruções de entrega do desafio
 1. Primeiro, faça um fork deste projeto para sua conta no Github (crie uma se você não possuir).
 2. Em seguida, implemente o projeto tal qual descrito abaixo, em seu próprio fork.
 3. Por fim, empurre todas as suas alterações para o seu fork no Github e envie um pull request para este repositório original. Se você já entrou em contato com alguém da gaveteiro sobre uma vaga, avise também essa pessoa por email, incluindo no email o seu usuário no Github.

## Instruções alternativas de entrega do desafio (caso você não queira que sua submissão seja pública)
 1. Faça um clone deste repositório.
 2. Em seguida, implemente o projeto tal qual descrito abaixo, em seu clone local.
 3. Por fim, envie via email um arquivo patch para seu contato na Gaveteiro.

## Descrição do projeto

Considerando que você tem acesso a API de Filmes/Séries [TheMovieDatabase API](https://www.themoviedb.org/documentation/api), precisamos criar uma maneira de importar o [catálogo de novos filmes](https://developers.themoviedb.org/3/movies/get-upcoming) com [seus gêneros](https://developers.themoviedb.org/3/genres/get-movie-list) para um banco de dados, para "economizarmos" acesso a API do _TheMovieDatabase_. _(nota: sempre que possível, usar o parâmetro `language=pt-BR` para importar os dados em português)_

Com os filmes e gêneros importados, sua tarefa, agora, é criar uma interface web para listar os filmes que estão na base de dados e com a possibilidade de filtro por tipos de gênero.

Sua aplicação DEVE:

 1. Listar todos os filmes, de forma páginada, permitindo aplicação de filtro por gênero(s);
 2. Importar manualmento os dados da API através de script _Rake_;
 3. Ser escrita obrigatoriamente em Ruby 2.5+, usando o framework Rails 5.2+, banco de dados Postgres;
 4. Ser simples de configurar e rodar, funcionando em ambiente compatível com Unix (Linux ou Mac OS X). Ela deve utilizar apenas linguagens e bibliotecas livres e/ou gratuitas;
 5. Ter uma aparência bonita e responsiva;

Sua aplicação web NÃO precisa:

 1. Lidar com autenticação ou autorização (pontos extras se ela fizer, mais pontos extras ainda se a autenticação for feita via OAuth2);
 2. Ter interface admin [activeadmin] (pontos extrar se fizer, mais pontos extra se tiver a opção para atualização do catalogo de filmes manualmente);

## Avaliação

Seu projeto será avaliado de acordo com os seguintes critérios.

 1. Sua aplicação preenche os requerimentos?
 2. Você documentou a maneira de configurar o ambiente e rodar sua aplicação?
 3. Você seguiu as instruções de envio do desafio?
 4. Nível de qualidade e cobertura dos testes unitários.

Adicionalmente, tentaremos verificar a sua familiarização com as bibliotecas padrões (standard libs), bem como sua experiência com programação orientada a objetos a partir da estrutura do seu projeto.

### Referência

[https://github.com/myfreecomm/desafio-programacao-1]
