<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Models\Post;
use Exception;
use Validator;
use DB;

class UserController extends Controller
{
	public function showNewsfeed(Request $request) {
    	try {

            $validator = Validator::make($request->all(), [
                'page' => 'required|integer|gt:0',
                'page_size' => 'required|integer|gt:0',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

    		$pageIndex = $request->page;
    		$pageSize = $request->page_size;
    		$offset = 0;
    		if($pageIndex > 1) {
    			$pageIndex = $pageIndex - 1;
    			$offset = $pageIndex * $pageSize;
    		}

    		$userId = auth()->user()->id;
    		$followingPeople = DB::table('person_follow')
    			->where('follower_id', $userId)
    			->pluck('id');
    		$followingPages = DB::table('page_follow')
    			->where('follower_id', $userId)
    			->pluck('id');

    		//retrieve own posts + following people posts + subscribed pages posts
    		$feed = Post::where('owner_id', $userId)
    			->orWhere(function($queryPeople) use ($followingPeople) {
                    $queryPeople->whereIn('owner_id', $followingPeople);
                })
                ->orWhere(function($queryPage) use ($followingPages) {
                    $queryPage->whereIn('page_id', $followingPages);
                })
                ->orderBy('updated_at', 'DESC')
                ->skip($offset)
                ->take($pageSize)
    			->get();

    		return response()->json(['data' => $feed], 200);

    	} catch(Exception $e) {
    		return response()->json(['error' => $e->getMessage()], 500);
        } 
    }

	public function addPost(Request $request) {
    	try {

            $validator = Validator::make($request->all(), [
                'post_content' => 'required|string|min:10|max:1000',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

    		$postInfo['owner_id'] = auth()->user()->id;
    		$postInfo['post_content'] = $request->post_content;
    		
            $addPost = Post::create($postInfo);
    		if(!$addPost) {
    			throw new Exception("Failed to add post! Please try again.");    			
    		}

    		return response()->json(['message' => "Posted successfully!"], 201);
    	
        } catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        } 
    }

    public function followUser(Request $request) {
    	try {

            $validator = Validator::make($request->all(), [
                'id' => 'required|integer|gt:0',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

            if($request->id == auth()->user()->id) {
                return response()->json(['error' => "Bad request! Cannot follow own."], 400);
            }

            $existUser = User::where('id', $request->id)->first();
            if(!$existUser) {
                return response()->json(['error' => "User not found!"], 400);
            }

    		$followPersonInfo['id'] = $request->id;
    		$followPersonInfo['follower_id'] = auth()->user()->id;            
            $followPersonInfo['created_at'] = date('Y-m-d H:i:s');
            $followPersonInfo['updated_at'] = date('Y-m-d H:i:s');
    		
            $followPerson = DB::table('person_follow')->insert($followPersonInfo);
    		if(!$followPerson) {
    			throw new Exception("Internal server error! Please try again.");    			
    		}

    		return response()->json(['message' => "Following successful!"], 200);
    	
        } catch(Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        } 
    }
}
