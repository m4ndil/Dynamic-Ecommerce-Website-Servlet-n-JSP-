<%@page import="com.entity.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EditProduct</title>
<style>
      /* foot */
      .foot {
        background-color: #333;
        color: #fff;
        font-size: 14px;
        padding: 10px;
        border-top: 2px solid #fff;
      }

      /* lowbar */
      .lowbar {
        background-color: #eee;
        color: #333;
        font-size: 16px;
        padding: 8px;
        border-top: 2px solid #ddd;
      }

      /* navhigh */
      .navhigh {
        background-color: #6699cc;
        color: #fff;
        font-size: 18px;
        padding: 12px;
        border-bottom: 2px solid #fff;
      }

      /* high */
      .high {
        background-color: #ff6666;
        color: #fff;
        font-size: 22px;
        padding: 14px;
        border: 2px solid #fff;
      }

      /* low */
      .low {
        background-color: #f5f5f5;
        color: #333;
        font-size: 16px;
        padding: 10px;
        border: 1px solid #ddd;
      }

      /* blank */
      .blank {
        background-color: transparent;
        color: #333;
        font-size: 16px;
        padding: 10px;
        border: none;
      }

      /* mid */
      .mid {
        background-color: #ddd;
        color: #333;
        font-size: 18px;
        padding: 12px;
        border: 1px solid #bbb;
        margin-top: 20px;
        margin-bottom: 20px;
      }
    </style>
<%@include file="../component/css.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ProductDao dao2 = new ProductDao();
	Product p = dao2.getProductByid(id);
	%>

	<div class="container">
		<div class="row p-5 mt-3">
			<div class="col-md-6 offset-md-3">
				<div class="card card-sh">
					<div class="card-header text-center">
						<h3 class="text-center">Edit Product</h3>

					</div>
					<div class="card-body">

						<form action="updateProduct" method="post"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label>Enter Title</label> <input type="text"
									class="form-control" name="title" value="<%=p.getTitle()%>">
							</div>
							<div class="mb-3">
								<label>Enter Description</label>
								<textarea rows="3" cols="" name="description"
									class="form-control"><%=p.getDescription()%></textarea>
							</div>

							<div class="mb-3">
								<label>Enter Category</label> <select class="form-control"
									name="category">
									<option><%=p.getCategory()%>

										<%
										CategoryDao dao = new CategoryDao();
										List<Category> list = dao.getCategory();
										for (Category c : list) {
										%>
									
									<option><%=c.getCategoryName()%></option>

									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label>Enter Price</label> <input type="number"
									class="form-control" name="price" value="<%=p.getPrice()%>">
							</div>
							<div class="row">
								<div class="col mb-3">
									<label>Stock</label> <input type="number" class="form-control"
										name="stock" value="<%=p.getStock()%>">
								</div>

								<div class="col mb-3">
									<label>Image</label> <input type="file" class="form-control"
										name="img">
								</div>
								<div>
									<small>uploaded img:</small> <img alt="img"
										src="../data/img/product_img/<%=p.getImage()%>" width="50px"
										height="50px">
								</div>

							</div>
							<input type="hidden" name="id" value="<%=p.getId()%>">
							<button class="btn btn-primary col-md-12 mt-2">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>