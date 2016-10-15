# 當季蔬果一覽

**這是個自學 [Elm](http://elm-lang.org/) 的產物，功能未來會再慢慢增加。**

- [GitHub Page](https://notes.knovour.ninja/food/)
- 資料來源：[行政院農委會 - 田邊好幫手](http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductList.aspx?selectMonth=1&__M=True)（若有相同作物資料，以產季月份最多為主）。
- 營養資料表目前是假資料。
- 專案修改自：[Elm Webpack Starter](https://github.com/moarwick/elm-webpack-starter)
- 專案架構參考自：[Structured TodoMVC example with Elm](https://medium.com/@_rchaves_/structured-todomvc-example-with-elm-a68d87cd38da#.pjdeirpjy)

## 前置作業

### 安裝 Elm

安裝 `elm-platform` 或是 `npm i elm -g`

### 安裝 modules

```bash
cd [專案位置]
elm package install
npm i
```

## 啟動

### Development（8080 port）

```
npm start
```

### Production

```
npm run build
```

給 GitPage 讀取用：把 `dist/` 裡的 `index.html` 搬到外面的資料夾，並修改裡面的 path。

## License

MIT