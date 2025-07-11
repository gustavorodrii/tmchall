# tmchall

## **Conta teste, ou se preferir, pode Cadastrar uma nova através do app/web** ##
- Email: teste@tokio.com
- Senha : 123456

**Flutter 3.27.0** • BLoC • Clean Architecture  • Firebase Auth • Secure Storage • Responsive (mobile/web)

## 🚀 Visão Geral

Este projeto demonstra uma aplicação Flutter com:

- **Splash Screen** que verifica se Email e Senha estão salvos em Secure Storage e redireciona para Home ou Login/Cadastro.
- **Autenticação** via **Firebase Authentication** para registro de usuário e login.
- **Tela de Login/Cadastro** unificada, controlada por BLoC, onde você alterna entre “Entrar” e “Cadastrar” por meio de eventos.
- **Home Page** com cards, efeito de carregamento inicial (Shimmer) e menu lateral (Drawer) para navegação.
- **Arquitetura Limpa** simplificada: camadas de apresentação, core e `features`, sem camada de use-cases.
- **Integração** com **Flutter Secure Storage** para “Remember Me”.
- **Publicado no Firebase Hosting** para acesso fácil via web.
- **Uso do package flutter_dotenv para seguir padrão de segurança, removendo variáveis do código**

[👉 Clique aqui para visualizar a aplicação web](https://tmchall-ef1fc.web.app)

## 📁 Arquitetura & Disposição de Pastas

```bash
lib/
├── core/               # Injeções, chaves, serviços globais
│   ├── inject/
│   │   └── bloc_providers.dart
│   ├── key/
│   │   └── navigator_key.dart
│   └── services/
│       └── remember_me_service.dart
│
├── features/           # Funcionalidades principais
│   ├── auth/             # Registro e login (Firebase Auth)
│   │   ├── bloc/
│   │   │   ├── auth_event.dart
│   │   │   ├── auth_state.dart
│   │   │   └── auth_bloc.dart
│   │   └── presentation/
│   │       ├── pages/
│   │       │   ├── splash_page.dart
│   │       │   └── login_register_page.dart
│   │       └── widgets/      # Formulários, botões, etc.
│   │
│   └── home/
│       ├── bloc/
│       │   ├── home_event.dart
│       │   ├── home_state.dart
│       │   └── home_bloc.dart
│       └── presentation/
│           ├── pages/
│           │   └── home_page.dart
│           └── widgets/      # Seções, drawer menu
│
├── shared/             # Componentes e utilitários reutilizáveis
│   ├── custom/
│   │   └── custom_webview.dart
│   └── utils/
│       ├── webview_navigator.dart
│       ├── rounded_input_text_field.dart
│       ├── app_dialog_utils.dart
│       └── placeholder_widget.dart
│
├── firebase_options.dart 
└── main.dart             
```



## 🛠️ Pré-requisitos

- Flutter **3.27.0**  
- Android Studio ou VS Code  

## ⚙️ Como Rodar o Projeto

1. **Clone** este repositório  
   ```bash
   git clone https://github.com/gustavorodrii/tmchall.git
   cd tmchall

flutter pub get

flutter run

## ✅ Como Rodar os Testes

Todos os testes estão em test/:

- auth_bloc_test.dart
- home_page_test.dart

## Para executar todos:

flutter test

## Para executar um teste específico:

- flutter test test/auth_bloc_test.dart
- flutter test test/home_page_test.dart
