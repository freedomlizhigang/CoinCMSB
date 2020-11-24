<?php
/*
 * @package [App\Http\Controllers\Admin\Common]
 * @author [李志刚]
 * @createdate  [2018-06-26]
 * @copyright [2018-2020 衡水希夷信息技术工作室]
 * @version [1.0.0]
 * @directions 文章管理
 *
 */
namespace App\Http\Controllers\Admin\Common;

use App\Customize\Func;
use App\Http\Controllers\Controller;
use App\Http\Requests\Common\ArtRequest;
use App\Models\Coin\WorkflowAdmin;
use App\Models\Coin\WorkflowLog;
use App\Models\Common\Article;
use App\Models\Common\Cate;
use Illuminate\Http\Request;

class ArtController extends Controller
{
    /**
     * 文章列表
     * 1. 默认出所有审核通过了的
     * 2. 查待审时只出需要我审核的
     * 3. 文章的预览，审核日志查看
     * @return [type] [description]
     */
    public function getIndex(Request $req)
    {
    	try {
            $title = '文章列表';
            $admin_id = session('console')->id;
            $is_super = in_array(1,session('console')->allRole) ? 1 : 0;
        	$catid = $req->input('catid');
            // 搜索关键字
            $key = $req->input('q','');
            $push_flag = $req->input('push_flag');
            $starttime = $req->input('starttime');
            $endtime = $req->input('endtime');
            $status = $req->input('status',99);
            $cats = Cate::get();
        	$tree = app('com')->toTree($cats,'0');
        	$cate = app('com')->toTreeSelect($tree);
            $list = Article::with(['cate','hit'])->where(function($q) use($catid){
                    if ($catid != '') {
                        $q->where('cate_id',$catid);
                    }
                })->where(function($q) use($key){
                    if ($key != '') {
                        $q->where('title','like','%'.$key.'%');
                    }
                })->where(function($q) use($push_flag){
                    if ($push_flag != '') {
                        $q->where('push_flag',$push_flag);
                    }
                })->where(function($q) use($starttime){
                    if ($starttime != '') {
                        $q->where('created_at','>',$starttime);
                    }
                })->where(function($q) use($endtime){
                    if ($endtime != '') {
                        $q->where('created_at','<',$endtime);
                    }
                })->where(function($q) use($status,$admin_id){
                    // 根据审核级别查，当前用户可以审核的文章
                    if (in_array($status,[1,2,3,4])) {
                        $workflow_id = WorkflowAdmin::where('admin_id',$admin_id)->where('steps',$status)->pluck('workflow_id');
                        $all_cate_id = Cate::whereIn('workflow_id',$workflow_id)->pluck('id');
                        $q->whereIn('cate_id',$all_cate_id);
                    }
                })->where(function($q) use($status,$admin_id){
                    // 审核过的或者我发布的
                    $q->orWhere('status',$status)->orWhere('admin_id',$admin_id);
                })->where('del_flag',0)->orderBy('id','desc')->paginate(10);
            // 记录上次请求的url path，返回时用
            session()->put('backurl',url()->full());
        	return view('admin.console.art.index',compact('title','list','cate','catid','key','starttime','endtime','push_flag','status','admin_id','is_super'));
        } catch (\Throwable $e) {
            // dd($e);
            return view('errors.500');
        }
    }

