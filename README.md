Visual Studio Code の devcontainer 設定
============================================

## 概要

* Visual Studio Code 環境で、devcontainerによる開発が行えます
* GitHub Codespaces でこのdevcontainerを使うことを想定しています

## 参照情報

- blog: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
- base image: https://github.com/devcontainers/images/tree/main/src/python
- features: https://github.com/devcontainers/features/tree/main/src

## 利用手順

1. GitHub リポジトリでCodeボタンからCodespaceを起動してください
2. `.devcontainer/post_start_command.sh` で docker compose が起動しています。 `docker compose ps` で確認してください。

## 制限事項

* Mac側では443ポート（特権ポート）を直接開けないため、一度別のポートにマッピングされます。手動で443を指定すればSudo確認ダイアログが表示されるので、許可してください。

## TODO

* コード補完の設定が途中です（特にReact）

## 技術

* `.github/workflows/docker-build.yml`
    * devcontainerのビルド時間短縮のため、いくつか対策しています。
    * devcontainerの中で使うdockerイメージをビルドし、ghcrへpush
        * 参考: https://github.com/marketplace/actions/build-and-push-docker-images
    * ビルド時にcacheすることで次回以降を高速化
        * 参考: https://github.com/docker/build-push-action/blob/master/docs/advanced/cache.md#inline-cache
        * 参考: https://engineer.recruit-lifestyle.co.jp/techblog/2020-09-25-docker-build/
        * 参考: https://qiita.com/tatsurou313/items/ad86da1bb9e8e570b6fa

* `.devcontainer/devcontainer.json`
    * GitHub Codespacesの設定でprebuildしておく
    * `containerEnv` でBUILDKITを有効化し、コンテナ内でのdocker buildを高速化
    * `settings` でCodespacesのHTTPS通信をURL付きで転送する機能を無効化

* `compose.build.yml`
    * `cache_from` でghcrのキャッシュを参照、BUILDKIT有効化済みのため必要なキャッシュのみ取得

* `.devcontainer/post_create_command.sh`
    * docker compose の初回ビルドで `compose.build.yml` を使いghcrのキャッシュ利用
    * docker compose の `--parallel` オプションで並列実行
    * GitHub Secrets から $HTTP_CERTS を参照し、証明書を `certs/` に自動配置

* `.devcontainer/post_start_command.sh`
    * devcontainer起動時にdocker composeを起動
