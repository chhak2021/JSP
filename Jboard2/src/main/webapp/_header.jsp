<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v2.0</h3>
            <p>
                <span>${sessUser.nick}</span>님 반갑습니다.
                <a href="/Jboard2/user/logout.do">[로그아웃]</a>
            </p>
        </header>
