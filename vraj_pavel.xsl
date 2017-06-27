<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/">

    <html lang="cs" dir="ltr">
    <head>
      <meta charset="UTF-8"></meta>
      <title>Fotbalové týmy</title>
      <link rel="stylesheet" href="vraj_pavel.css" type="text/css"/>
    </head>
    <body>
      <main>
        <header>
          <h1>Přehled fotbalových týmů</h1>
          <div class="left">Seznam týmů v databázi. Autor: <xsl:value-of select="fotbalove_tymy/@autor"/></div>
        </header>
        <section>
          <table id="outer1">
            <thead>
              <tr bgcolor="#AA0000" id="outer1">
                <th id="outer1"><font color="#FFFFFF">Jméno</font></th>
                <th id="outer1"><font color="#FFFFFF">Země</font></th>
                <th id="outer1"><font color="#FFFFFF">Adresa</font></th>
                <th id="outer1"><font color="#FFFFFF">Odkaz</font></th>
                <th id="outer1"><font color="#FFFFFF">Barvy</font></th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="fotbalove_tymy/tym">
              <tr valign="top" id="outer1">
                <td rowspan="3" id="outer1"><h3><xsl:value-of select="jmeno_tymu"/></h3></td>
                <td id="outer1"><xsl:value-of select="zeme"/></td>
                <td id="outer1">
                  <xsl:apply-templates select="adresa"/>
                </td>
                <td id="outer1"><a href="{web_adresa}"><xsl:value-of select="web_adresa"/></a></td>
                <td id="outer1">
                  <p>
                    <table id="inner1">
                      <tr>
                        <xsl:for-each select="tymove_barvy/barva">
                        <td bgcolor="{kod_barvy}" width="20" height="20"></td>
                        </xsl:for-each>
                      </tr>
                    </table>
                    <ul>
                      <xsl:for-each select="tymove_barvy/barva">
                      <font color="{kod_barvy}"><li><xsl:value-of select="jmeno_barvy"/></li></font>
                      </xsl:for-each>
                    </ul>
                  </p>
                </td>
              </tr>
              <tr bgcolor="#AA0000">
                <td colspan="4" id="outer1"><center><font color="#FFFFFF"><strong>Hráči</strong></font></center></td>
              </tr>
              <tr>
                <td colspan="4">
                  <xsl:for-each select="hraci_tymu/hrac">
                  <table id="inner1">
                    <thead>
                      <tr>
                        <th colspan="2"><h3><xsl:value-of select="jmeno"/>&#xA0;<xsl:value-of select="prijmeni"/>&#xA0;(<xsl:value-of select="@cislo_dresu"/>)</h3></th>
                      </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>
                        <table id="inner1">
                          <tr>
                            <td>Národnost:</td>
                            <td><strong><xsl:value-of select="narodnost"/></strong></td>
                          </tr>
                          <tr>
                            <td>Narozen:</td>
                            <td><strong><xsl:value-of select="narozeni"/></strong></td>
                          </tr>
                          <tr>
                            <td>Pozice:</td>
                            <td><strong><xsl:value-of select="pozice"/></strong></td>
                          </tr>
                          <tr>
                            <td>V týmu od:</td>
                            <td><strong><xsl:value-of select="pocatek"/></strong></td>
                          </tr>
                        </table>
                      </td>
                      <td><xsl:apply-templates select="adresa"/></td>
                    </tr>
                    </tbody>
                  </table>
                  <table id="inner2">
                    <thead>
                      <tr bgcolor="#AAEEEE">
                        <th><strong>Tým</strong></th>
                        <th><strong>Pozice</strong></th>
                        <th><strong>Gólů</strong></th>
                        <th><strong>Od</strong></th>
                        <th><strong>Do</strong></th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="historie/predchozi_angazma">
                      <tr>
                          <td><xsl:value-of select="."/></td>
                          <td><xsl:value-of select="@pozice"/></td>
                          <td><xsl:value-of select="@golu"/></td>
                          <td><xsl:value-of select="@pocatek"/></td>
                          <td><xsl:value-of select="@konec"/></td>
                      </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                  </xsl:for-each>
                  <p></p>
                </td>
              </tr>
              <tr>
                <td colspan="5" bgcolor="#AA0000" id="outer1"></td>
              </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </section>
      </main>
    </body>
    </html>
  </xsl:template>
  
   <xsl:template match="adresa">
    <table id="inner1">
      <tr>
        <td>Ulice:</td>
        <td><strong><xsl:value-of select="ulice"/>&#xA0;<xsl:value-of select="ulice/@cislo_popisne"/>
          <xsl:if test="ulice/@cislo_orientacni != ''">
            /<xsl:value-of select="ulice/@cislo_orientacni"/>
          </xsl:if></strong>
        </td>
      </tr>
      <tr>
        <td>Město:</td>
        <td><strong><xsl:value-of select="mesto"/></strong></td>
      </tr>
      <tr>
        <td>PSČ:</td>
        <td><strong><xsl:value-of select="psc"/></strong></td>
      </tr>
      <tr>
        <td>&#xA0;</td>
        <td>&#xA0;</td>
      </tr>
    </table>
  </xsl:template>

</xsl:stylesheet>
