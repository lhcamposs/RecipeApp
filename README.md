# 🍳 Receitas Favoritas - App de Receitas

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

Um aplicativo Flutter simples e intuitivo para gerenciar e explorar receitas, desenvolvido como exemplo prático de navegação (Abas, Drawer, Telas de Detalhes) e arquitetura MVVM.

---

## 🎯 Objetivo

Desenvolver um aplicativo Flutter que demonstre o uso eficiente da navegação entre telas e abas, seguindo os princípios do padrão arquitetural **MVVM (Model-View-ViewModel)**. O aplicativo permite que o usuário explore diferentes categorias de receitas, visualize detalhes específicos de cada prato e navegue fluidamente entre as seções.

## ✨ Funcionalidades (Metodologia)

*   **Navegação por Abas (BottomNavigationBar):** A tela principal atua como ponto de partida, oferecendo três categorias principais acessíveis via abas na parte inferior:
    *   🍩 Doces
    *   🍕 Salgadas
    *   🍹 Bebidas
*   **Listagem em Cards:** Cada aba exibe uma lista de três receitas representadas por `Cards` interativos.
*   **Telas de Detalhes:** Ao tocar em um Card, o usuário navega para uma tela dedicada contendo:
    *   Título da receita
    *   Breve descrição
    *   Lista de ingredientes
    *   Modo de preparo detalhado
    *   Opção de voltar (`AppBar` back button) para a aba de origem.
*   **Menu Lateral (Drawer):** Acessível pelo ícone no canto superior esquerdo da tela principal, oferecendo navegação secundária para:
    *   ⚙️ **Configurações:** Tela de exemplo para ajustes do app.
    *   ℹ️ **Sobre:** Informações gerais sobre o aplicativo.
    *   O retorno do Drawer para a tela principal é feito através do botão de "voltar".

## 🏗️ Arquitetura (MVVM)

O projeto foi estruturado seguindo o padrão **Model-View-ViewModel** para separar a lógica de negócios da interface do usuário. No arquivo `main.dart`, a estrutura está logicamente dividida:

1.  **Models (`Recipe`, `RecipeCategory`):** Representam as entidades de dados (as receitas e suas propriedades).
2.  **ViewModels (`RecipeViewModel`):** Atuam como ponte entre o Model e a View. Neste projeto de exemplo, gerenciam a lista de receitas (mock data) e fornecem métodos para filtrar por categoria (`getRecipesByCategory`). Extende `ChangeNotifier` para facilitar futuras integrações de estado.
3.  **Views (`MainScreen`, `RecipeListTab`, `RecipeDetailScreen`, `AppDrawer`, etc.):** Os Widgets do Flutter responsáveis por renderizar a interface e interagir com o usuário, consumindo dados do ViewModel.

## 🚀 Como Executar

### Pré-requisitos
*   [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado na sua máquina.
*   Um emulador configurado (Android/iOS) ou um dispositivo físico conectado.
*   Uma IDE (VS Code, Android Studio, IntelliJ).

### Passos
1.  **Clone o repositório:** (Se aplicável)
    ```bash
    git clone https://seu-repositorio/receitas_favoritas.git
    cd receitas_favoritas
    ```
2.  **Obtenha as dependências:**
    ```bash
    flutter pub get
    ```
3.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```
    *Dica: Como todo o código principal (Models, ViewModels e Views) para este exemplo está centralizado em `lib/main.dart`, você pode simplesmente copiar o conteúdo do arquivo fornecido e colá-lo no `main.dart` de um novo projeto Flutter.*

## 📁 Estrutura de Arquivos (Baseada no `main.dart` fornecido)

Embora o código esteja unificado em um único arquivo para fins de demonstração neste ambiente, a estrutura lógica representa o seguinte:

```text
lib/
├── models/
│   └── recipe.dart        (Contém classe Recipe e enum RecipeCategory)
├── viewmodels/
│   └── recipe_viewmodel.dart (Gerencia estado e dados das receitas)
├── views/
│   ├── main_screen.dart   (Scaffold principal, BottomNav, Drawer)
│   ├── recipe_list_tab.dart (Lista de Cards por categoria)
│   ├── recipe_detail.dart (Detalhes da receita)
│   ├── app_drawer.dart    (Menu lateral)
│   ├── settings_screen.dart
│   └── about_screen.dart
└── main.dart              (Ponto de entrada, MaterialApp)
```

## 🛠️ Tecnologias Utilizadas

*   **Linguagem:** Dart
*   **Framework:** Flutter
*   **Design System:** Material Design 3

---
*Desenvolvido como projeto de exemplo para estudo de Flutter e MVVM.*