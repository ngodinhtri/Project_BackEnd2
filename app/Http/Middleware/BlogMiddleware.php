<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\DB;
use Closure;

class BlogMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if($request->id != null)
        {
            $CheckExistProducts = DB::table("products")->where("products.ID_product",$request->id)->get();
            if(count($CheckExistProducts) == 0)
            {
                return redirect('404');
            }
        }
        
        return $next($request);
    }
}
