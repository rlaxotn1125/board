<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        /*ul{*/
        /*    list-style:none; // 이거임*/
        /*}*/
        .container {
            width : 50%;
            margin : auto;
            padding-top: 20px;
        }

        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }

        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }

        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }

        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }

        .btn:hover {
            text-decoration: underline;
        }
    </style>
    <style>
        /* 댓글 CSS */

        #comment-li {
            background-color: #f9f9fa;
            list-style-type: none;
            border-bottom : 1px solid rgb(235,236,239);
            padding : 18px 18px 0 18px;
        }

        #commentList {
            width : 100%;
            margin-top: 10px;
        }

        .comment-content {
            overflow-wrap: break-word;
        }

        .comment-bottom {
            font-size:9pt;
            color : rgb(97,97,97);
            padding: 8px 0 8px 0;
        }

        .comment-bottom > a {
            color : rgb(97,97,97);
            text-decoration: none;
            margin : 0 6px 0 0;
        }

        .comment-area {
            padding : 0 0 0 46px;
        }

        .commenter {
            font-size:12pt;
            font-weight:bold;
        }

        .commenter-writebox {
            padding : 15px 20px 20px 20px;
        }

        .comment-img {
            font-size:36px;
            position: absolute;
        }

        .comment-item {
            position: relative;
        }

        .up_date {
            margin : 0 8px 0 0;
        }

        #comment-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
        }

        #comment-modify-box {
            display: block;
            width: 100%;
            min-height: 17px;
            padding: 0 20px;
            border: 0;
            outline: 0;
            font-size: 13px;
            resize: none;
            box-sizing: border-box;
            background: transparent;
            overflow-wrap: break-word;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #comment-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        .btn {
            font-size:10pt;
            color : black;
            background-color: #eff0f2;
            text-decoration: none;
            padding : 9px 10px 9px 10px;
            border-radius: 5px;
            float : right;
        }
        #btn-write-comment, #btn-write-reply {
            color : #009f47;
            background-color: #e0f8eb;
        }

        #btn-cancel-reply {
            background-color: #eff0f2;
            margin-right : 10px;
        }

        #btn-write-modify {
            color : #009f47;
            background-color: #e0f8eb;
        }

        #btn-cancel-modify {
            margin-right : 10px;
        }

        #reply-writebox {
            display : none;
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #reply-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        #modify-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #modify-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">게시판</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
    <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="bno" value="${boardDto.bno}">
        <input name="title" type="text" value="<c:out value='${boardDto.title}'/>" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
        <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${boardDto.content}"/></textarea><br>
        <c:if test="${mode eq 'new'}">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
        </c:if>
        <c:if test="${mode ne 'new'}">
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
        </c:if>
        <c:if test="${boardDto.writer eq loginId}">
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
            <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
        </c:if>
        <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
    </form>
</div>
<br>
<!-- 댓글 등록 -->
<div class="container">
    <c:if test="${mode ne 'new'}">
        <div id="commentList">
        </div>
        <h4>댓글</h4>
        <input type="text" name="comment" placeholder="댓글을 남겨보세요">
        <button id="sendBtn" type="button">등록</button>
<%--        <button id="modBtn" type="button">수정</button>--%>
        <div id="replyForm" style="display: none">
            <input type="text" name="replyComment"/>
            <button id="wrtRepBtn" type="button">등록</button>
        </div>

        <div id="modalWin" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>
                <h2> | 댓글 수정</h2>
                <div id="modify-writebox">
                    <div class="commenter commenter-writebox"></div>
                    <div class="modify-writebox-content">
                        <input name="comment-text" id="comment-modify-box" cols="30" rows="5"></input>
                    </div>
                    <div id="modify-writebox-bottom">
                        <div class="register-box">
                            <a href="#" class="btn" id="btn-write-modify">등록</a>
                        </div>
                    </div>
                </div>
                </p>
            </div>
        </div>
    </c:if>
</div>
<br>


<script>
    $(document).ready(function(){
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }

            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }

        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });

        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");

            if(formCheck())
                form.submit();
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');

            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;

            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
        });
    });
