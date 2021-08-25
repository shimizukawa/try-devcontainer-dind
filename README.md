Visual Studio Code の devcontainer 設定
============================================

* Visual Studio Code 環境で、devcontainerによる開発が行えます
* GitHub Codespaces でこのdevcontainerを使うことを想定しています

## 利用手順

1. GitHub リポジトリでCodeボタンからCodespaceを起動してください
2. `docker-compose up -d` でDockerが起動します

## 技術
以下それぞれの設定で、8分->2分に短縮

* 適用前: devcontainerのビルド&起動に4分、docker-compose buildに4分
* 適用後: devcontainerの起動に1分弱、docker-compose buildに1分

設定内容

* `.github/workflows/docker-build.yml`
    * devcontainerとその中で使うdockerイメージをビルドし、ghcrへpush
        * 参考: https://github.com/marketplace/actions/build-and-push-docker-images
    * ビルド時にcacheすることで次回以降を高速化
        * 参考: https://github.com/docker/build-push-action/blob/master/docs/advanced/cache.md#inline-cache
        * 参考: https://engineer.recruit-lifestyle.co.jp/techblog/2020-09-25-docker-build/
        * 参考: https://qiita.com/tatsurou313/items/ad86da1bb9e8e570b6fa

* `.devcontainer/devcontainer.json`
    * ghcrのビルド済みイメージを使ってdevコンテナを起動
    * ghcrのアクセス権がprivateの場合は、secretsにPATを設定しておく必要がある
        * 参考: https://docs.github.com/en/codespaces/codespaces-reference/allowing-your-codespace-to-access-a-private-image-registry
    * `containerEnv` でBUILDKITを有効化し、コンテナ内でのdocker buildを高速化

* `docker-compose.build.yml`
    * `cache_from` でghcrのキャッシュを参照、BUILDKIT有効化済みのため必要なキャッシュのみ取得

* `.devcontainer/post_create_command.sh`
    * docker-compose の初回ビルドで `docker-compose.build.yml` を使いghcrのキャッシュ利用
    * docker-compose の `--parallel` オプションで並列実行


## 制限事項 & TODO

* Mac側では443ポートを開けないため、pfによるポート転送設定行う必要があります（手順用意します）
* `certs/` の配置は手動で行う必要があります（secretsで自動化予定）
* コード補完の設定が途中です（特にReact）
* コード補完のためだけにdevcontainerにnode, pythonを入れる必要はあるのか？
