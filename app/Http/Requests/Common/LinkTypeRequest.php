<?php
/*
 * @package [App\Http\Requests]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 友情链接分类验证
 *
 */
namespace App\Http\Requests\Common;

use Illuminate\Foundation\Http\FormRequest;

class LinkTypeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'data.name' => 'required|max:255',
        ];
    }
    public function attributes()
    {
        return [
            'data.name' => '名称',
        ];
    }
}
