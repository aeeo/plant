<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>行星人脸识别考勤系统教师管理</title>
<link rel="stylesheet" href="teach/css/style.css">
</head>

<body>
<main>
  <form class="form" action="teachLoginSubmit">
    <div class="form__cover"></div>
    <div class="form__loader">
      <div class="spinner active">
        <svg class="spinner__circular" viewBox="25 25 50 50">
          <circle class="spinner__path" cx="50" cy="50" r="20" fill="none" stroke-width="4" stroke-miterlimit="10"></circle>
        </svg>
      </div>
    </div>
    <div class="form__content">
      <h1>Plant's Checking</h1>
      <div class="styled-input">
        <input type="text" class="styled-input__input" name="teachId">
        <div class="styled-input__placeholder"> <span class="styled-input__placeholder-text">Username</span> </div>
        <div class="styled-input__circle"></div>
      </div>
      <div class="styled-input">
        <input type="password" class="styled-input__input" name="teachPassword">
        <div class="styled-input__placeholder"> <span class="styled-input__placeholder-text">Password</span> </div>
        <div class="styled-input__circle"></div>
      </div>
      <button type="submit" class="styled-button">
        <span class="styled-button__real-text-holder">
          <span class="styled-button__real-text">登录</span>
          <span class="styled-button__moving-block face">
            <span class="styled-button__text-holder">
              <span class="styled-button__text">登录</span>
            </span> </span>
          <span class="styled-button__moving-block back">
            <span class="styled-button__text-holder">
              <span class="styled-button__text">登录</span>
            </span>
          </span>
        </span>
      </button>
    </div>
  </form>
</main>
<script  src="teach/js/index.js"></script>
</body>
</html>