    /**
     * 添加文章
     * @param  string $catid [栏目ID]
     * @return [type]        [description]
     */
    public function getAdd($catid = '0')
    {
        try {
        	$title = '添加文章';
        	// 如果catid=0，查出所有栏目，并转成select
        	$cate = '';
        	if($catid == '0')
        	{
        		$cats = Cate::get();
    	    	$tree = app('com')->toTree($cats,'0');
    	    	$cate = app('com')->toTreeSelect($tree);
        	}
        	return view('admin.console.art.add',compact('title','catid','cate'));
        } catch (\Throwable $e) {
            return view('errors.500');
        }
    }
    public function postAdd(ArtRequest $req)
    {
        // 开启事务
        try {
            $data = $req->input('data');
            $data['url'] = Func::createUuid();
            $cate = Cate::where('id',$data['cate_id'])->first();
            $data['tpl'] = $cate->art_tpl;
            $data['admin_id'] = session('console')->id;
            // 查审核状态，不用审核的，改为99，其它默认1
            $data['status'] = !$cate->workflow_id ? 99 : 1;
            // 审核日志
            $art = Article::create($data);
            $mark = $this->getmark(99,1);
            WorkflowLog::create(['art_id'=>$art->id,'admin_id'=>session('console')->id,'result'=>1,'steps'=>99,'mark'=>$mark]);
            // 跳转回添加的栏目列表
            return $this->adminJson(1,'添加文章成功！',url('/console/art/index?catid='.$req->input('data.cate_id')));
        } catch (\Throwable $e) {
            return $this->adminJson(0,$e->getLine().': '.$e->getMessage());
            return $this->adminJson(0,'添加失败，请稍后再试！');
        }
    }
    /**
     * 修改文章
     * @param  string $id [文章ID]
     * @return [type]     [description]
     */
    public function getEdit($id = '')
    {
        try {
            $title = '修改文章';
            // 拼接返回用的url参数
            $ref = session('backurl');
            $info = Article::where('del_flag',0)->findOrFail($id);
            $cats = Cate::get();
            $tree = app('com')->toTree($cats,'0');
            $cate = app('com')->toTreeSelect($tree);
            return view('admin.console.art.edit',compact('title','cate','info','ref'));
        } catch (\Throwable $e) {
            return view('errors.500');
        }
    }
    public function postEdit(ArtRequest $req,$id = '')
    {
        try {
            $data = $req->input('data');
            // 查审核状态，不用审核的，改为99，其它默认1
            $info = Article::find($id);
            if(session('console')->id == $info->admin_id || in_array(1,session('console')->allRole))
            {
                $cate = Cate::where('id',$data['cate_id'])->first();
                $data['tpl'] = $cate->art_tpl;
                $data['status'] = !$cate->workflow_id ? 99 : 1;
                // 栏目是需要审核的，重新发起
                $mark = $this->getmark(0,1);
                WorkflowLog::create(['art_id'=>$id,'admin_id'=>session('console')->id,'result'=>1,'steps'=>0,'mark'=>$mark]);
                $art = Article::where('id',$id)->update($data);
                // 全文搜索
                Article::where('id',$id)->searchable();
                // 取得编辑前url参数，并跳转回去
                return $this->adminJson(1,'修改文章成功！',$req->input('ref'));
            }
            return $this->adminJson(0,'文章只能被发布人或者超级管理员修改！',$req->input('ref'));
        } catch (\Throwable $e) {
            return $this->adminJson(0,'修改失败，请稍后再试！');
        }
    }
    /**
     * 删除文章
     * @param  string $id [文章ID]
     * @return [type]     [description]
     */
    public function getDel($id = '')
    {
        try {
            $info = Article::find($id);
            if(session('console')->id == $info->admin_id || in_array(1,session('console')->allRole))
            {
                Article::where('id',$id)->update(['del_flag'=>1]);
                // 全文搜索
                Article::where('id',$id)->unsearchable();
                return back()->with('message', '删除文章成功！');
            }
            return back()->with('message', '文章只能被发布人或者超级管理员删除！');
        } catch (\Throwable $e) {
            return back()->with('message','删除失败，请稍后再试！');
        }
    }
    /**
     * 查看文章
     * @param  string $id [description]
     * @return [type]     [description]
     */
    public function getShow($id = '')
    {
        try {
            $info = Article::where('del_flag',0)->findOrFail($id);
            // 审核记录
            $workflowlog = WorkflowLog::with('admin')->where('art_id',$id)->orderBy('id','asc')->get();
            return view('admin.console.art.show',compact('info','workflowlog'));
        } catch (\Throwable $e) {
            return view('errors.500');
        }
    }
    // 审核文章
    public function postStatus($id = '',$result = 1)
    {
        try {
            $info = Article::where('del_flag',0)->findOrFail($id);
            // 看当前的级别，栏目的级别
            $cate = Cate::with('workflow')->findOrFail($info->cate_id);
            $status = $info->status < $cate->workflow->steps ? $info->status + 1 : 99;
            // 判断这个用户有没有审核权限
            $workflow = WorkflowAdmin::where('admin_id',session('console')->id)->where('workflow_id',$cate->workflow_id)->where('steps',$info->status)->first();
            if (is_null($workflow)) {
                return $this->adminJson(0,'没有这篇文章的当前审核权限！');
            }
            if ($result) {
                Article::where('id',$id)->update(['status'=>$status]);
            }
            else
            {
                Article::where('id',$id)->update(['status'=>0]);
            }
            $mark = $this->getmark($info->status,$result);
            WorkflowLog::create(['art_id'=>$id,'admin_id'=>session('console')->id,'result'=>$result,'steps'=>$info->status,'mark'=>$mark]);
            return $this->adminJson(1,'审核成功！');
        } catch (\Throwable $e) {
            return $this->adminJson(0,'审核失败，请稍后再试！');
        }
    }
    // 批量审核
    public function postAllStatus(Request $req)
    {
        $ids = $req->input('sids');
        // 是数组更新数据，不是返回
        if(is_array($ids))
        {
            try {
                $result = $req->input('result');
                $all = Article::whereIn('id',$ids)->get();
                $cates = Cate::with('workflow')->select('id','workflow_id','name')->whereIn('id',$all->pluck('cate_id'))->get();
                $workflows = WorkflowAdmin::where('admin_id',session('console')->id)->get();
                foreach ($all as $v) {
                    // 看当前的级别，栏目的级别
                    $cate = $cates->where('id',$v->cate_id)->first();
                    // 通过、退稿、栏目不需要审批 不处理，
                    if ($v->status != 99 && $v->status != 0 && $cate->workflow_id != 0) {
                        $status = $v->status < $cate->workflow->steps ? $v->status + 1 : 99;
                        // 判断这个用户有没有审核权限
                        $workflow = $workflows->where('workflow_id',$cate->workflow_id)->where('steps',$v->status)->first();
                        if (is_null($workflow)) {
                            return back()->with('message','没有" '.$v->title.' "的当前审核权限！');
                        }
                        if ($result) {
                            Article::where('id',$v->id)->update(['status'=>$status]);
                        }
                        else
                        {
                            Article::where('id',$v->id)->update(['status'=>0]);
                        }
                        $mark = $this->getmark($v->status,$result);
                        WorkflowLog::create(['art_id'=>$v->id,'admin_id'=>session('console')->id,'result'=>$result,'steps'=>$v->status,'mark'=>$mark]);
                    }
                }
                return back()->with('message', '批量审核成功！');
            } catch (\Throwable $e) {
                // dd($e);
                return back()->with('message','审核失败，请稍后再试！');
            }
        }
        else
        {
            return back()->with('message','请选择文章！');
        }
    }
    // 批量删除
    public function postAlldel(Request $req)
    {
        $ids = $req->input('sids');
        // 是数组更新数据，不是返回
        if(is_array($ids))
        {
            try {
                $all = Article::whereIn('id',$ids)->get();
                foreach ($all as $a) {
                    if(!session('console')->id == $a->admin_id && !in_array(1,session('console')->allRole))
                    {
                        return back()->with('message', '文章只能被发布人或者超级管理员删除！');
                    }
                    Article::where('id',$a->id)->update(['del_flag'=>1]);
                    // 全文搜索
                    Article::where('id',$a->id)->unsearchable();
                }
                return back()->with('message', '批量删除完成！');
            } catch (\Throwable $e) {
                return back()->with('message','删除失败，请稍后再试！');
            }
        }
        else
        {
            return back()->with('message','请选择文章！');
        }
    }
    // 批量排序
    public function postsort(Request $req)
    {
        try {
            $ids = $req->input('sids');
            $sort = $req->input('sort');
            if (is_array($ids))
            {
                foreach ($ids as $v) {
                    Article::where('id',$v)->update(['sort'=>(int) $sort[$v]]);
                }
                return back()->with('message', '排序成功！');
            }
            else
            {
                return back()->with('message', '请先选择文章！');
            }
        } catch (\Throwable $e) {
            return back()->with('message', '排序失败！');
        }
    }

    // 返回备注内容
    private function getmark($status,$result)
    {
        $result_mark = $result ? '通过' : '退稿';
        $mark = '';
        switch ($status) {
            case '4':
                $mark = '第四级审核结果：'.$result_mark.'！';
                break;

            case '3':
                $mark = '第三级审核结果：'.$result_mark.'！';
                break;

            case '2':
                $mark = '第二级审核结果：'.$result_mark.'！';
                break;

            case '1':
                $mark = '第一级审核结果：'.$result_mark.'！';
                break;

            case '0':
                $mark = '修改后重新发布文章成功！';
                break;

            default:
                $mark = '发布新文章成功！';
                break;
        }
        return $mark;
    }
}
