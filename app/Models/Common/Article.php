<?php
/*
 * @package [App\Models\Common]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 文章模型
 *
 */
namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Article extends Model
{

    use Searchable;

    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'articles';

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

    // 标识为时间
    protected $dates = [
        'created_at',
        'updated_at',
        'publish_at'
    ];

    /**
     * 搜索索引
     *
     * @return string
     */
    public function searchableAs()
    {
        return 'articles_index';
    }

    /**
     * 索引数据
     *
     * @return array
     */
    public function toSearchableArray()
    {
        return $this->only('id', 'title', 'keywords','describe', 'content');
    }

    // 关联categorys
    public function cate()
    {
        return $this->belongsTo('\App\Models\Common\Cate','cate_id','id');
    }

    // 关联发布人
    public function admin()
    {
        return $this->belongsTo('\App\Models\Console\Admin','admin_id','id');
    }
    // 点击量
    public function hit()
    {
        return $this->hasMany('\App\Models\Coin\Hit','art_id','id');
    }
}