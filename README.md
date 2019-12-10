# アプリ名
## アプリ概要
## バージョン
## 機能一覧
## カタログ設計
## テーブル構造

◆Userテーブル
| カラム名|データ型 |  概要|
|-------|-------|-------|
|  name |  string | task_id|
| email |  text   |   name |

◆Taskテーブル
| カラム名          |            データ型 |               Label|
|:-----------------|------------------:|:------------------:|
| id               |                id |                 id |
| name             |           user_id |            task_id |
| email            |              name |               name |
|                  |           content |        content     |
|                  |              rank |                    |
|                  |          deadline |                    |
|                  |              rank |                    |
|                  |            status |                    |

◆Labelテーブル
| カラム名          |            データ型 |               Label|
|:-----------------|------------------:|:------------------:|
| name             |                id |                 id |
| content          |           user_id |            task_id |


## ER図
## 画面遷移図
## ワイヤーフレームワーク
## 使用Gem
