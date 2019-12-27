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
									<form method="post" action="productEditOk">
										<input type="hidden" name="productNum" value="${vo.productNum }"/>
										<div class="row2 clearfix ">
                                            <div class="col-tenth">출발지:</div>
                                            <div class="col-nine-tenth"><input type="text" name="depart" value="${vo.depart }"/></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">도착지:</div>
                                            <div class="col-nine-tenth"><input type="text" name="arrive" value="${vo.arrive }"/></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">가격:</div> 
                                            <div class="col-nine-tenth"><input type="text" name="price" value="${vo.price }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">할인:</div> 
                                            <div class="col-nine-tenth"><input type="text" name="productSale" value="${vo.productSale }"></div>
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
