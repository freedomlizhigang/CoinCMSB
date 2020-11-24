<?php
/*
 * @package [App\Models\Coin]
 * @author [李志刚]
 * @createdate  [2018-08-06]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 工作流-负责人
 *
 */
namespace App\Models\Coin;

use Illuminate\Database\Eloquent\Model;

class WorkflowAdmin extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'workflow_admin';

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

    // 关联工作流
    public function workflow()
    {
        return $this->belongsTo('\App\Models\Coin\Workflow','workflow_id','id');
    }

    // 关联管理员
    public function admin()
    {
        return $this->belongsTo('\App\Models\Console\Admin','admin_id','id');
    }
}
