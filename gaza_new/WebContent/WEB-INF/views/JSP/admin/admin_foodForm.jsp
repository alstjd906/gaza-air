<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">제목</h1>
                        </div>
                    </div>
                    
                    <div class="row2 row">
                        <div class="col-lg-12">	
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form method="post" action="foodAddOk">
										<div class="row2 clearfix">
                                            <div class="col-tenth">종류:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodType"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">이름:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodName"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">이미지:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodImg"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">설명:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodContent"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">재료:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodIngredient"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">가격:</div>
                                            <div class="col-nine-tenth"><input type="text" name="foodPrice"></div>
                                        </div>
                                        <div class="submit-wrapper"><input type="submit" name="adminAdd" value="추가"></div>
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
