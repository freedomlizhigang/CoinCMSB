@extends('admin.right')

@section('rmenu')
@if(App::make('com')->ifCan('link-add'))
	<div data-url="{{ url('/console/link/add') }}" data-title="添加友情链接" data-toggle='modal' data-target='#myModal' class="btn btn-xs btn-default btn_modal"><span class="glyphicon glyphicon-plus"></span> 添加友情链接</div>
@endif

@endsection

@section('content')
<!-- 选出栏目 -->
<div class="clearfix">
	<form action="" class="form-inline" method="get">
		<select name="typeid" id="typeid" class="form-control">
			<option value="">请选择分类</option>
			@foreach($types as $l)
			<option value="{{ $l->id }}">{{ $l->name }}</option>
			@endforeach
		</select>
		<input type="text" name="q" class="form-control" placeholder="请输入关键字..">
		<button class="btn btn-xs btn-info">搜索</button>
	</form>
</div>
<form action="" class="form-inline form_submit" method="get">
{{ csrf_field() }}
<table class="table table-striped table-hover mt10">
	<tr class="active">
		<th width="30"><input type="checkbox" class="checkall"></th>
		<th width="80">排序</th>
		<th width="50">ID</th>
		<th width="200">名称</th>
		<th width="200">图片</th>
		<th>链接地址</th>
		<th width="80">操作</th>
	</tr>
	@foreach($list as $a)
	<tr>
		<td><input type="checkbox" name="sids[]" class="check_s" value="{{ $a->id }}"></td>
		<td><input type="text" min="0" name="sort[{{$a->id}}]" value="{{ $a->sort }}" class="form-control input-xs"></td>
		<td>{{ $a->id }}</td>
		<td>
			<p class="text-primary">{{ $a->sitename }}</p>
			<p class="text-muted">{{ optional($a->linktype)->name }}</p>
		</td>
		<td><img src="{{ $a->thumb }}" width="140" class="pull-left img-responsive mr10" height="auto" alt=""></td>
		<td>{{ $a->linkurl }}</td>
		<td>
			@if(App::make('com')->ifCan('link-edit'))
			<div data-url="{{ url('/console/link/edit',['id'=>$a->id]) }}" data-title="修改友情链接" data-toggle='modal' data-target='#myModal' class="btn btn-xs btn-info glyphicon glyphicon-edit btn_modal"></div>
			@endif
			@if(App::make('com')->ifCan('link-del'))
			<a href="{{ url('/console/link/del',$a->id) }}" class="confirm btn btn-xs btn-danger glyphicon glyphicon-trash"></a>
			@endif
		</td>
	</tr>
	@endforeach
</table>
</form>
<!-- 分页，appends是给分页添加参数 -->
<div class="pull-left" data-toggle="buttons">
	<div class="btn-group">
		<label class="btn btn-xs btn-primary"><input type="checkbox" autocomplete="off" class="checkall">全选</label>
	</div>

	@if(App::make('com')->ifCan('link-sort'))
	<span class="btn btn-xs btn-warning btn_sort">排序</span>
	@endif
</div>
<!-- 分页，appends是给分页添加参数 -->
<div class="pages clearfix">
{!! $list->appends(['q'=>$key,'typeid'=>$typeid])->links() !!}
</div>
<!-- 选中当前栏目 -->
<script>
	$(function(){
		$('.btn_sort').click(function(){
			$('.form_submit').attr({'action':"{{ url('/console/link/sort') }}",'method':'post'}).submit();
		});
		$(".checkall").bind('change',function(){
			if($(this).is(":checked"))
			{
				$(".check_s").each(function(s){
					$(".check_s").eq(s).prop("checked",true);
				});
			}
			else
			{
				$(".check_s").each(function(s){
					$(".check_s").eq(s).prop("checked",false);
				});
			}
		});
	});
</script>
@endsection