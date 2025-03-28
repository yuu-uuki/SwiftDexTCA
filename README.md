# 🚀 SwiftDexTCA

<img alt="icon" src="https://github.com/user-attachments/assets/bf539128-fa17-4d73-add9-146f6e39a057" width="200">

## 📝 Overview  

**SwiftDexTCA** は **The Composable Architecture (TCA)** を採用した **Pokédexアプリ** です。  
ポケモンの一覧、詳細情報を閲覧することができます。  

## 🛠️ Tech Stack  

- **Language**: Swift6  
- **UI Framework**: SwiftUI  
- **GUI Architecture**: The Composable Architecture (TCA) + クリーンアーキテクチャ  
- **Dependency Management**: Swift Package Manager (SPM)
- **Main Libraries Used in App**: swift-dependencies, swift-openapi-generator, swift-composable-architecture
- **Static Analysis Libraries**: SwiftLint
- **DI**: swift-dependencies
- **Testing**: swift-testing

## 📸 Screen Shot
| Light | Dark |
| ----- | ---- |
| <img alt="icon" src="[https://github.com/user-attachments/assets/bf539128-fa17-4d73-add9-146f6e39a057](https://github.com/user-attachments/assets/0c7689be-27fb-4363-8709-bf85fcbf3d3c)" width="240"> | <img alt="icon" src="[https://github.com/user-attachments/assets/bf539128-fa17-4d73-add9-146f6e39a057](https://github.com/user-attachments/assets/ae572b22-8e39-4536-8eb5-7067b868792c)" width="240"> |

### レイヤー構成  

- **Presentation**: SwiftUI + TCA (`State`, `Action`, `Reducer`)  
- **Domain**: `UseCase` によるビジネスロジックの管理  
- **Data**: API通信やデータベースの管理  

### データの流れ  

1. ユーザーの操作が `Action` として発行される  
2. `Reducer` が `State` を更新  
3. `State` の変更を SwiftUI が監視し、画面を更新  
4. 必要に応じて `UseCase` がデータを取得・処理  

## 🚀 Setup  
