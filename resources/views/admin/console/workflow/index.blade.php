@extends('admin.right')

@if(App::make('com')->ifCan('workflow-add'))
@section('rmenu')
	<div data-url="{{ url('/console/workflow/add') }}" data-title="添加工作流" data-toggle='modal' data-target='#myModal' class="btn btn-xs btn-default btn_modal"><span class="glyphicon glyphicon-plus"></span> 添加工作流</div>
@endsection
@endif

@section('content')
<table class="table table-striped table-hover">
	<tr class="active">
		<th width="50">ID</th>
		<th width="200">工作流</th>
		<th width="100">级别</th>
		<th>负责人</th>
		<th width="80">操作</th>
	</tr>
	@foreach($list as $m)
	<tr>
		<td>{{ $m->id }}</td>
		<td>
			<p class="text-primary">名称：{{ $m->workname }}</p>
			<p class="text-success">描述：{{ $m->description }}</p>
		</td>
		<td>
			@switch($m->steps)
				@case(4)
					<p class="text-danger">四级审核</p>
					@break
				@case(3)
					<p class="text-danger">三级审核</p>
					@break
				@case(2)
					<p class="text-danger">二级审核</p>
					@break
				@default
					<p class="text-danger">一级审核</p>
					@break
			@endswitch
		</td>
		<td>
			<p class="text-muted">
				一级审核负责人：
				@foreach($m->workflow_admin->where('steps',1)->all() as $a)
					<span class="text-primary mr10">{{ optional($a->admin)->realname }}</span>
				@endforeach
			</p>
			@if($m->steps >= 2)
			<p class="text-muted">
				二级审核负责人：
				@foreach($m->workflow_admin->where('steps',2)->all() as $a)
					<span class="text-success mr10">{{ optional($a->admin)->realname }}</span>
				@endforeach
			</p>
			@endif
			@if($m->steps >= 3)
			<p class="text-muted">
				三级审核负责人：
				@foreach($m->workflow_admin->where('steps',3)->all() as $a)
					<span class="text-warning mr10">{{ optional($a->admin)->realname }}</span>
				@endforeach
			</p>
			@endif
			@if($m->steps >= 4)
			<p class="text-muted">
				四级审核负责人：
				@foreach($m->workflow_admin->where('steps',4)->all() as $a)
					<span class="text-danger mr10">{{ optional($a->admin)->realname }}</span>
				@endforeach
			</p>
			@endif
		</td>
		<td>
			@if(App::make('com')->ifCan('workflow-edit'))
			<div data-url="{{ url('/console/workflow/edit',$m->id) }}" data-title="修改" data-toggle='modal' data-target='#myModal' class="btn btn-xs btn-info glyphicon glyphicon-edit btn_modal"></div>
			@endif
			@if(App::make('com')->ifCan('workflow-del'))
			<a href="{{ url('/console/workflow/del',$m->id) }}" class="btn btn-xs btn-danger glyphicon glyphicon-trash confirm"></a>
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