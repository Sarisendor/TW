<%@ page import="MySpringMVC.model.Earthquake" %>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<meta charset="UTF-8">

<html>
<head>
    <title>INepal</title>
    <link rel="stylesheet" type="text/css" href="../../resources/crud.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="../../resources/js/sidebar.js"></script>
    <script src="../../resources/js/charts.js"></script>
</head>
<body>

<div id="header">
    <div class="menu">
        <a href="/#intro">INTRODUCERE</a>
        <a href="/#first">DETALII</a>
        <a href="/#second">APLICATII</a>
        <a href="/#voluntar">FII VOLUNTAR!</a>
        <a href="/#third">FINAL</a>
    </div>
</div>

<div id="main-app">

    <div id="view">
        <a href="/viewCluster">Clusters</a>
        <a href="/viewDamage">Damages</a>
        <a href="/viewDistrict">Districts</a>
        <a href="/viewEarthquake">Earthquakes</a>
        <a href="/viewMunicipality">Municipalities</a>
        <a href="/viewVillage">Villages</a>
    </div>

    <div align="center">
        <section id="intro">
            <div class="article-intro">
                <h1>Edit/Add Earthquake</h1>

                <% Earthquake post = (Earthquake) request.getAttribute("Earthquake");
                %>
                <form action="saveEarthquake" method="post">
                    <table>
                        <tr>
                            <td> ID</td>
                            <td><input type="text" name="id" path="id" value="<%=post.getId()%>"></td>
                        </tr>
                        <tr>
                            <td> disID</td>
                            <td><input type="text" name="disID" path="disID" value="<%=post.getDisId()%>"></td>
                        </tr>
                        <tr>
                            <td> munID</td>
                            <td><input type="text" name="munID" path="disID" value="<%=post.getMunId()%>"></td>
                        </tr>
                        <tr>
                            <td> date</td>
                            <td><input type="text" name="date" path="date" value="<%=post.getDate()%>"></td>
                        </tr>
                        <tr>
                            <td> hazard</td>
                            <td><input type="text" name="hazard" path="hazard" value="<%=post.getHazard()%>"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Submit" style="color: #ffffff;"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
    </div>

</div>

</body>
</html>
