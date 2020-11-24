<?php
/*
 * @package [App\Models\Console]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 管理员
 *
 */
namespace App\Models\Console;

use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'admins';

    // 不可以批量赋值的字段，为空则表示都可以
    protected $guarded = [];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'crypt',
    ];

    /**
     * 表明模型是否应该被打上时间戳
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * 用户组
     */
    public function role()
    {
        return $this->belongsToMany('\App\Models\Console\Role','role_users','user_id','role_id');
    }

    // 关联
    public function section()
    {
        return $this->belongsTo('\App\Models\Console\Section','section_id','id');
    }

    /**
     * 工作流
     */
    public function workflow()
    {
        return $this->belongsToMany('\App\Models\Coin\Workflow','workflow_admin','admin_id','workflow_id');
    }
    // 关联工作流中间表
    public function workflow_admin()
    {
        return $this->hasMany('\App\Models\Coin\WorkflowAdmin','admin_id','id');
    }
    // 关联工作流日志
    public function workflow_log()
    {
        return $this->hasMany('\App\Models\Coin\WorkflowLog','admin_id','id');
    }

    // 发布的文章
    public function article()
    {
        return $this->hasMany('\App\Models\Common\Article','admin_id','id');
    }
}
