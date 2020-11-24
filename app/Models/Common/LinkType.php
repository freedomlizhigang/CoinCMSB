<?php
/*
 * @package [App\Models\Common]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 友情链接分类
 *
 */
namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;

class LinkType extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'link_types';

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

    // 链接
    public function link()
    {
        return $this->hasMany('\App\Models\Common\Link','link_type_id','id');
    }
}