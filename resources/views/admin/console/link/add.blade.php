<form action="javascript:;" method="post" id="form_ajax">
	{{ csrf_field() }}

    <table class="table table-striped">

        <tr>
            <td class="td_left">分类：</td>
            <td>
                <select name="data[link_type_id]" id="typeid" class="form-control input-sm">
                    @foreach($types as $l)
                    <option value="{{ $l->id }}">{{ $l->name }}</option>
                    @endforeach
                </select>
            </td>
        </tr>

        <tr>
            <td class="td_left">名称：</td>
            <td>
                <input type="text" name="data[sitename]" value="{{ old('data.sitename') }}" class="form-control input-sm">
                <p class="input-info"><span class="color_red">*</span>不超过255字符</p>
            </td>
        </tr>

        <tr>
            <td class="td_left">缩略图：</td>
            <td>
                @component('admin.component.thumb')
                    @slot('filed_name')
                        thumb
                    @endslot
                    {{ old('data.thumb') }}
                @endcomponent
            </td>
        </tr>

        <tr>
            <td class="td_left">链接：</td>
            <td>
                <input type="text" name="data[linkurl]" value="{{ old('data.linkurl') }}" class="form-control input-sm">
                <p class="input-info"><span class="color_red">*</span>网址链接</p>
            </td>
        </tr>


        <tr>
            <td class="td_left">排序：</td>
            <td>
                <input type="text" name="data[sort]" value="{{ old('data.sort',0) }}" class="form-control input-xs">
                <p class="input-info"><span class="color_red">*</span>越大越靠前</p>
            </td>
        </tr>

    </table>

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <div onclick='ajax_submit_form("form_ajax","{{ url('/console/link/add') }}")' name="dosubmit" class="btn btn-info">提交</div>
    </div>

</form>