</script>
<script>
    // 댓글 스크립트
    let bno = $('input[name=bno]').val();

    let showList = function(bno) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/ch4/comments?bno='+bno,  // 요청 URI
            success : function(result){
                $("#commentList").html(toHtml(result));
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    $(document).ready(function(){
        showList(bno);

        // 답글 작성
        $("#wrtRepBtn").click(function(){
            let comment = $("input[name=replyComment]").val();
            let pcno = $("#replyForm").parent().attr("data-pcno");

            if(comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("input[name=replyComment]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/ch4/comments?bno='+bno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            });

            $("#replyForm").css("display", "none")
            $("input[name=replyComment]").val('')
            $("#replyForm").appendTo("body");
        });

        // 댓글 수정
        $("#btn-comment-modify").click(function(){
            let cno = $(this).attr("data-cno");
            let comment = $("input[name=comment-content]").val();

            if(comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment-content]").focus()
                return;
            }

            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/ch4/comments/'+cno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({cno:cno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            });
        });

        // 댓글 작성
        $("#sendBtn").click(function(){
            let comment = $("input[name=comment]").val();

            if(comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/ch4/comments?bno='+bno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            });
        });

        $("#commentList").on("click", ".btn-comment-modify", function () {

            let cno = $(this).attr("data-cno");
            let bno = $(this).attr("data-bno");
            // let comment = $("div.comment-content").text();
            let comment = $("div.btn-comment-modify").parent("cno").text();

            // let comment = $("div.comment-content", $(this).parent()).text();
            // $("input[name=comment-text]").text(comment)
            // let li = $("li[data-cno="+comment.cno+"]");
            // let commenter = $(".commenter", li).first().text();
            // let comment = $(".comment-content", li).first().text();
            // let commenter = $(".commenter", li).first().text();
            // let comment = $(".comment-content").first().text(); // 이거 됨
            // let comment = $(".comment-content").val(cno).text();
            // let comment = $('li[data-cno=cno]');

            // $("#modalWin .commenter").text(commenter);
            // $("#comment-modify-box").text(comment);
            // $("#btn-comment-modify").attr("data-cno", cno);
            // $("#btn-comment-modify").attr("data-pcno", pcno);
            // $("#btn-comment-modify").attr("data-bno", bno);

            // 팝업창을 열고 내용을 보여준다.
            $("#modalWin").css("display","block");

            // 1. comment의 내용을 input에 뿌려주기
            $("input[name=comment-text]").val(comment)


            // 댓글 수정 창닫기
            $(".close").click(function(){
                $("#modalWin").css("display","none");
            });

        });

        $("#commentList").on("click", ".replyBtn", function (){
            // 1. replyForm을 옮겨주기
            $("#replyForm").appendTo($(this).parent());

            // 2. 답글 입력 폼 보여주기
            $("#replyForm").css("display", "block");

        });

        // 댓글 삭제
        $("#commentList").on("click", ".btn-comment-delete", function (){
            let cno = $(this).attr("data-cno");
            let bno = $(this).attr("data-bno");
            $.ajax({
                type:'DELETE',       // 요청 메서드
                url: '/ch4/comments/'+cno+'?bno='+bno,  // 요청 URI
                success : function(result){
                    alert(result)
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            });
        });
    });


    let toHtml = function(comments) {
            // let i = 0;
            // let j = 5;
            let tmp = "<div>";
            comments.forEach(function (comment) {
                // i++;
                // if(i <= j) {
                    tmp += '<li class="comment-item" id="comment-li" data-cno="' + comment.cno + '" data-bno="' + comment.bno + '">'
                    tmp += '<span class="comment-img">'
                    tmp += '<i class="fa fa-user-circle" aria-hidden="true"></i>'
                    tmp += '</span>'
                    tmp += '<div class="comment-area">'
                    tmp += '<div class="commenter">' + comment.commenter + '</div>'
                    tmp += '<div class="comment-content" data-cno="' + comment.cno + '">' + comment.comment + '</div>'
                    tmp += '<div class="comment-bottom">'
                    tmp += '<span class="up_date">' + moment(comment.up_date).format("YYYY-MM-DD HH:mm:ss") + '</span>'
                    // tmp += '<a href="#" class="btn-comment-write"  data-cno="' + comment.cno + '" data-bno="' + comment.bno + '" data-pcno="' + comment.pcno + '">답글쓰기</a>'
                    // tmp += '<a href="#" class="btn-comment-modify" data-cno="' + comment.cno + '" data-bno="' + comment.bno + '" data-pcno="' + comment.pcno + '">수정</a>'
                    tmp += '<a href="#" class="btn-comment-delete" data-cno="' + comment.cno + '" data-bno="' + comment.bno + '" data-pcno="' + comment.pcno + '">삭제</a>'
                    tmp += '</div>'
                    tmp += '</div>'
                    tmp += '</li>'
                // }
            })
            return tmp + "</div>";


    }

</script>
</body>
</html>