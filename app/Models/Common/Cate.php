<?php
/*
 * @package [App\Models\Common]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 栏目
 *
 */
namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;

class Cate extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'categorys';

    // 不可以批量赋值的字段，为空则表示都可以
    protected $guarded = [];

    /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $hidden = [];

    /**
     * 表明模型是否应该被打上时间戳
     *
     * @var bool
     */
    public $timestamps = true;

    // 关联articles表
    public function article()
    {
        return $this->hasMany('\App\Models\Common\Article','cate_id','id');
    }

    // 关联工作流
    public function workflow()
    {
        return $this->belongsTo('\App\Models\Coin\Workflow','workflow_id','id');
    }

    // 点击量
    public function hits()
    {
        return $this->hasMany('\App\Models\Coin\Hit','cate_id','id');
    }
}