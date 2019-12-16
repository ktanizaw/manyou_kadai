# アプリ名
<!-- ## アプリ概要
## バージョン
## 機能一覧
## カタログ設計 -->
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



## Herokuへのデプロイ手順
### アセットプリコンパイル
アセットプリコンパイルを実行しファイルを圧縮する。

```
rails assets:precompile RAILS_ENV=production
```

### コミットまで
Herokuへpushするためにコミットまで準備しておく。

```
git add
```

```
git commit
```

### Herokuへのログイン〜プッシュまで

```
heroku login
```

```
heroku create
```

```
git push heroku master
```

DBのマイグレーションを忘れないこと。

```
heroku run rails db:migrate
```
