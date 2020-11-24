<?php
/*
 * @package [App\Models\Coin]
 * @author [李志刚]
 * @createdate  [2018-08-06]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 点击量
 *
 */
namespace App\Models\Coin;

use Illuminate\Database\Eloquent\Model;

class Hit extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'hits';

    // 不可以批量赋值的字段，为空则表示都可以
    protected $guarded = [];

    /**
     * The attributes excluded from the model's JSON form.
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

    // 文章
    public function article()
    {
        return $this->belongsTo('\App\Models\Common\Article','art_id','id');
    }
    // 栏目
    public function cate()
    {
        return $this->belongsTo('\App\Models\Common\Cate','cate_id','id');
    }
}
