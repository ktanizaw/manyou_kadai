# アプリ名
## アプリ概要
## バージョン
## 機能一覧
## カタログ設計
## テーブル構造

### Userテーブル

| カラム名|データ型 |  概要|
|-------|-------|-------|
|  name |  string | 名前|
| email |  text   |  メールアドレス |

### Taskテーブル

| カラム名       |           データ型 |                    概要|
|---------------|-------------------|-----------------------|
| name          |            string |            タスク名    |
| content       |              text |          タスク内容    |
| rank          |            string |            優先順位    |
| deadline      |          datetime |            終了期限    |
| status        |            string | 状況（未着手・着手・完了）|

### Labelテーブル

| カラム名          |            データ型 |                 概要|
|-----------------|--------------------|--------------------|
| name             |            string |             ラベル名 |
| content          |              text |           ラベル内容 |


## ER図
## ワイヤーフレームワーク
## 使用Gem
