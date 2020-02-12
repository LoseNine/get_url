# get_url
Erlang 获取HTML文本中的href

### 函数入口

```erlang

%InFilename是获取的网页HTML文本名
%OutFilename是要输出URL的文本名
process(InFilename,OutFilename)

```

### 如HTML文本
```
<li>
  <h2><a href="/mingyanjingju/5539.html" class="title" target="_blank"><b>塞涅卡名人名言</b></a></h2>
  <span class="info">
    <small>日期：</small><font >2018-04-22</font></span>
  <p class="intro">塞涅卡名人名言1、把每时每刻都用在自己的事业上的人，对他来说都是足够的原因&mdash;&mdash;塞涅</p>
</li>


<li>
  <h2><a href="/mingyanjingju/5538.html" class="title" target="_blank"><b>赫兹里特名言</b></a></h2>
  <span class="info">
    <small>日期：</small><font >2018-04-22</font></span>
  <p class="intro">赫兹里特名言1、毫无的缺点的人显然是不存在的，因为他无法在这个世界上找到一个朋友，他似乎属于</p>
</li>

```
### 获取结果为
```

/mingyanjingju/5538.html
/mingyanjingju/5539.html
```
