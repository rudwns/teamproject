<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@page import="com.model.RestoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.RestoDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <title>�ݱⰡ ������ Ŀ���� ��������</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>

<%

				RestoDAO dao = new RestoDAO();
				ArrayList<RestoDTO> list = dao.selectAll();
				request.setAttribute("list", list);

%> 

<div id="map" style="width:100%;height:1000px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=332dd08ad35ac45d739cd2857682cd7e
"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ �߽���ǥ
    mapOption = { 
        center: new daum.maps.LatLng(35.1598439, 126.8496344), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�


//��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 


//��Ŀ �̹����� �̹��� �ּ��Դϴ�
 
 
var positions = []



 //������ ��ġ �迭
/* positions[i] = [{title : "${list[i].title}", we : ${list[i].we}}]; */
	


<c:forEach begin ="0" end="90" var="i">

 // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
 
 
 // ��Ŀ �̹����� �����մϴ�    
  
 
 // ��Ŀ�� �����մϴ�
 var marker = new daum.maps.Marker({
     position: new daum.maps.LatLng(${list[i].we}), // ��Ŀ�� ǥ���� ��ġ
     clickable: true  // ����
 });
 
 marker.setMap(map);


//���������츦 �����մϴ�
var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:330px; background-color:#E6B8B8; text-align:center;">${list[i].title}</div><div style="width:330px;">${list[i].address}</div><div style="width:330px;">${list[i].phone}</div>' // ���������쿡 ǥ���� ����
    });
daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
</c:forEach>
  
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
 
 
 
 

 
 







// Ŀ���� �������̿� ǥ���� ������ �Դϴ�
// Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
// ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ� 


// ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
// ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�



</script>
</body>
</html>