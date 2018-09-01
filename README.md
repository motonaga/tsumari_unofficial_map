2018 大地の芸術祭 非公式データ作成キット
====

http://www.echigo-tsumari.jp/triennale2018/
の地図がなんだか見にくかったので、自分で使うためにつくりました。
公式サイトのデータを処理して作成しますが、あくまでも**非公式**です。
一回きりのクイックハックなので細かい warning とかはスルーしてます。
生成される中間データや最終データは、元のデータに著作権があるので再配布しません。
手段のみの配布です。

## Description

## Requirement

- curl (Macには入ってる)
- perl (同上)
  - Mojo::DOM (cpanmとかで)
  - JSON (同上)

## Usage

### マイマップを作る

サイトでGoogleマップを表示するために使われているデータを取得します。
```
$ curl -LO 'http://www.echigo-tsumari.jp/batch/test.json'
```

そのデータをGoogleスプレッドシートにインポートできるように処理します。
```
$ perl json2tsv.pl >mapdata.tsv
```
生成された mapdata.tsv をGoogleスプレッドシートにtab区切データとしてインポートして、さらにそのシートをGoogleマイマップからインポートします。

### 全357作品リスト
サイトのデータを取得します。
```
$ curl "http://www.echigo-tsumari.jp/artwork/artlist?page=[1-18]" >artlist.html
```

そのデータをGoogleスプレッドシートにインポートできるように処理します。
```
$ perl artlist.pl >artlist.tsv
```
作成された　artlist.tsv をGoogleスプレッドシートにtab区切データとしてインポートします。

## Author

motonaga jiro