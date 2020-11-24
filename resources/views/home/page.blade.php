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
            <div class="page_content mt30">
                {!! $info->content !!}
            </div>
        </article>
    </div>
</section>

@endsection