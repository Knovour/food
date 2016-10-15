module Libs.Data exposing (..)

import Libs.Type exposing (Food, Month)
import Libs.Normalize exposing (normalize)


month : List Month
month =
  [ { idx = 1, eng = "January", text = "一月" }
  , { idx = 2, eng = "February", text = "二月" }
  , { idx = 3, eng = "March", text = "三月" }
  , { idx = 4, eng = "April", text = "四月" }
  , { idx = 5, eng = "May", text = "五月" }
  , { idx = 6, eng = "June", text = "六月" }
  , { idx = 7, eng = "July", text = "七月" }
  , { idx = 8, eng = "August", text = "八月" }
  , { idx = 9, eng = "September", text = "九月" }
  , { idx = 10, eng = "October", text = "十月" }
  , { idx = 11, eng = "November", text = "十一月" }
  , { idx = 12, eng = "December", text = "十二月" }
  ]


foodTypes : List String
foodTypes =
  [ "蔬菜", "根莖類", "豆類", "菇類", "穀類", "水果" ]


rowData : List Food
rowData =
  [ { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129111625&selectMonth=1&__M=True"
    , imgFrom = "https://cgfull.blogspot.tw/2011/06/blog-post_18.html"
    , name = "九層塔"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214838&selectMonth=1&__M=True"
    , imgFrom = "http://www.cookingnow.com.tw/foodmapSelect.php?class=vegetable&ingredientNo=280"
    , name = "包心白菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129112524&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E5%A4%A7%E8%92%9C-%E6%9C%89%E6%9C%BA-%E6%96%B0%E9%B2%9C-%E8%94%AC%E8%8F%9C-%E7%94%9F%E4%BA%A7-1374329/"
    , name = "大蒜"
    , species = "根莖類"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214637&selectMonth=1&__M=True"
    , imgFrom = "https://www.intw.com.tw/shop_view.asp?pid=24159"
    , name = "小白菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=92&selectMonth=1&__M=True"
    , imgFrom = "http://enjoyfisher.blogspot.tw/2013/10/blog-post_8.html"
    , name = "山蘇"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YnJlbmRh_20090714174321&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%9C%A8%E7%93%9C-%E7%83%AD%E5%B8%A6%E6%B0%B4%E6%9E%9C-%E5%BC%82%E5%9B%BD%E6%83%85%E8%B0%83-%E7%94%9C-%E5%A4%9A%E6%B1%81-%E6%88%90%E7%86%9F-%E6%A9%99%E8%89%B2-%E7%A7%8D%E5%AD%90-%E5%81%A5%E5%BA%B7-74585/"
    , name = "木瓜"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=96&selectMonth=1&__M=True"
    , imgFrom = "http://blog.xuite.net/genie0580521/blog/75395579"
    , name = "杏鮑菇"
    , species = "菇類"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205309&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%A4%B0%E5%AD%90-%E5%9D%9A%E6%9E%9C-%E5%A3%B3-%E5%B8%83%E6%9C%97-%E7%BA%B8%E6%B5%86-%E5%BC%82%E5%9B%BD%E6%83%85%E8%B0%83-1501334/"
    , name = "椰子"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730200742&selectMonth=1&__M=True"
    , imgFrom = "http://www.freegreatpicture.com/fruits-and-vegetables/carambole-31629"
    , name = "楊桃"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_c2hpbmVhaXI%3d_20100527112733&selectMonth=1&__M=True"
    , imgFrom = "http://www.livestrong.com/article/52018-make-burdock-tea/"
    , name = "牛蒡"
    , species = "根莖類"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213644&selectMonth=1&__M=True"
    , imgFrom = "http://taft.coa.gov.tw/taiwanmap/product.aspx?CropCode=113201"
    , name = "甘藍"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730203055&selectMonth=1&__M=True"
    , imgFrom = "https://a2ua.com/guava.html"
    , name = "番石榴"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129113540&selectMonth=1&__M=True"
    , imgFrom = "http://www.morelohas.com/archives/134"
    , name = "皇宮菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213102&selectMonth=1&__M=True"
    , imgFrom = "http://simplegreenlife.seesaa.net/article/132365676.html"
    , name = "空心菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129110951&selectMonth=1&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E7%BA%A2%E5%87%A4%E8%8F%9C"
    , name = "紅鳳菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730212616&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E9%BB%84%E7%93%9C-%E9%A3%9F%E5%93%81-%E8%94%AC%E8%8F%9C-%E9%BB%84%E7%93%9C%E7%89%87-%E5%88%87%E7%89%87-%E7%BB%BF%E8%89%B2-%E8%8F%9C%E6%9D%BF-%E6%9C%A8-%E6%9D%BF-%E5%88%80-78789/"
    , name = "胡瓜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730220220&selectMonth=1&__M=True"
    , imgFrom = "http://www.choysum.org/?p=209"
    , name = "芥藍"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730215235&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8F%9C%E8%8A%B1-%E8%94%AC%E8%8F%9C-%E9%A3%9F%E5%93%81-%E7%BB%B4%E7%94%9F%E7%B4%A0-%E5%B8%82%E5%9C%BA%E6%96%B0%E9%B2%9C%E8%94%AC%E8%8F%9C-%E7%B4%A0%E9%A3%9F-1465732/"
    , name = "花椰菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129112327&selectMonth=1&__M=True"
    , imgFrom = "http://www.cookingnow.com.tw/rubricSelect.php?articleNo=174"
    , name = "苜蓿芽"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730220419&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%94%AC%E8%8F%9C-%E8%8B%A6%E7%93%9C-%E8%8B%A6%E6%B6%A9%E7%9A%84%E5%A3%81%E7%90%83-%E6%A0%BC%E6%9E%97%E4%B8%80%E5%AE%B6-%E6%88%88%E9%9B%85-karavella-19727/"
    , name = "苦瓜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214158&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8C%84%E5%AD%90-%E8%94%AC%E8%8F%9C-%E9%A3%9F%E5%93%81-%E6%96%B0%E9%B2%9C-%E6%9C%89%E6%9C%BA-%E8%89%B2%E5%BD%A9%E7%BC%A4%E7%BA%B7-%E7%B4%AB%E8%89%B2-1190869/"
    , name = "茄子"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YnJlbmRh_20090714155007&selectMonth=1&__M=True"
    , imgFrom = "http://hajime-17.blog.jp/tag/%E5%8F%A4%E4%BB%8A%E4%BA%AD%E8%8F%8A%E9%BE%8D"
    , name = "萵苣"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204349&selectMonth=1&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E8%93%AE%E9%9C%A7"
    , name = "蓮霧"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YWxhbmxhbg%3d%3d_20090730014307&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%BA%A2%E8%96%AF-%E6%A0%B9-%E6%B7%80%E7%B2%89%E7%B1%BB-%E6%94%B6%E8%8E%B7-%E6%96%B0%E9%B2%9C-%E5%81%A5%E5%BA%B7-%E8%90%A5%E5%85%BB-%E5%86%9C%E4%B8%9A-%E5%8E%9F-%E7%94%9F%E4%BA%A7-1528665/"
    , name = "蕃薯"
    , species = "根莖類"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101125150905&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%BA%A2%E8%BE%A3%E6%A4%92-%E7%BA%A2%E8%89%B2-%E8%BE%A3-%E5%B9%B2%E7%87%A5-621890/"
    , name = "辣椒"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730215742&selectMonth=1&__M=True"
    , imgFrom = "http://taft.coa.gov.tw/taiwanmap/product.aspx?CropCode=113105"
    , name = "青蔥"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101125114356&selectMonth=1&__M=True"
    , imgFrom = "http://food.thenote.com.tw/news/detail/453/"
    , name = "韭菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730195558&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E9%A6%99%E8%95%89-%E6%B0%B4%E6%9E%9C-%E5%81%A5%E5%BA%B7-%E9%BB%84%E8%89%B2-%E9%A6%99%E8%95%89%E7%9A%AE-%E6%88%90%E7%86%9F-%E6%80%A7%E8%B4%A8-%E5%BC%97%E9%87%8C%E6%96%BD-%E5%85%B3%E9%97%AD-1642706/"
    , name = "香蕉"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204007&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8F%A0%E8%90%9D-%E7%94%9F%E4%BA%A7-%E5%8F%AF%E9%A3%9F%E7%94%A8%E7%9A%84%E6%9E%9C%E5%AE%9E-%E6%B0%B4%E6%9E%9C-%E9%A3%9F%E5%93%81-%E7%94%9C-%E5%BC%82%E5%9B%BD%E6%83%85%E8%B0%83-%E6%9C%89%E6%9C%BA-1209487/"
    , name = "鳳梨"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101124193950&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E5%8D%97%E7%93%9C-%E5%A3%81%E7%90%83-%E7%A7%8B%E5%AD%A3-%E8%8A%B1%E5%9B%AD-%E6%94%B6%E8%8E%B7%E6%97%B6%E9%97%B4-%E6%84%9F%E6%81%A9%E8%8A%82-%E6%A9%99-%E7%A7%8B-%E8%94%AC%E8%8F%9C-1679827/"
    , name = "南瓜"
    , species = "根莖類"
    , harvest = [ 1, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=91&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E5%92%96%E5%95%A1-%E5%92%96%E5%95%A1%E6%9D%AF-%E7%93%B7-%E5%92%96%E5%95%A1%E8%B1%86-%E8%B1%86%E7%B1%BB-%E5%8F%97%E7%9B%8A-1576552/"
    , name = "咖啡"
    , species = "豆類"
    , harvest = [ 1, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=102&selectMonth=10&__M=True"
    , imgFrom = "http://efarmer.taitung.gov.tw/Crops/Detail/228"
    , name = "大白柚"
    , species = "水果"
    , harvest = [ 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=94&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%8C%95%E7%8C%B4%E6%A1%83-%E6%B0%B4%E6%9E%9C-%E9%A3%9F%E5%93%81-%E6%96%B0%E9%B2%9C-%E9%A5%AE%E9%A3%9F-%E6%B0%B4%E6%9E%9C%E6%B2%99%E6%8B%89-%E4%B8%AD%E5%9B%BD%E9%86%8B%E6%A0%97-400143/"
    , name = "奇異果"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101007203452&selectMonth=1&__M=True"
    , imgFrom = "http://www.epochtimes.com/b5/15/9/28/n4538320.htm"
    , name = "山藥"
    , species = "根莖類"
    , harvest = [ 1, 2, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101125100440&selectMonth=1&__M=True"
    , imgFrom = "http://www.goldfarm.idv.tw/goldfarm/html/news_d.asp?id=68"
    , name = "愛玉"
    , species = "水果"
    , harvest = [ 1, 2, 3, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101125103022&selectMonth=1&__M=True"
    , imgFrom = "http://sixstar.moc.gov.tw/blog/hekang873525/myArticleAction.do?method=doViewArticleNewDetail&articleId=28481"
    , name = "文旦"
    , species = "水果"
    , harvest = [ 1, 2, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205734&selectMonth=3&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%9D%8E%E5%AD%90-%E6%96%B0%E9%B2%9C-%E6%88%90%E7%86%9F%E7%9A%84%E6%9E%9C%E5%AE%9E-%E7%A7%8B-%E8%82%A1%E7%A5%A8-%E8%91%A1%E8%90%84%E5%9B%AD-%E7%BB%BF%E8%89%B2-%E9%A3%9F%E5%93%81-%E5%9B%BD%E5%AE%B6-1631792/"
    , name = "李子"
    , species = "水果"
    , harvest = [ 3, 4, 5, 6, 7, 8 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205215&selectMonth=2&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E5%A4%A7-%E6%9E%87-%E6%9D%B7-%E6%9E%87%E6%9D%B7%E5%8F%B6-%E8%94%B7%E8%96%87%E7%A7%91-%E5%BC%80%E8%8A%B1%E6%A4%8D%E7%89%A9-%E4%B8%AD%E5%9B%BD%E6%A2%85%E8%8A%B1-1358233/"
    , name = "枇杷"
    , species = "水果"
    , harvest = [ 2, 3, 4 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=103&selectMonth=10&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%9F%91%E6%A9%98-%E6%A9%98%E5%AD%90-%E6%9F%91%E6%A9%98%E7%B1%BB%E6%B0%B4%E6%9E%9C-%E6%A9%99%E8%89%B2-%E6%B0%B4%E6%9E%9C-%E5%8F%B6%E5%AD%90-%E5%81%A5%E5%BA%B7-%E7%BB%B4%E7%94%9F%E7%B4%A0-%E8%90%A5%E5%85%BB-986873/"
    , name = "柑橘"
    , species = "水果"
    , harvest = [ 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204248&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%B0%B4%E6%9E%9C-%E5%8D%97%E6%96%B9%E6%B0%B4%E6%9E%9C-%E6%95%B4%E4%B8%AA%E6%B0%B4%E6%9E%9C-%E5%86%85%E9%83%A8%E7%9A%84%E6%B0%B4%E6%9E%9C-%E6%A9%98%E5%AD%90-%E5%AE%98%E5%90%8F-%E6%96%B0%E9%B2%9C%E6%B0%B4%E6%9E%9C-665621/"
    , name = "柳橙"
    , species = "水果"
    , harvest = [ 1, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730201955&selectMonth=8&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%9F%BF%E5%AD%90-%E6%B0%B4%E6%9E%9C-%E6%96%B0%E9%B2%9C-%E5%A4%9A%E5%BD%A9-1456186/"
    , name = "柿子"
    , species = "水果"
    , harvest = [ 8, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=105&selectMonth=1&__M=True"
    , imgFrom = "http://miaolitravel.net/MainWeb/FriendPrint.aspx?Lang=1&Sno=04006717"
    , name = "桶柑"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205622&selectMonth=3&__M=True"
    , imgFrom = "http://www.songfuplums.com.tw/product/141"
    , name = "梅子"
    , species = "水果"
    , harvest = [ 3, 4, 5 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730202356&selectMonth=1&__M=True"
    , imgFrom = "http://5rams.blogspot.tw/2011/11/66.html"
    , name = "椪柑"
    , species = "水果"
    , harvest = [ 1, 2, 3, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730203436&selectMonth=6&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%9F%A0%E6%AA%AC-limone-%E6%9F%A0%E6%AA%AC%E6%A0%91-%E6%9F%91%E6%A9%98%C3%97%E5%88%A9%E8%92%99-%E6%9F%91%E6%A9%98-%E6%B0%B4%E6%9E%9C-%E7%83%AD%E5%B8%A6%E6%B0%B4%E6%9E%9C-1117568/"
    , name = "檸檬"
    , species = "水果"
    , harvest = [ 6, 7, 8, 9 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=98&selectMonth=2&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E6%AF%9B%E8%B1%86"
    , name = "毛豆"
    , species = "豆類"
    , harvest = [ 2, 3, 4, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730202930&selectMonth=6&__M=True"
    , imgFrom = "https://greenbox.tw/Home/BlogPost/4356/%E3%80%90%E7%84%A1%E6%AF%92%E8%BE%B2%E5%B0%8F%E5%AD%B8%E5%A0%82%E3%80%91%E6%A2%A8%E5%AD%90"
    , name = "水梨"
    , species = "水果"
    , harvest = [ 6, 7, 8, 9, 10 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204915&selectMonth=6&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%B2%B9%E6%A1%83-%E6%A1%83-%E6%B0%B4%E6%9E%9C-%E8%90%BD%E5%8F%B6-%E5%A4%9A%E6%B1%81-%E7%94%9C-%E9%BB%84%E8%89%B2-%E6%88%90%E7%86%9F-%E5%81%A5%E5%BA%B7-%E6%96%B0%E9%B2%9C-1074997/"
    , name = "水蜜桃"
    , species = "水果"
    , harvest = [ 6, 7, 8 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213813&selectMonth=1&__M=True"
    , imgFrom = "http://www.twsnap.com/info.php?tid=%E6%B2%B9%E8%8F%9C"
    , name = "油菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=97&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%B4%8B%E8%91%B1-%E4%B8%BA%E4%BB%80%E4%B9%88-%E6%A0%B9-%E5%9C%9F%E5%9C%B0-%E8%93%9D%E8%89%B2-%E6%B2%99%E6%8B%89-%E8%94%AC%E8%8F%9C-%E7%9C%BC%E6%B3%AA-%E4%B8%A4%E4%B8%AA-1565604/"
    , name = "洋蔥"
    , species = "根莖類"
    , harvest = [ 1, 2, 3 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204604&selectMonth=3&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%93%9C-%E5%93%88%E5%AF%86%E7%93%9C-%E5%8F%AB%E4%BB%96%E9%A6%99%E7%93%9C-%E7%94%9C%E7%93%9C-spanspek-mushmelon-1388338/"
    , name = "洋香瓜"
    , species = "水果"
    , harvest = [ 3, 4, 5, 6, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204710&selectMonth=5&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%81%AB%E9%BE%99%E6%9E%9C-%E6%B0%B4%E6%9E%9C-%E5%A5%BD%E5%90%83-%E7%BA%A2%E8%89%B2-1190872/"
    , name = "火龍果"
    , species = "水果"
    , harvest = [ 5, 6, 7, 8, 9, 10 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213308&selectMonth=4&__M=True"
    , imgFrom = "http://hsuzong2014.blogspot.tw/2014/05/blog-post_28.html"
    , name = "烏殼綠竹筍"
    , species = "根莖類"
    , harvest = [ 4, 5, 6, 7, 8, 9 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214403&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%B5%81%E8%A1%8C%E7%8E%89%E7%B1%B3-%E9%BB%84%E8%89%B2-%E6%B5%81%E8%A1%8C-%E7%88%86%E7%B1%B3%E8%8A%B1-%E9%A3%9F%E5%93%81-%E8%90%A5%E5%85%BB-%E5%90%83-%E6%88%90%E5%88%86-785074/"
    , name = "玉米"
    , species = "穀類"
    , harvest = [ 1, 2, 3, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205107&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%94%98%E8%94%97-%E7%94%98%E8%8D%89-%E5%88%BA%E6%BF%80%E7%89%A9-%E7%94%98%E8%94%97%E6%94%B6%E8%8E%B7-%E7%B3%96%E7%94%9F%E4%BA%A7-%E9%A3%9F%E5%93%81-276242/"
    , name = "甘蔗"
    , species = "根莖類"
    , harvest = [ 1, 2, 3, 4, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730212825&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%94%9C%E6%A4%92-%E8%BE%A3%E6%A4%92%E7%B2%89-%E7%BA%A2%E8%89%B2-%E5%81%A5%E5%BA%B7-%E7%BB%B4%E7%94%9F%E7%B4%A0-%E8%83%A1%E6%A4%92-%E8%94%AC%E8%8F%9C-%E9%BB%84%E8%89%B2-%E9%97%AA%E4%BA%AE-499068/"
    , name = "甜椒"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730215338&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%A5%BF%E7%BA%A2%E6%9F%BF-%E7%BA%A2%E8%89%B2-%E5%90%83-%E9%A3%9F%E5%93%81-%E8%8F%9C%E5%9B%AD-%E7%95%AA%E8%8C%84%E7%BA%A2-%E7%BB%B4%E7%94%9F%E7%B4%A0-%E9%9B%86%E7%BE%A4%E7%95%AA%E8%8C%84-1662759/"
    , name = "番茄"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 5, 6, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730203334&selectMonth=7&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%83%AD%E5%B8%A6-%E7%99%BE%E9%A6%99%E6%9E%9C-%E6%B0%B4%E6%9E%9C-1501212/"
    , name = "百香果"
    , species = "水果"
    , harvest = [ 7, 8, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101125140004&selectMonth=3&__M=True"
    , imgFrom = "http://www.styletc.com/archives/22396"
    , name = "秋葵"
    , species = "蔬菜"
    , harvest = [ 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=90&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%B4%85%E8%B1%86-%E9%9B%99%E6%89%8B-%E7%A9%80%E9%A1%9E-587592/"
    , name = "紅豆"
    , species = "豆類"
    , harvest = [ 1, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213918&selectMonth=5&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E4%B8%9D%E7%93%9C"
    , name = "絲瓜"
    , species = "蔬菜"
    , harvest = [ 5, 6, 7, 8, 9 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129121230&selectMonth=5&__M=True"
    , imgFrom = "http://www.harvest.org.tw/Articles/ArticleContent/126044?page=1&actionname=Magazine_ArticlesRecommend&unit=193"
    , name = "綠竹筍"
    , species = "根莖類"
    , harvest = [ 5, 6, 7, 8, 9, 10 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213205&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%BA%A2%E8%90%9D%E5%8D%9C-%E8%94%AC%E8%8F%9C-%E5%B8%82%E5%9C%BA-%E5%86%9C%E4%B8%9A-%E5%9F%B9%E5%85%BB-%E9%9F%A6%E5%B0%94%E5%A1%94-%E5%81%A5%E5%BA%B7-%E5%AD%97%E6%AE%B5-%E9%A3%9F%E5%93%81-1508847/"
    , name = "胡蘿蔔"
    , species = "根莖類"
    , harvest = [ 1, 2, 3, 4, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730215951&selectMonth=1&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E8%8A%8B"
    , name = "芋"
    , species = "根莖類"
    , harvest = [ 1, 7, 8, 9 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730201015&selectMonth=5&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8A%92%E6%9E%9C-%E8%A5%BF%E7%8F%AD%E7%89%99-%E5%AE%89%E8%BE%BE%E5%8D%A2%E8%A5%BF%E4%BA%9A-%E5%B8%82%E5%9C%BA-%E6%B0%B4%E6%9E%9C-%E8%94%AC%E8%8F%9C-354062/"
    , name = "芒果"
    , species = "水果"
    , harvest = [ 5, 6, 7, 8, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730215116&selectMonth=1&__M=True"
    , imgFrom = "http://283liya.blogspot.tw/2014/06/2-3.html"
    , name = "芥菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214958&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%94%AC%E8%8F%9C%E6%B1%A4-%E8%8A%B9%E8%8F%9C-%E8%94%AC%E8%8F%9C-%E9%A3%9F%E5%93%81-%E5%81%A5%E5%BA%B7-%E9%A5%AE%E9%A3%9F-%E7%BE%8E%E9%A3%9F-%E5%8D%88%E9%A4%90-%E8%B0%83%E6%96%99-869075/"
    , name = "芹菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730211956&selectMonth=5&__M=True"
    , imgFrom = "http://www.cookingnow.com.tw/foodmapSelect.php?class=vegetable&ingredientNo=52"
    , name = "筊白筍"
    , species = "根莖類"
    , harvest = [ 5, 6, 7, 8, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730204817&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8D%89%E8%8E%93-%E7%BA%A2%E8%89%B2-%E5%AE%8F-629180/"
    , name = "草莓"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730203536&selectMonth=5&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8D%94%E6%9E%9D-%E6%B0%B4%E6%9E%9C-%E7%BA%A2%E8%89%B2-370476/"
    , name = "荔枝"
    , species = "水果"
    , harvest = [ 5, 6, 7, 8 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730220107&selectMonth=2&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8F%A0%E8%8F%9C-%E6%9C%89%E6%9C%BA-%E5%81%A5%E5%BA%B7-1501218/"
    , name = "菠菜"
    , species = "蔬菜"
    , harvest = [ 2, 3, 4, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=104&selectMonth=10&__M=True"
    , imgFrom = "http://world-crops.com/water-caltrop-trapa-natans/"
    , name = "菱角"
    , species = "根莖類"
    , harvest = [ 10 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=100&selectMonth=7&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8A%B1%E7%94%9F%E7%B1%B3-%E8%90%A5%E5%85%BB-%E5%81%A5%E5%BA%B7-%E9%A3%9F%E5%93%81-%E5%85%B3%E9%97%AD-618544/"
    , name = "落花生"
    , species = "豆類"
    , harvest = [ 7, 8 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730203821&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E7%B4%AB%E8%91%A1%E8%90%84-%E8%91%A1%E8%90%84%E5%9B%AD-%E7%BA%B3%E5%B8%95%E8%B0%B7-%E7%BA%B3%E5%B8%95%E8%91%A1%E8%90%84%E5%9B%AD-%E8%91%A1%E8%90%84-%E8%97%A4-%E8%91%A1%E8%90%84%E8%97%A4-%E9%85%BF%E9%85%92%E8%91%A1%E8%90%84-553464/"
    , name = "葡萄"
    , species = "水果"
    , harvest = [ 1, 2, 6, 7, 8, 9, 10, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730202804&selectMonth=8&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%91%A1%E8%90%84%E6%9F%9A-%E5%8A%A0%E5%B7%9E%E7%94%9F%E4%BA%A7-%E6%B0%B4%E6%9E%9C-%E9%83%A8%E9%97%A8-%E7%99%BE%E8%B4%A7%E5%95%86%E5%BA%97-saikaya-%E9%A3%9F%E5%93%81-1596037/"
    , name = "葡萄柚"
    , species = "水果"
    , harvest = [ 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129115301&selectMonth=1&__M=True"
    , imgFrom = "http://wp.me/p176qF-5B"
    , name = "蓮藕"
    , species = "根莖類"
    , harvest = [ 1, 2, 7, 8, 9, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_Y2xhcmEtc3Vu_20101129133924&selectMonth=4&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%94%AC%E8%8F%9C-%E8%8A%A6%E7%AC%8B-%E5%B8%82%E5%9C%BA-740446/"
    , name = "蘆筍"
    , species = "根莖類"
    , harvest = [ 4, 5, 6, 7, 8, 9, 10 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205503&selectMonth=9&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%8B%B9%E6%9E%9C-%E7%BA%A2%E8%89%B2-%E6%B0%B4%E6%9E%9C-%E6%88%90%E7%86%9F-%E6%94%B6%E8%8E%B7-1589874/"
    , name = "蘋果"
    , species = "水果"
    , harvest = [ 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730211845&selectMonth=1&__M=True"
    , imgFrom = "http://kaohsiungagriculture.weebly.com/102241801126376332671226376--3033329577343673406831680.html"
    , name = "蘿蔔"
    , species = "根莖類"
    , harvest = [ 1, 2, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=106&selectMonth=1&__M=True"
    , imgFrom = "http://www.harvest.org.tw/Articles/ArticleContent/126127?page=1&actionname=Magazine_ArticlesRecommend&unit=193"
    , name = "虎頭柑"
    , species = "水果"
    , harvest = [ 1, 2, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=107&selectMonth=1&__M=True"
    , imgFrom = "http://dashefarmer.com/?product=%E9%AB%98%E9%9B%848%E8%99%9F%E7%8F%8D%E5%AF%B6-%E7%89%B9%E7%B4%9A"
    , name = "蜜棗"
    , species = "水果"
    , harvest = [ 1, 2, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730201500&selectMonth=5&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%A5%BF%E7%93%9C-%E7%93%9C-%E5%A4%9A%E6%B1%81-%E6%B0%B4%E6%9E%9C-%E9%A3%9F%E5%93%81-%E7%BE%8E%E5%91%B3-%E5%90%83-%E5%81%A5%E5%BA%B7-%E7%BA%B8%E6%B5%86-%E7%BB%B4%E7%94%9F%E7%B4%A0-815072/"
    , name = "西瓜"
    , species = "水果"
    , harvest = [ 5, 6, 7, 8 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730215632&selectMonth=4&__M=True"
    , imgFrom = "http://www.douguo.com/cookbook/192391.html"
    , name = "豇豆"
    , species = "豆類"
    , harvest = [ 4, 5, 6, 7, 8, 9 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214300&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%94%AC%E8%8F%9C-%E8%B1%8C%E8%B1%86-%E7%BB%B4%E7%94%9F%E7%B4%A0-%E5%B8%82%E5%9C%BA-780528/"
    , name = "豌豆"
    , species = "豆類"
    , harvest = [ 1, 2, 3, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730200440&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E5%93%88%E6%96%AF%E9%B3%84%E6%A2%A8-%E9%B3%84%E6%A2%A8-%E6%B0%B4%E6%9E%9C-%E9%A3%9F%E5%93%81-%E6%A0%91-%E7%BB%BF%E8%89%B2-%E6%88%90%E9%95%BF-%E6%9D%9F-%E7%89%B9%E5%86%99-945418/"
    , name = "酪梨"
    , species = "水果"
    , harvest = [ 1, 2, 6, 7, 8, 9, 10, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730202105&selectMonth=1&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E7%95%AA%E8%8D%94%E6%9E%9D"
    , name = "釋迦"
    , species = "水果"
    , harvest = [ 1, 7, 8, 9, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730205357&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E6%B0%B4%E6%9E%9C-%E6%A9%99-%E9%87%91%E6%A9%98-%E4%B8%A5%E9%87%8D%E8%80%85-%E5%B8%82%E5%9C%BA-%E9%87%87%E8%B4%AD-%E5%81%A5%E5%BA%B7-%E7%94%9F%E7%89%A9-%E9%A3%9F%E5%93%81-1534487/"
    , name = "金棗"
    , species = "水果"
    , harvest = [ 1, 2, 3, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730211423&selectMonth=8&__M=True"
    , imgFrom = "https://zh.wikipedia.org/wiki/%E4%BD%9B%E6%89%8B%E7%93%9C"
    , name = "隼人瓜"
    , species = "水果"
    , harvest = [ 8, 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214743&selectMonth=9&__M=True"
    , imgFrom = "http://www.cookingnow.com.tw/foodmapSelect.php?class=vegetable&ingredientNo=80"
    , name = "青江菜"
    , species = "蔬菜"
    , harvest = [ 9, 10, 11 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730212940&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E8%94%AC%E8%8F%9C-%E8%A5%BF%E5%85%B0%E8%8A%B1-%E7%99%BD%E8%8F%9C-%E5%B8%82%E5%9C%BA-%E7%BB%B4%E7%94%9F%E7%B4%A0-673181/"
    , name = "青花菜"
    , species = "蔬菜"
    , harvest = [ 1, 2, 3, 4, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730214527&selectMonth=1&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E5%9C%9F%E8%B1%86-%E8%94%AC%E8%8F%9C-%E5%8E%9F-%E9%A3%9F%E5%93%81-%E9%A9%AC%E9%93%83%E8%96%AF-%E6%96%B0%E9%B2%9C-%E5%81%A5%E5%BA%B7-%E6%9C%89%E6%9C%BA-%E7%B4%A0-%E6%94%B6%E8%8E%B7-411975/"
    , name = "馬鈴薯"
    , species = "根莖類"
    , harvest = [ 1, 2, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=99&selectMonth=6&__M=True"
    , imgFrom = "http://www.hdares.gov.tw/view.php?catid=3798&print=1"
    , name = "高接梨"
    , species = "水果"
    , harvest = [ 6, 7, 8 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=101&selectMonth=5&__M=True"
    , imgFrom = "https://pixabay.com/zh/%E9%AB%98%E7%B2%B1-%E7%94%9C%E9%AB%98%E7%B2%B1-%E7%A7%8D%E5%AD%90-%E8%83%A1%E5%B8%83%E5%88%A9-%E5%8D%B0%E5%BA%A6-%E4%BD%9C%E7%89%A9-%E9%A3%9F%E5%93%81-%E6%A4%8D%E7%89%A9-%E8%87%AA%E7%84%B6-275258/"
    , name = "高粱"
    , species = "穀類"
    , harvest = [ 5, 6, 7, 8, 10, 11, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730202224&selectMonth=1&__M=True"
    , imgFrom = "http://cookingnow.com.tw/foodmapSelect.php?ingredientNo=79"
    , name = "鳳梨釋迦"
    , species = "水果"
    , harvest = [ 1, 2, 3, 4, 12 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730213526&selectMonth=3&__M=True"
    , imgFrom = "http://tzfa-et.myweb.hinet.net/Agricultural%20product/Bamboo%20shoot.htm"
    , name = "麻竹筍"
    , species = "根莖類"
    , harvest = [ 3, 4, 5, 6, 7, 8, 9, 10 ]
    }
  , { url = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductDetail.aspx?id=product_basic_YmJqYWNrc29u_20090730203646&selectMonth=7&__M=True"
    , imgFrom = "http://cafe.cook1cook.com/posts/2767"
    , name = "龍眼"
    , species = "水果"
    , harvest = [ 7, 8, 9 ]
    }
  ]


data :
  List
    { currentType : String
    , list : List Food
    }
data =
  normalize rowData foodTypes
