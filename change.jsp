<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="semantic/semantic.css">
<link rel="stylesheet" type="text/css" href="css/BBB.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="semantic/semantic.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Best of Best Book</title>
</head>
<body>
	<%
		int cnt = 0;
		String[] category = { "���� �츲", "�ǰ� ���", "���� �濵", "����", "��ȸ ��ġ", "���", "����", "�ι�", "�ڱ� ���", "�ڿ� ����" };
		String[] items = { request.getParameter("item1"), request.getParameter("item2"),
				request.getParameter("item3") };
		System.out.println(Arrays.toString(items));
		//���ڿ��� ���ڰ� 3�� ���
		
		for (int i = 0; i < items.length; i++) {
			cnt++;
			System.out.println(cnt);
			for (int k = 0; k < category.length; k++) {
				if (items[i].equals(("" + (k + 1)))) {
					items[i] = URLEncoder.encode(category[k], "euc-kr");
				}
			}
		}
		//encoding / decoding test(euc-kr)------------------------------------------
		//System.out.println(Arrays.toString(items));
		//for (int i = 0; i < items.length; i++) {
		//		items[i] = URLDecoder.decode(items[i], "euc-kr");
		//}
		//System.out.println(Arrays.toString(items));
		
		//for������ �������¿��� "ī�װ�"�׸� ������ ����(���ڵ�) ��  choiceservlet���� ������.

		response.sendRedirect("Choice?item1=" + items[0] + "&item2=" + items[1] + "&item3=" + items[2]);
	%>
</body>
</html>