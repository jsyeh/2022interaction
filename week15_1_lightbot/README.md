# lightbot
Lightbot Processing Version

## Copy Assets from Lightbot Hour Mac APP
In order to rebuild this software, I copy the assets from Lightbot Hour APP.
The assets (including png and wav file) is in `/Applications/Lightbot Hour.app/Wrapper/` folder if you installed Lightbot Hour of Code Mac version.

## Add backgrounds by XML
利用 XML 檔，來讀取 PNG 檔裡的 SubTexture

## Build class SubTexture and class Texture
這樣便能快度取出全部的圖案，並測試版面。

Problem: 因 memory 用太多，要少用 PImage or 改資料結構？
- 原本 Lightbot Hour APP 使用 66 MB
- 但 Processing 空白專案 size(1024,768) 就要 214.8 MB
- 我前一版 backgrounds.png 對應 XML 檔的初始版，就要 2 GB
- 關於 PImage 的 get(x,y,w,h) 經查 Processing4/core/src/processing/core/PImage.java 發現 `new int[w*h]` 準備新 memory。要少用 PImage 的 get()
- 重構程式碼後，將 XML 變成 local 變數，memory 降到884-999 MB

TODO: 之後可用 p5.js 再試試

## 利用陣列，將關卡的地圖畫出來
目前 draw_game_map() 可以把各關卡的地圖秀出來。

## TODO: 接下來的程式規劃
1. lightbot 的狀態：方向、位置
2. 要畫出 lightbot 走動的樣子，尤其是手怎麼擺、腳怎麼翻、身體怎麼上下晃
3. Button 的動畫狀態（會放大縮小、變色、可移到MAIN中）
4. 隨機在背景中秀出漸層的白色方塊
5. 聲音
6. 各式Buttton做出class來管理它的按鈕狀態，並在程式中運作該有的功能
7. 設計許多不同的按鈕
8. 要讓 lightbot 照著程式走動、跳動、改變狀態

