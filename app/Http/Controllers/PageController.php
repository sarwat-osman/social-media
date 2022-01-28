<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Models\Page;
use App\Models\Post;
use Exception;
use DB;

class PageController extends Controller
{
    public function createPage(Request $request) {
    	try {
    		$validator = Validator::make($request->all(), [
                'page_name' => 'required|string|min:5|max:40',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

    		$pageProperties['page_name'] = $request->page_name;
    		$pageProperties['owner_id'] = auth()->user()->id;
    		
    		$createPage = Page::create($pageProperties);
    		if(!$createPage) {
    			throw new Exception("Error creating Page! Please try again.");    			
    		}

    		return response()->json(['message' => "Page created successfully!"], 201);
    	
    	} catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        } 
    }

    public function followPage(Request $request) {
    	try {

    		$validator = Validator::make($request->all(), [
                'id' => 'required|integer|gt:0',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

            $existPage = Page::where('id', $request->id)->first();
            if(!$existPage) {
                return response()->json(['error' => "Page not found!"], 400);
            }

            if($existPage->owner_id == auth()->user()->id) {
                return response()->json(['error' => "Bad request! Cannot follow own page."], 400);
            }            

    		$followPageInfo['id'] = $request->id;
    		$followPageInfo['follower_id'] = auth()->user()->id;    		           
            $followPageInfo['created_at'] = date('Y-m-d H:i:s');
            $followPageInfo['updated_at'] = date('Y-m-d H:i:s');
    		
    		$followPage = DB::table('page_follow')->insert($followPageInfo);
    		if(!$followPage) {
    			throw new Exception("Internal server error! Please try again.");    			
    		}
    		
    		return response()->json(['message' => "Page followed successfully!"], 200);
    	
    	} catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        } 
    }

    public function publishPost(Request $request) {
    	try {

    		$validator = Validator::make($request->all(), [
                'page_id' => 'required|integer|gt:0',
                'post_content' => 'required|string|min:10|max:1000',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

            $existPage = Page::where('id', $request->page_id)->first();
            if(!$existPage) {
                return response()->json(['error' => "Page not found!"], 400);
            }

    		$postInfo['page_id'] = $request->page_id;
    		$postInfo['post_content'] = $request->post_content;
    		
    		$publishPost = Post::create($postInfo);
    		if(!$publishPost) {
    			throw new Exception("Failed to publish post! Please try again.");  			
    		}
    		
    		return response()->json(['message' => "Posted successfully!"], 201);
    	
    	} catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        } 
    }
}
