## はじめに
シンプルかつ使いやすくを目指したneovimのinit.luaです。<br>
vimらしいキーバインドを残しつつ、見やすく素早い操作の実現を目指しました。<br>
![](https://github.com/user-attachments/assets/2419e3b1-f511-471e-b6c3-9c008626ee3b)

## おしながき
* Lazyによるプラグインの管理
* ライトテーマのメモ帳ライクな画面
* easy-motion, surroundなどによる素早い文字操作
* Fern, 自作関数などによる容易なファイルブラウザ

## インストール
所定のinit.luaディレクトリに保存するだけで使えます。初回のみlazyによるプラグインインストールがあります。<br>
`参考Path: ~/.config/nvim/`

## やりたかったこと
* VsCodeがダークテーマのため、nvimはライトテーマでシンプルなメモ帳のように使う
* f, F, t, Tの移動時に対象キーを押せば素早く移動が可能。   > hello → fl → he`as`o
* Leaderキーをspaceに割当し、2回押せば画面内で2文字ターゲットの検索
* Ctrl+nでファイルブラウザを表示
* surround機能で容易な括弧編集かつ、余分な空白なし。    `"hello" → cs"( → (Hello)`
* space+a:全選択, space+s:Desktopにmd保存, space+shift+8:置換作業
* :Init関数でinit.luaを新しいタブで開く
* lua構文の配列を用いて、init.luaはシンプルで柔軟に記載

## ライセンス
各プラグイン作者様に感謝いたします。<br>
nvimらしさを優先して最低限のカスタムしかしてないため、更に拡張して自由に使って頂けると幸いです。<br>
[MIT license](https://choosealicense.com/licenses/mit/)
