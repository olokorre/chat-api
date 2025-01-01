# Chat API

Uma simples tentativa de utilizar Dart no lado do servidor, com fins didáticos.

## Propósito

Este projeto tem como objetivo criar uma API de chat utilizando Dart, com foco em aprendizado e experimentação com a linguagem Dart no backend. A API permite a criação de usuários, gerenciamento de chats e envio de mensagens.

## Estrutura do Projeto

- `lib/`: Contém o código fonte principal da aplicação.
    - `app/`: Contém os casos de uso da aplicação.
    - `domain/`: Contém as entidades, exceções, repositórios e tipos do domínio.
    - `infra/`: Contém as implementações dos repositórios.
- `test/`: Contém os testes unitários e de integração.
    - `unit/`: Contém os testes unitários para as entidades e repositórios.
    - `integration/`: Contém os testes de integração para os casos de uso e repositórios.
- `.github/workflows/`: Contém a configuração do GitHub Actions para CI/CD.
- `.vscode/`: Contém a configuração do Visual Studio Code.
- `pubspec.yaml`: Contém as dependências do projeto.
- `README.md`: Este arquivo.

## Instalação

Para instalar e configurar o projeto, siga os passos abaixo:

1. **Clone o repositório:**

     ```sh
     git clone https://github.com/seu-usuario/chat_dart.git
     cd chat_dart
     ```

2. **Instale as dependências:**

     Certifique-se de ter o Dart SDK instalado. Em seguida, execute:

     ```sh
     dart pub get
     ```

     Para mais informações sobre como instalar o Dart SDK, consulte a [documentação oficial do Dart](https://dart.dev/get-dart).

## Executando os Testes

Para rodar os testes, utilize o comando:

```sh
dart test
```

Isso executará todos os testes unitários e de integração definidos na pasta `test`.

## Contribuição

Se você deseja contribuir com este projeto, por favor, siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma nova branch:

     ```sh
     git checkout -b feature/nova-feature
     ```

3. Faça suas alterações e commit:

     ```sh
     git commit -am 'Adiciona nova feature'
     ```

4. Envie para o repositório remoto:

     ```sh
     git push origin feature/nova-feature
     ```

5. Abra um Pull Request.

Para mais informações sobre Dart, consulte a [documentação oficial do Dart](https://dart.dev/guides).
