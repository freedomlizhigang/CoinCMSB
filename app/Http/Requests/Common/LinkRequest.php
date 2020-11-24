<?php
/*
 * @package [App\Http\Requests]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 友情链接验证
 *
 */
namespace App\Http\Requests\Common;

use Illuminate\Foundation\Http\FormRequest;

class LinkRequest extends FormRequest
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
            'data.sitename' => 'required|max:255|unique:links,sitename,'.$this->segment('4'),
            'data.thumb' => 'required|max:255',
            'data.linkurl' => 'required|max:255|url',
            'data.sort' => 'required|integer',
        ];
    }
    public function attributes()
    {
        return [
            'data.sitename' => '名称',
            'data.thumb' => '图片',
            'data.linkurl' => '链接',
            'data.sort' => '排序',
        ];
    }
}
