<?php

namespace App\Http\Controllers\Admin\Coin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Coin\WorkflowRequest;
use App\Models\Coin\Workflow;
use App\Models\Coin\WorkflowAdmin;
use App\Models\Coin\WorkflowLog;
use App\Models\Common\Article;
use App\Models\Common\Cate;
use App\Models\Console\Admin;
use DB;
use Illuminate\Http\Request;

class WorkflowController extends Controller
{
    public function getIndex(Request $res)
    {
        try {
            $title = '工作流列表';
            $list = Workflow::with(['workflow_admin'=>function($q){
                        $q->with('admin');
                    }])->orderBy('id','desc')->paginate(10);
            return view('admin.console.workflow.index',compact('list','title'));
        } catch (\Throwable $e) {
            return view('errors.500');
        }
    }

    // 添加工作流
    public function getAdd()
    {
        try {
            $title = '添加工作流';
            $admins = Admin::where('status',1)->get();
            return view('admin.console.workflow.add',compact('title','admins'));
        } catch (\Throwable $e) {
            return view('errors.500');
        }
    }

    public function postAdd(WorkflowRequest $req)
    {
        DB::beginTransaction();
        try {
            $data = $req->input('data');
            $workflow = Workflow::create($data);
            // 审核人
            $workflow_admin = $req->input('admin_id');
            $insert = [];
            foreach ($workflow_admin as $k => $v) {
                if ($k <= $req->input('data.steps')) {
                    foreach ($v as $a) {
                        $insert[] = ['workflow_id'=>$workflow->id,'steps'=>$k,'admin_id'=>$a];
                    }
                }
            }
            WorkflowAdmin::insert($insert);
            DB::commit();
            return $this->adminJson(1,'添加工作流成功！');
        } catch (\Throwable $e) {
            DB::rollback();
            return $this->adminJson(0,'添加工作流失败！');
        }
    }
    // 修改工作流
    public function getEdit($id)
    {
        try {
            $title = '修改工作流';
            // 拼接返回用的url参数
            $info = Workflow::findOrFail($id);
            $admins = Admin::where('status',1)->get();
            $workflow_admin = WorkflowAdmin::where('workflow_id',$id)->get();
            return view('admin.console.workflow.edit',compact('title','info','admins','workflow_admin'));
        } catch (\Throwable $e) {
            return view('errors.500');
        }
    }
    public function postEdit(WorkflowRequest $req,$id)
    {
        DB::beginTransaction();
        try {
            Workflow::where('id',$id)->update($req->input('data'));
            // 审核人
            $workflow_admin = $req->input('admin_id');
            $insert = [];
            foreach ($workflow_admin as $k => $v) {
                if ($k <= $req->input('data.steps')) {
                    foreach ($v as $a) {
                        $insert[] = ['workflow_id'=>$id,'steps'=>$k,'admin_id'=>$a];
                    }
                }
            }
            WorkflowAdmin::where('workflow_id',$id)->delete();
            WorkflowAdmin::insert($insert);
            DB::commit();
            return $this->adminJson(1,'修改工作流成功！');
        } catch (\Throwable $e) {
            DB::rollback();
            return $this->adminJson(0,'修改工作流失败！');
        }
    }
    // 删除工作流
    public function getDel($id)
    {
        // 开启事务
        DB::beginTransaction();
        try {
            // 查询有没有在用的栏目及文章，有重置为不需要审核
            $cate_id = Cate::where('workflow_id',$id)->pluck('id');
            Cate::whereIn('id',$cate_id)->update(['workflow_id'=>0]);
            $art_id = Article::whereIn('cate_id',$cate_id)->pluck('id');
            Article::whereIn('id',$art_id)->update(['status'=>99]);
            // 记录日志
            $insert = [];
            foreach ($art_id as $v) {
                $insert[] = ['art_id'=>$v,'admin_id'=>session('console')->id,'result'=>1,'created_at'=>date('Y-m-d H:i:s'),'updated_at'=>date('Y-m-d H:i:s')];
            }
            WorkflowLog::insert($insert);
            // 同时删除关联的用户关系
            Workflow::destroy($id);
            WorkflowAdmin::where('workflow_id',$id)->delete();
            // 没出错，提交事务
            DB::commit();
            return back()->with('message', '删除工作流成功！');
        } catch (\Throwable $e) {
            // 出错回滚
            DB::rollBack();
            return back()->with('message','删除失败，请稍后再试！');
        }
    }
}
