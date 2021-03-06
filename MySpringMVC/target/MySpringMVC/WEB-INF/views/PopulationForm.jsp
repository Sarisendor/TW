<%@ page import="MySpringMVC.model.Population" %>
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

    <div align="center">
        <section id="intro">
            <div class="article-intro">

                <div id="view">
                    <a href="/viewTables">Intoarce-te la tabele</a>
                </div>

                <h3>Modifica/Adauga o Populatie</h3>

                <h4>Pentru a introduce o noua Populatie, adaugati o combinatie Municipiu ID - Distrcit ID inexistenta</h4>
                <h4>Pentru a modifica o Populatie existenta, modificati orice in afara de ID-uri</h4>

                <% Population post = (Population) request.getAttribute("population");
                %>
                <form action="/savePopulation" method="post" modelAttribute="population">
                    <table>
                        <tr>
                            <td> Municipiu ID</td>
                            <td><input type="text" name="mun_id" path="mun_id" value="<%=post.getMunId()%>"></td>
                        </tr>
                        <tr>
                            <td> District ID</td>
                            <td><input type="text" name="dis_id" path="dis_id" value="<%=post.getDisId()%>"></td>
                        </tr>
                        <tr>
                            <td> Locuinte</td>
                            <td><input type="text" name="households" path="households" value="<%=post.getHouseholds()%>"></td>
                        </tr>
                        <tr>
                            <td> Barbati</td>
                            <td><input type="text" name="male_pop" path="male_pop" value="<%=post.getMalePop()%>"></td>
                        </tr>
                        <tr>
                            <td> Femei</td>
                            <td><input type="text" name="fem_pop" path="fem_pop" value="<%=post.getFempop()%>"></td>
                        </tr>
                        <tr>
                            <td> Densitate</td>
                            <td><input type="text" name="density" path="density" value="<%=post.getDensity()%>"></td>
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
