# Consultant_fp README
ファイナンシャルプランナー相談予約システム

## Overview
ファイナンシャルプランナーへの相談予約をする為のRailsアプリです。

## Description
ファイナンシャルプランナーユーザー(以下FP)が予約可能時間を選択し、
選択された時間で他に予約者がいなければ、ユーザーは予約をすることができます。

(ファインシャルプランナーはユーザー登録から作成することができません。
  db/seeds.rb からfp: trueのユーザーを最初に作成してください)

## Demo
[heroku](https://consultant-fp.herokuapp.com/)にアプリを公開していますので、そちらを参照ください。
[email: fpuser@fp.com] でログインするとFPとしてシステムを操作できます。

## Requirement
Ruby ver 2.6.2  
Rails ver 5.2.3  
Mysql ver 8.0.16  

(上記versionで動作確認をしています。)

## Usage
MysqlのInstallが必要です。([ブログ](https://www.eastazy.work/blogs/10)でインストール手順を公開しました。)
もしくはconfig/database.ymlの "adapter:" を任意のデータベースに変更してください。

git cloneでgitを取り込む
```
git clone https://github.com/AZeroyear/consultant_fp.git
```

Directoryを移動します。
```
cd consultant_fp
```

Railsを動かして完了です。
(config/database.ymlで権限の設定が必要です。)
```
rails db:migrate
rails db:seed
rails server
```


## Licence
[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author
[AZeroyear](https://github.com/AZeroyear)
