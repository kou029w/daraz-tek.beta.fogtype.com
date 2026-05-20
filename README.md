# daraz-tek.beta.fogtype.com

だらずてっくの Slack のアーカイブ

Slack のログの移行方法: <https://docs.mattermost.com/onboard/migrate-from-slack.html>

## 構成

- Ubuntu 24.04 LTS Server

## 使用方法

### サーバーへのインストール

```
make install
```

### サーバーにデプロイ

```
make deploy
```

### 環境変数ファイルの生成

```
make .env
```

### PostgreSQL のアップグレード手順

稼働中のデータを新バージョンに移行する手順:

```sh
ssh daraz-tek.beta.fogtype.com
cd daraz-tek.beta.fogtype.com
git pull
docker compose down postgres
docker compose --profile=migration up -d old_db postgres
docker compose exec old_db pg_dumpall --clean -U postgres \
  | docker compose exec -T postgres psql -U postgres
docker compose exec postgres psql -U postgres -c 'analyze;'
docker compose --profile=migration down old_db
docker compose up -d
```

## ライセンス

WTFPL
