<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css" />
   	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
    <title>ERP LAB</title>
</head>
<body>

<div class="section">
	<div class="container">
		
      <div class="row full-height justify-content-center">
        <div class="col-12 text-center align-self-center py-5">
          <div class="section pb-5 pt-5 pt-sm-2 text-center">
            <h6 class="mb-0 pb-3"><span>ERP</span><span>INTRANET</span></h6>
                  <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                  <label for="reg-log"></label>
            <div class="card-3d-wrap mx-auto">
              <div class="card-3d-wrapper">
				  
				  
                <div class="card-front">
					
                  <div class="center-wrap">
                    <div class="section text-center">
                      <h4 class="mb-4 pb-3">ERP 로그인</h4>
                      
                      <form>
                      
                      <div class="form-group">
                        <input type="text" name="comcode" class="form-style" placeholder="회사코드" id="comcode" autocomplete="off">
                        <i class="input-icon uil uil-user"></i>
                      </div>

                      <div class="form-group">
                        <input type="text" name="logid" class="form-style" placeholder="아이디" id="logid" autocomplete="off">
                        <i class="input-icon uil uil-user"></i>
                      </div>
                      
                      <div class="form-group mt-2">
                        <input type="password" name="logpw" class="form-style" placeholder="비밀번호" id="logpw" autocomplete="off">
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
              			
              			<div class="erplog">
              			<a href="#">LOGIN</a>
						</div>

					  </form>
					
                      </div>
                </div>

                <div class="card-back">
					
                  <div class="center-wrap">
					  
                    <div class="section text-center">
						
                      <h4 class="mb-4 pb-3">인트라넷 로그인</h4>
                      
                     <form>
                      
                      <div class="form-group">
                        <input type="text" name="comcode" class="form-style" placeholder="회사코드" id="comcode" autocomplete="off">
                        <i class="input-icon uil uil-user"></i>
                      </div>
                      
                      <div class="form-group">
                        <input type="text" name="logname" class="form-style" placeholder="아이디" id="logname" autocomplete="off">
                        <i class="input-icon uil uil-user"></i>
                      </div> 
                        
                      <div class="form-group">
                        <input type="password" name="logpass" class="form-style" placeholder="비밀번호" id="logpass" autocomplete="off">
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                      	
              			<div class="erplog">
              			<a href="#">LOGIN</a>
						</div>                
						 
				      </form>
					 	    
                      </div>
                        
                    </div>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
  
</body>
</html>