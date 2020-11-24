<form action="javascript:ajax_submit();" method="post" id="form_ajax">
    {{ csrf_field() }}

	<table class="table table-striped">
        <tr>
            <td class="td_left">工作流名称：</td>
            <td>
                <input type="text" name="data[workname]" class="form-control input-sm" value="{{ old('data.workname',$info->workname) }}">
                <p class="input-info"><span class="color_red">*</span>最多50字符</p>
            </td>
        </tr>
        <tr>
            <td class="td_left">描述：</td>
            <td>
                <textarea name="data[description]" class="form-control" rows="5">{{ old('data.description',$info->description) }}</textarea>
                <p class="input-info">最多255字符</p>
            </td>
        </tr>
        <tr>
            <td class="td_left">级别：</td>
            <td>
                <select name="data[steps]" id="steps" class="form-control input-sm">
                    <option value="1">一级审核</option>
                    <option value="2">二级审核</option>
                    <option value="3">三级审核</option>
                    <option value="4">四级审核</option>
                </select>
                <p class="input-info"><span class="color_red">*</span>几级代表需要几次审核</p>
            </td>
        </tr>
        <tr>
            <td class="td_left">负责人：</td>
            <td>
                <div class="form-group steps" id="steps1">
                    <p class="text-muted">一级审核人：</p>
                    @foreach($admins as $r)
                    <label class="checkbox-inline"><input type="checkbox" name="admin_id[1][]" value="{{ $r->
                        id }}" @if($workflow_admin->where('steps',1)->where('admin_id',$r->id)->first() != null) checked="checked" @endif> {{ $r->realname }}</label>
                    @endforeach
                </div>
                <div class="form-group steps dn" id="steps2">
                    <p class="text-muted">二级审核人：</p>
                    @foreach($admins as $r)
                    <label class="checkbox-inline"><input type="checkbox" name="admin_id[2][]" value="{{ $r->
                        id }}" @if($workflow_admin->where('steps',2)->where('admin_id',$r->id)->first() != null) checked="checked" @endif> {{ $r->realname }}</label>
                    @endforeach
                </div>
                <div class="form-group steps dn" id="steps3">
                    <p class="text-muted">三级审核人：</p>
                    @foreach($admins as $r)
                    <label class="checkbox-inline"><input type="checkbox" name="admin_id[3][]" value="{{ $r->
                        id }}" @if($workflow_admin->where('steps',3)->where('admin_id',$r->id)->first() != null) checked="checked" @endif> {{ $r->realname }}</label>
                    @endforeach
                </div>
                <div class="form-group steps dn" id="steps4">
                    <p class="text-muted">四级审核人：</p>
                    @foreach($admins as $r)
                    <label class="checkbox-inline"><input type="checkbox" name="admin_id[4][]" value="{{ $r->
                        id }}" @if($workflow_admin->where('steps',4)->where('admin_id',$r->id)->first() != null) checked="checked" @endif> {{ $r->realname }}</label>
                    @endforeach
                </div>
            </td>
        </tr>
    </table>
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <div onclick='ajax_submit_form("form_ajax","{{ url('/console/workflow/edit',['id'=>$info->id]) }}")' name="dosubmit" class="btn btn-info">提交</div>
    </div>
</form>
<script>
    $(function(){
        $('#steps').change(function() {
            var steps = $(this).val();
            $('.steps').hide();
            if (steps == 1) {
                $('#steps1').show();
            }
            if (steps == 2) {
                $('#steps1,#steps2').show();
            }
            if (steps == 3) {
                $('#steps1,#steps2,#steps3').show();
            }
            if (steps == 4) {
                $('#steps1,#steps2,#steps3,#steps4').show();
            }
        });
        var steps = "{{ $info->steps }}";
        if (steps == 1) {
            $('.steps').hide();
            $('#steps1').show();
        }
        if (steps == 2) {
            $('.steps').hide();
            $('#steps1,#steps2').show();
        }
        if (steps == 3) {
            $('.steps').hide();
            $('#steps1,#steps2,#steps3').show();
        }
        if (steps == 4) {
            $('.steps').hide();
            $('#steps1,#steps2,#steps3,#steps4').show();
        }
        $('#steps option[value="{{ $info->steps }}"]').prop('selected','selected');
    })
</script>