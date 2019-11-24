@extends('layout.master')
@section('content')

<div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Shop</span></p>
                <h1 class="mb-0 bread">Keyword: {{$_GET['key']}}</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-10 order-md-last">
                <div class="row">
                    @foreach ($Top9 as $item)
                    <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                        <div class="product d-flex flex-column">
                            <a href="detail/{{$item->ID_product}}" class="img-prod"><img class="img-fluid"
                                    src="images/product/{{$item->img}}" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3">
                                <div class="d-flex">
                                    <div class="cat">
                                        <span>Type: {{$item->name_type}}</span>
                                    </div>
                                    <div class="rating">
                                        <p class="text-right mb-0">
                                            <a href="#"><span class="ion-ios-star-outline"></span></a>
                                            <a href="#"><span class="ion-ios-star-outline"></span></a>
                                            <a href="#"><span class="ion-ios-star-outline"></span></a>
                                            <a href="#"><span class="ion-ios-star-outline"></span></a>
                                            <a href="#"><span class="ion-ios-star-outline"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <h3><a href="detail/{{$item->ID_product}}">{{$item->name}}</a></h3>
                                <div class="pricing">
                                    <p class="price"><span>${{number_format($item->unit_price,0,'.',',')}}</span></p>
                                </div>
                                <p class="bottom-area d-flex px-3">
                                    <a href="addToCart/{{$item->ID_product}}"
                                        class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i
                                                class="ion-ios-add ml-1"></i></span></a>
                                    <a href="buyNow/{{$item->ID_product}}" class="buy-now text-center py-2">Buy
                                        now<span><i class="ion-ios-cart ml-1"></i></span></a>
                                </p>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
                <!--phân trang-->
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                {{-- start:: Phân Trang (Search) --}}
                                @if(@isset($_GET['key']))
                                <?php 
                                    if(isset($_GET['page'])) // Bắt Sự Kiện Trang
                                        $page_now = $_GET['page'];
                                    else
                                        $page_now = 1;
                                        
                                    $previous_page = $page_now - 1; // Sử lý nút previous_page lùi về
                                    if($previous_page < 1)
                                        $previous_page = 1;

                                    $next_page = $page_now + 1;  // Sử lý nút next_page Tiến Lên
                                    if($next_page > $total_page)
                                        $next_page = $total_page;
                                ?>

                                <li><a href="search?key={{$_GET['key']}}&page={{$previous_page}}">&lt;</a></li>
                                {{-- Vòng Lặp Nút Trang --}}
                                @for($i = 1; $i <= $total_page; $i++) <!--nếu là trang hiện tại-->
                                    @if ($i == $page_now)
                                    <li class="active"><a href="search?key={{$_GET['key']}}&page={{$i}}">{{$i}}</a>
                                    </li>
                                    @else
                                    <li><a href="search?key={{$_GET['key']}}&page={{$i}}">{{$i}}</a></li>
                                    @endif
                                    @endfor

                                    <li><a href="search?key={{$_GET['key']}}&page={{$next_page}}">&gt;</a></li>
                                    {{-- End:: Phân Trang (Search) --}}
                                    @endif
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-2">
                <div class="sidebar">
                    <div class="sidebar-box-2">
                        <h2 class="heading">Categories</h2>
                        <div class="fancy-collapse-panel">
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                                aria-expanded="true" aria-controls="collapseOne">Men's Shoes
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                                        aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Sport</a></li>
                                                <li><a href="#">Casual</a></li>
                                                <li><a href="#">Running</a></li>
                                                <li><a href="#">Jordan</a></li>
                                                <li><a href="#">Soccer</a></li>
                                                <li><a href="#">Football</a></li>
                                                <li><a href="#">Lifestyle</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingTwo">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseTwo" aria-expanded="false"
                                                aria-controls="collapseTwo">Women's Shoes
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                        aria-labelledby="headingTwo">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Sport</a></li>
                                                <li><a href="#">Casual</a></li>
                                                <li><a href="#">Running</a></li>
                                                <li><a href="#">Jordan</a></li>
                                                <li><a href="#">Soccer</a></li>
                                                <li><a href="#">Football</a></li>
                                                <li><a href="#">Lifestyle</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingThree">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseThree" aria-expanded="false"
                                                aria-controls="collapseThree">Accessories
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                        aria-labelledby="headingThree">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Jeans</a></li>
                                                <li><a href="#">T-Shirt</a></li>
                                                <li><a href="#">Jacket</a></li>
                                                <li><a href="#">Shoes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingFour">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseFour" aria-expanded="false"
                                                aria-controls="collapseThree">Clothing
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel"
                                        aria-labelledby="headingFour">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Jeans</a></li>
                                                <li><a href="#">T-Shirt</a></li>
                                                <li><a href="#">Jacket</a></li>
                                                <li><a href="#">Shoes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-box-2">
                        <h2 class="heading">Price Range</h2>
                        <form method="post" class="colorlib-form-2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="guests">Price from:</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="people" id="people" class="form-control">
                                                <option value="#">1</option>
                                                <option value="#">200</option>
                                                <option value="#">300</option>
                                                <option value="#">400</option>
                                                <option value="#">1000</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="guests">Price to:</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="people" id="people" class="form-control">
                                                <option value="#">2000</option>
                                                <option value="#">4000</option>
                                                <option value="#">6000</option>
                                                <option value="#">8000</option>
                                                <option value="#">10000</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection