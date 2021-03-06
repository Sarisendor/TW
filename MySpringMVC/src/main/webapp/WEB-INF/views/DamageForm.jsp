<%@ page import="MySpringMVC.model.Damage" %>

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

                <h3>Modifica/Adauga un Damage</h3>

                <h4>Pentru a introduce un nou Damage, adaugati un ID inexistent si restul datelor</h4>
                <h4>Pentru a modifica un Damage existent, modificati doar campurile in afara de District ID</h4>

                <% Damage post = (Damage) request.getAttribute("Damage");
                %>
                <form action="saveDamage" method="post" modelAttribute="Damage">
                    <table>
                        <tr>
                            <td> District ID</td>
                            <td><input type="text" name="disId" path="disId" value="<%=post.getDisId()%>"></td>
                        </tr>
                        <tr>
                            <td> Victime - barbati</td>
                            <td><input type="text" name="maleDeath" path="maleDeath" value="<%=post.getMaleDeath()%>">
                            </td>
                        </tr>
                        <tr>
                            <td> Victime - femei</td>
                            <td><input type="text" name="femDeath" path="femDeath" value="<%=post.getFemDeath()%>">
                            </td>
                        </tr>
                        <tr>
                            <td> Raniti - barbati</td>
                            <td><input type="text" name="maleInjured" path="maleInjured" value="<%=post.getMaleInjured()%>">
                            </td>
                        </tr>
                        <tr>
                            <td> Raniti - femei</td>
                            <td><input type="text" name="femInjured" path="femInjured" value="<%=post.getFemInjured()%>">
                            </td>
                        </tr>
                        <tr>
                            <td> Cladiri daunate</td>
                            <td><input type="text" name="publicDamages" path="publicDamages" value="<%=post.getPublicDamages()%>">
                            </td>
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
