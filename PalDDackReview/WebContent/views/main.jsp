<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <jsp:include page="/include/top.jsp"/> 
    <div id="main_container">
        <div id="img_wrap">
            <img src="#" alt="">
        </div>
        <div id="best_push">
            <h2>베스트 추천 상품</h2>
            <ul>
                <li onclick="#">
                    <form action="#" method="post" name="#">
                        <input type="hidden" name="" value="">
                        <a href="#">
                            <img src="#" alt="">
                            <div class="bst_info">
                                <p class="bst_name">#</p>
                                <p class="bst_sp">#</p>
                                <p class="bst_price">#</p>
                            </div>
                        </a>
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <jsp:include page="/include/footer.jsp"/>