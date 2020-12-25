
const String IMAGEICON = """
```
const Image({     
     this.width, //图片的宽
     this.height, //图片高度
     this.color, //图片的混合色值
     this.colorBlendMode, //混合模式
     this.fit,//缩放模式
     this.alignment = Alignment.center, //对齐方式
     this.repeat = ImageRepeat.noRepeat, //重复方式
})
```
```
Image.asset("images/avatar.png",
  width: 100.0,
)
```
```
Image.network(
  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
  width: 100.0,
)
```
   """;
