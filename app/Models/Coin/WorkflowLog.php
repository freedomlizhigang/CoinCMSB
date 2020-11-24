<?php
/*
 * @package [App\Models\Coin]
 * @author [李志刚]
 * @createdate  [2018-08-06]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 审核日志
 *
 */
namespace App\Models\Coin;

use Illuminate\Database\Eloquent\Model;

class WorkflowLog extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'workflow_logs';

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

    // 找用户
    public function admin()
    {
        return $this->belongsTo('\App\Models\Console\Admin','admin_id','id');
    }
}
