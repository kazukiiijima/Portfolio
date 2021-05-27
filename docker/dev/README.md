## 開発環境の構築方法

- docker images
  - app-rails
    - ruby:2.5.7 (nginx,unicorn,supervisor)
  - mysql-57
    - mysql:5.7

- リポジトリをclone

```
mkdir -p ~/git/
cd ~/git/
git@github.com:kazukiiijima/Portfolio.git
```

- http://dev.share-movie.work/でアクセスできるようにhostsファイルに追記

```
sudo vim /etc/hosts
127.0.0.1 dev.share-movie.work
```

- .env.exampleを利用して環境変数を追加

```
cd Portfolio
cp .env.example .env
cd docker/dev/
docker-compose up -d
```

- アプリのデプロイ

```
docker exec -it share-app bash

bundle install
rails db:migrate
/usr/bin/supervisorctl restart app
```

- アクセス確認


![スクリーンショット 2021-05-27 21 51 39](https://user-images.githubusercontent.com/5633085/119829318-149e7400-bf36-11eb-8456-2321879a3f10.jpg)


http://dev.share-movie.work/



