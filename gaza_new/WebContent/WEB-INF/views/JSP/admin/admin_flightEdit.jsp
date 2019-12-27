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
									<form method="post" action="flightEditOk">
										<input type="hidden" name="flightNum" value="${vo.flightNum }"/>
											<div class="row2 clearfix">
                                            <div class="col-tenth">기종:</div>
                                            <div class="col-nine-tenth"><input type="text" name="airplaneName" value="${vo.airplaneName }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">상품번호:</div>
                                            <div class="col-nine-tenth"><input type="text" name="productNum" value="${vo.productNum }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">출발시간:</div>
                                            <div class="col-nine-tenth"><input type="text" name="departTime" value="${vo.departTime }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">도착시간:</div>
                                            <div class="col-nine-tenth"><input type="text" name="arriveTime" value="${vo.arriveTime }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">할인율:</div>
                                            <div class="col-nine-tenth"><input type="text" name="flightSale" value="${vo.flightSale }"></div>
                                        </div>
                                        <div class="submit-wrapper"><input type="submit" value="상품수정"/></div>
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
