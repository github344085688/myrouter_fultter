
const String RESOURCEADMINISTRATION = '''
## 资源管理
常见类型的assets包括静态数据（例如JSON文件）、配置文件、图标和图片（JPEG，WebP，GIF，动画WebP / GIF，PNG，BMP和WBMP）等。
### __指定 assets__
和包管理一样，Flutter也使用pubspec.yaml文件来管理应用程序所需的资源，举个例子:

>flutter:
>>    assets:
    
   assets/my_icon.png
   
   assets/background.png

   
__给App增加启动屏幕(Splash Screen)并且设置背景颜色__ 
   - __1.首先需要在android=>app=>src=>main=>res=>values下新建一个colors.xml文件，__
   
__其中orange是自定义的颜色。__
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="orange">#FFAB40</color>
    <color name="transparent">#00000000</color>
</resources>
```
   - __2.打开android=>app=>src=>main=>res=>drawable=>launch_background.xml\b__,
 ```
 <?xml version="1.0" encoding="utf-8"?>
<!-- Modify this file to customize your launch splash screen -->
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@android:color/white" />
    <!-- You can insert your own image assets here -->
    <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/launch_image" />
    </item>
</layer-list>
 ```
想自定义颜色，却一直引用不到。后来翻了很多资料和so上的回答，才发现自己马虎大意。

> 需要把原来的 @android:color/white"中的android:去掉即可去掉以后为。
>>  <item android:drawable="@color/orange" />



__将<item>里面的内容反注释，并且准备一张图片分辨率1080 x 1920,放入android=>app=>src=>main=>res=>mipmap-xxhdpi即可。__
> 注意名字改成launch_image即可。或者你可以用别的名字，把上面的xml文件改一下即可
''';
