@extends('admin.right')

@if(App::make('com')->ifCan('linktype-add'))
@section('rmenu')
	<div data-url="{{ url('/console/linktype/add') }}" data-title="添加分类" data-toggle='modal' data-target='#myModal' class="btn btn-xs btn-default btn_modal"><span class="glyphicon glyphicon-plus"></span> 添加分类</div>
@endsection
@endif

@section('content')
<table class="table table-striped table-hover">
	<tr class="active">
		<th width="50">ID</th>
		<th>分类名称</th>
		<th width="80">操作</th>
	</tr>
	@foreach($list as $m)
	<tr>
		<td>{{ $m->id }}</td>
		<td>{{ $m->name }}</td>
		<td>
			@if(App::make('com')->ifCan('linktype-edit'))
			<div data-url="{{ url('/console/linktype/edit',$m->id) }}" data-title="修改" data-toggle='modal' data-target='#myModal' class="btn btn-xs btn-info glyphicon glyphicon-edit btn_modal"></div>
			@endif
			@if(App::make('com')->ifCan('linktype-del'))
			<a href="{{ url('/console/linktype/del',$m->id) }}" class="btn btn-xs btn-danger glyphicon glyphicon-trash confirm"></a>
			@endif
		</td>
	</tr>
	@endforeach
</table>
<!-- 分页，appends是给分页添加参数 -->
<div class="pages clearfix">
{!! $list->links() !!}
</div>
@endsection