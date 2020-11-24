@extends('admin.right')

@section('rmenu')
@if(App::make('com')->ifCan('art-add'))
<a href="{{ url('/console/art/add',$catid) }}" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-plus"></span> 添加文章</a>
<a href="{{ url('/console/art/index').'?status=99' }}" class="btn btn-xs btn-default @if($status == '99') active @endif"><span class="glyphicon glyphicon-stats"></span> 审核通过</a>
<a href="{{ url('/console/art/index').'?status=1' }}" class="btn btn-xs btn-default @if($status == '1') btn-info active @endif"><span class="glyphicon glyphicon-hourglass"></span> 一级审核</a>
<a href="{{ url('/console/art/index').'?status=2' }}" class="btn btn-xs btn-default @if($status == '2') btn-success active @endif"><span class="glyphicon glyphicon-hourglass"></span> 二级审核</a>
<a href="{{ url('/console/art/index').'?status=3' }}" class="btn btn-xs btn-default @if($status == '3') btn-primary active @endif"><span class="glyphicon glyphicon-hourglass"></span> 三级审核</a>
<a href="{{ url('/console/art/index').'?status=4' }}" class="btn btn-xs btn-default @if($status == '4') btn-warning active @endif"><span class="glyphicon glyphicon-hourglass"></span> 四级审核</a>
<a href="{{ url('/console/art/index').'?status=0' }}" class="btn btn-xs btn-default @if($status == '0') btn-danger active @endif"><span class="glyphicon glyphicon-ban-circle"></span> 退稿</a>
@endif

@endsection


@section('content')
<!-- 选出栏目 -->
<div class="clearfix">
	<form action="" class="form-inline" method="get">
		<select name="catid" id="catid" class="form-control">
			<option value="">请选择栏目</option>
			{!! $cate !!}
		</select>
		<select name="push_flag" id="push_flag" class="form-control">
			<option value="">是否推荐</option>
			<option value="1"@if($push_flag == 1) selected="selected"@endif>推荐</option>
			<option value="0"@if($push_flag == 0) selected="selected"@endif>普通</option>
		</select>
		开始时间：
		<input type="text" name="starttime" class="form-control" value="{{ $starttime }}" id="laydate">
		结束时间：
		<input type="text" name="endtime" class="form-control" value="{{ $endtime }}" value="" id="laydate2">
		<input type="text" name="q" value="{{ $key }}" class="form-control" placeholder="请输入文章标题关键字..">
		<button class="btn btn-xs btn-info">查找</button>
	</form>
</div>
<form action="{{ url('/console/art/alldel') }}" class="form-inline form_status" method="get">
	{{ csrf_field() }}
	<table class="table table-striped table-hover mt10">
		<tr class="active">
			<th width="30">
				<input type="checkbox" class="checkall"></th>
			<th width="60">排序</th>
			<th width="50">ID</th>
			<th>标题</th>
			<th width="100">发布人</th>
			<th width="100">栏目</th>
			<th width="100">点击量</th>
			<th width="180">发布时间</th>
			<th width="100">操作</th>
		</tr>
		@foreach($list as $a)
		<tr>
			<td>
				<input type="checkbox" name="sids[]" class="check_s" value="{{ $a->id }}"></td>
			<td>
				<input type="text" name="sort[{{ $a->id }}]" class="form-control input-xs" value="{{ $a->sort }}"></td>
			<td>{{ $a->id }}</td>
			<td>
				@switch($a->status)
					@case(4)
						<span class="label label-warning">四级</span>
						@break
					@case(3)
						<span class="label label-primary">三级</span>
						@break
					@case(2)
						<span class="label label-success">二级</span>
						@break

					@case(1)
						<span class="label label-info">一级</span>
						@break

					@case(0)
						<span class="label label-danger">退稿</span>
						@break

					@default
						@break
				@endswitch
				<span data-url="{{ url('/console/art/show',$a->id) }}" data-title="查看文章详细" data-toggle='modal' data-target='#myModal' class="btn_modal curp text-primary">{{ $a->title }}</span>
				@if($a->thumb != '')
				<span class="color_red">图</span>
				@endif
				@if($a->push_flag == 1)
				<span class="text-success">荐</span>
				@endif
			</td>
			<td class="text-primary">{{ optional($a->admin)->realname }}</td>
			<td class="text-success">{{ optional($a->cate)->name }}</td>
			<td class="text-info">{{ is_null($a->hit) ? 0 : $a->hit->count() }}</td>
			<td>{{ $a->publish_at }}</td>
			<td>
				@if(App::make('com')->ifCan('art-edit') && ($a->admin_id == session('console')->id || $is_super))
				<a href="{{ url('/console/art/edit',$a->id) }}" class="btn btn-xs btn-info glyphicon glyphicon-edit"></a>
				@endif
				@if(App::make('com')->ifCan('art-del'))
				<a href="{{ url('/console/art/del',$a->id) }}" class="confirm btn btn-xs btn-danger glyphicon glyphicon-trash"></a>
				@endif
			</td>
		</tr>
		@endforeach
	</table>
	<!-- 添加进专题功能 -->
	<div class="special_div pull-left clearfix" data-toggle="buttons">
		<div class="btn-group">
			<label class="btn btn-xs btn-primary"><input type="checkbox" autocomplete="off" class="checkall">全选</label>
		</div>
		@if(App::make('com')->ifCan('art-sort'))
		<button type="submit" name="dosubmit" class="btn btn-xs btn-info btn_listrorder">排序</button>
		@endif
		<input type="hidden" name="result" class="steps_result" value="1">
		@if(App::make('com')->ifCan('art-allstatus'))
		<button type="submit" name="dosubmit" class="btn btn-xs btn-success btn_allstatus" data-result="1">通过审核</button>
		@endif
		@if(App::make('com')->ifCan('art-allstatus'))
		<button type="submit" name="dosubmit" class="btn btn-xs btn-warning btn_allstatus" data-result="0">退稿</button>
		@endif
		@if(App::make('com')->ifCan('art-alldel'))
		<span class="btn btn-xs btn-danger btn_del">批量删除</span>
		@endif
	</div>
</form>
<!-- 分页，appends是给分页添加参数 -->
<div class="pages clearfix pull-right">
	{!! $list->appends(['catid' =>$catid,'q'=>$key,'push_flag'=>$push_flag,'starttime'=>$starttime,'endtime'=>$endtime,'status'=>$status])->links() !!}
</div>
<!-- 选中当前栏目 -->
<script>
	$(function(){
		$('.btn_listrorder').click(function(){
			$('.form_status').attr({'action':"{{ url('console/art/sort') }}",'method':'post'}).submit();
		});
		$('.btn_allstatus').click(function(){
			$('.steps_result').val($(this).attr('data-result'));
			$('.form_status').attr({'action':"{{ url('console/art/allstatus') }}",'method':'post'}).submit();
		});
		$('.btn_del').click(function(){
			if (!confirm("确实要删除吗?")){
				return false;
			}else{
				$('.form_status').attr({'action':"{{ url('console/art/alldel') }}",'method':'post'}).submit();
			}
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
		$('#catid option[value=' + {{ $catid }} + ']').prop('selected','selected');
	})
	laydate({
        elem: '#laydate',
        format: 'YYYY-MM-DD hh:mm:ss', // 分隔符可以任意定义，该例子表示只显示年月
        istime: true,
    });
    laydate({
        elem: '#laydate2',
        format: 'YYYY-MM-DD hh:mm:ss', // 分隔符可以任意定义，该例子表示只显示年月
        istime: true,
    });
</script>
@endsection