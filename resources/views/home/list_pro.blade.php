@extends('home.layout')

@section('content')

<section class="container mt20">
    <div class="row">
        <!-- 左边 -->
        @include('home.aside')
        <!-- 右边 -->
        <article class="col-xs-12 col-md-9">
            <ol class="breadcrumb">
                {{ app('tag')->catpos($info->id) }}
            </ol>
            <h3 class="h3_cate"><span class="h3_cate_span">{{ $info->name }}</span></h3>
            <ul class="row list_pro">
                @foreach($list as $a)
                <li class="col-xs-6 col-md-3 overh">
                    <a href="{{ url('/post',['url'=>$a->url]) }}"><img src="{{ $a->thumb }}" class="img-responsive" alt="{{ $a->title }}"></a>
                    <a href="{{ url('/post',['url'=>$a->url]) }}" class="text-center list_pro_title center-block">{{ $a->title }}</a>
                </li>
                @endforeach
            </ul>
            <div class="pages">
                {!! $list->links() !!}
            </div>
        </article>
    </div>
</section>

@endsection