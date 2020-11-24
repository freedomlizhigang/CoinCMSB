<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Common\Article;
use App\Models\Common\Cate;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function getIndex()
    {
        try {
            $seo = ['title'=>cache('config')['title'],'keyword'=>cache('config')['keyword'],'describe'=>cache('config')['describe']];
            // 点击量增加
            app('com')->addHit(0,0,request()->ip());
            return view('home.index',compact('seo'));
        } catch (\Throwable $e) {
            return view('errors.404');
        }
    }
    // 栏目
    public function getCate($url = '')
    {
        try {
            // 找栏目
            $info = Cate::where('url',$url)->first();
            // 如果存在栏目，接着找
            if (is_null($info)) {
                return back()->with('message','没有找到对应栏目！');
            }
            $seo = ['title'=>$info->title,'keyword'=>$info->keyword,'describe'=>$info->describe];
            $theme = $info->cate_tpl;
            $info->pid = $info->parentid == 0 ? $info->id : $info->parentid;
            // 点击量增加
            app('com')->addHit($info->id,0,request()->ip());
            // 1 是列表
            if ($info->type == 1) {
                $list = Article::whereIn('cate_id',explode(',', $info->arrchildid))->where('status',99)->orderBy('sort','desc')->orderBy('id','desc')->paginate(20);
                return view('home.'.$theme,compact('seo','info','list'));
            }
            else
            {
                return view('home.'.$theme,compact('seo','info'));
            }
        } catch (\Throwable $e) {
            return view('errors.404');
        }
    }
    // 文章
    public function getPost($url = '')
    {
        try {
            // 找栏目
            $info = Article::with(['cate'=>function($q){
                    $q->select('id','parentid','name');
                }])->where('url',$url)->where('del_flag',0)->where('publish_at','<=',date('Y-m-d H:i:s'))->where('status',99)->first();
            if (is_null($info)) {
                return back()->with('message','没有找到对应内容！');
            }
            $info->pid = $info->cate->parentid == 0 ? $info->cate_id : $info->cate->parentid;
            $theme = $info->tpl;
            // 点击量增加
            app('com')->addHit($info->cate_id,$info->id,request()->ip());
            $seo = ['title'=>$info->title,'keyword'=>$info->keywords,'describe'=>$info->describe];
            return view('home.'.$theme,compact('seo','info'));
        } catch (\Throwable $e) {
            return view('errors.404');
        }
    }
}
