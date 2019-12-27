<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">상품 수정</h1>
                        </div>
                    </div>
                    
                    <div class="row2 row">
                        <div class="col-lg-12">	
                            <div class="panel panel-default">
                                <div class="panel-body">
									<form method="post" action="foodEditOk">
										<input type="hidden" name="foodNum" value="${vo.foodNum }"/>
										<div class="row2 clearfix">
                                            <div class="col-tenth">종류:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodType" value="${vo.foodType }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">이름:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodName" value="${vo.foodName}"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">이미지:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodImg" value="${vo.foodImg}"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">설명:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodContent" value="${vo.foodContent}"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">재료:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodIngredient" value="${vo.foodIngredient}"></div>
                                        </div>
										<div class="row2 clearfix">가격: <input type="text" name="foodPrice" value="${vo.foodPrice}"></div>
										<input type="submit" value="상품수정"/>
									</form>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="<%=resources %>/Admin/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=resources %>/Admin/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="<%=resources %>/Admin/js/metisMenu.min.js"></script>

       
        <!-- Custom Theme JavaScript -->
        <script src="<%=resources %>/Admin/js/startmin.js"></script>

    </body>
</html>
