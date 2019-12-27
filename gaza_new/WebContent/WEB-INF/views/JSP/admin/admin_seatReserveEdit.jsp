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
									<form method="post" action="seatReserveEditOk">
										<input type="hidden" name="seatReserveNum" value="${vo.seatReserveNum }"/>
										<div class="row2 clearfix">
                                            <div class="col-tenth">운행번호:</div>
                                            <div class="col-nine-tenth"><input type="text" name="flightNum" value="${vo.flightNum }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">좌석타입:</div>
                                            <div class="col-nine-tenth"><input type="text" name="seatType" value="${vo.seatType }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">좌석번호:</div> 
                                            <div class="col-nine-tenth"><input type="text" name="seatNo" value="${vo.seatNo }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">예약여부:</div>
                                            <div class="col-nine-tenth"><input type="text" name="reserved" value="${vo.reserved }"></div>
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