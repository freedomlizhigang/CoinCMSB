<?php

namespace App\Http\Requests\Coin;

use Illuminate\Foundation\Http\FormRequest;

class WorkflowRequest extends FormRequest
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
            'data.workname' => 'required|max:255',
            'data.steps' => 'required|integer|in:1,2,3,4',
            'data.description' => 'max:255',
        ];
    }
    public function attributes()
    {
        return [
            'data.workname' => '标题',
            'data.steps' => '级别',
            'data.description' => '描述',
        ];
    }
}