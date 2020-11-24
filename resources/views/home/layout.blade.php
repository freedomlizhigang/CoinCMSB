<!doctype html>
<html lang="zh-cn">

<head>
    <meta charset="utf-8">
    <title>{{ $seo['title'] }}</title>
    <meta name="keywords" content="{{ $seo['keyword'] }}">
    <meta name="description" content="{{ $seo['describe'] }}">
    <meta name="author" content="希夷：www.xi-yi.ren" />
    <!-- IE最新兼容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 国产浏览器高速/微信开发不要用 -->
    <meta name="renderer" content="webkit">
    <!-- 移动设备禁止缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="{{ $sites['static']}}home/images/favicon.png">
    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="{{ $sites['static']}}home/images/app.png">
    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Mzsj" />
    <link rel="apple-touch-icon-precomposed" href="{{ $sites['static']}}home/images/app.png">
    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="{{ $sites['static']}}home/images/app.png">
    <meta name="msapplication-TileColor" content="#0e90d2">
    <link rel="stylesheet" href="{{ $sites['static']}}home/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{ $sites['static']}}home/css/home.css">
    <script src="{{ $sites['static']}}home/js/jquery.min.js"></script>
    <script src="{{ $sites['static']}}home/js/bootstrap.min.js"></script>
    <script src="{{ $sites['static']}}home/js/com.js"></script>
</head>

<body>
    <!-- Head -->
    <header class="head clearfix container">
        <div class="row">
            <h1 class="col-xs-6"><a class="logo-font" href="/">{{ cache('config')['sitename'] }}</a></h1>
            <div class="dh text-right col-xs-6 hidden-xs hidden-sm">
                <p>客服电话：{{ cache('config')['phone'] }}</p>
            </div>
            <div class="col-xs-6">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav_top_ul" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
        </div>
    </header>
   <!-- 导航 -->
    <div id="nav_top">
        <nav class="container">
            <div class="collapse navbar-collapse" id="nav_top_ul">
              <ul class="nav navbar-nav">
                <li @if(!isset($info)) class="active" @endif><a href="/">首页</a></li>
                @foreach(App::make('tag')->categorys() as $c)
                <li @if(isset($info) && $info->pid == $c->id) class="active"@endif><a href="{{ url('cate',['url'=>$c->url]) }}">{{ $c->name }}</a></li>
                @endforeach
              </ul>
            </div>
        </nav>
    </div>
    <!-- banner -->
    <div class="banner jumbotron">
        <div class="b_img"></div>
    </div>

    <!-- 主内容 -->
    @yield('content')

    <!-- 版权 -->
    <footer class="foot container-fluid text-center">
        <p>电话：<a href="tel:{{ cache('config')['phone'] }}">{{ cache('config')['phone'] }}</a> 邮箱：{{ cache('config')['email'] }}</p>
        <p>{{ cache('config')['address'] }}</p>
        <p>CopyRight @ 2018-2020</p>
    </footer>
</body>

</html>