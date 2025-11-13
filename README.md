# 🎬 Gerenciador de Filmes (Flutter + MVVM + SQLite)

Aplicativo móvel desenvolvido em **Flutter** para o gerenciamento de cadastro de filmes. O projeto utiliza armazenamento local via **SQLite** e segue a arquitetura **MVVM** (Model-View-ViewModel) para separação de responsabilidades.

## 📋 Funcionalidades

* **Listagem de Filmes:** Visualização em lista com Cards personalizados (Imagem, Título, Gênero, Duração e Estrelas).
* **Cadastro Completo:** Formulário com validação de campos, Dropdown para faixa etária e barra de avaliação (estrelas).
* **Edição de Dados:** Possibilidade de alterar todas as informações de um filme já cadastrado.
* **Exclusão (Swipe):** Funcionalidade de arrastar o card para a esquerda para deletar o registro.
* **Detalhes:** Tela exclusiva para exibição detalhada do filme (Pôster, Sinopse, Ano, etc.).
* **Persistência de Dados:** Banco de dados local (SQLite) que não requer instalação de servidor externo.
* **Menu de Opções:** BottomSheet para escolher entre Editar ou Visualizar detalhes.
* **Equipe:** Botão de informações exibindo os integrantes do grupo.

## 🚀 Tecnologias Utilizadas

* **Linguagem:** Dart
* **Framework:** Flutter
* **Gerência de Estado:** Provider
* **Banco de Dados:** SQFLite (SQLite nativo)
* **UI Components:** Flutter Rating Bar (para as estrelas)

## 🚀 Como Executar o Projeto

### 1. Pré-requisitos
Certifique-se de ter o **Flutter SDK** instalado e um emulador Android ou dispositivo físico configurado.

### 2. Configuração de Dependências
Adicione as seguintes bibliotecas ao seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3
  provider: ^6.0.5
  flutter_rating_bar: ^4.0.1

flutter:
  uses-material-design: true
  ```


### 2. Instalação e Execução
No terminal, na pasta raíz do projeto, execute: 
### Para baixar as dependências
```
flutter pub get
```
### Para rodar o aplicativo
```
flutter run
```



