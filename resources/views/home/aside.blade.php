<aside class="col-md-3 hidden-xs hidden-sm">
    <!-- 导航 -->
    <ul class="list_aside">
        <li><h2>{{ $info->name }}</h2></li>
        @foreach(App::make('tag')->categorys(0) as $c)
        <li @if($info->pid == $c->id) class="active"@endif><a href="{{ url('cate',['url'=>$c->url]) }}">{{ $c->name }}</a></li>
        @endforeach
    </ul>
    <h3 class="h3_cate mt20"><span class="h3_cate_span">最新产品</span><a href="{{ url('/cate',['url'=>cache('cateCache')['3']['url']]) }}" class="more">更多>></a></h3>
    <ul class="row list_pro">
        @foreach(App::make('tag')->list(3,6) as $a)
        <li class="col-xs-6 overh">
            <a href="{{ url('/post',['url'=>$a->url]) }}"><img src="{{ $a->thumb }}" class="img-responsive" alt="{{ $a->title }}"></a>
            <a href="{{ url('/post',['url'=>$a->url]) }}" class="text-center list_pro_title center-block">{{ $a->title }}</a>
        </li>
        @endforeach
    </ul>
    <h3 class="h3_cate mt20"><span class="h3_cate_span">新闻资讯</span><a href="{{ url('/cate',['url'=>cache('cateCache')['2']['url']]) }}" class="more">更多>></a></h3>
    <ul class="list_news">
        @foreach(App::make('tag')->list(2,5) as $a)
        <li><a href="{{ url('/post',['url'=>$a->url]) }}" class="list_news_title">{{ $a->title }}</a></li>
        @endforeach
    </ul>
</aside>